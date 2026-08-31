# Maintainer: Aaron Coach <aur@awc.id.au>
pkgname=tracefinity
_pkgname=tracefinity
pkgver=0.9.2
pkgrel=1
pkgdesc="Generate custom gridfinity bins with AI, from photos of your tools"
arch=('x86_64')
url="https://github.com/tracefinity/tracefinity"
license=('MIT')
depends=('nodejs' 'python' 'glibc' 'gcc-libs' 'libglvnd' 'glib2' 'libsm' 'libxext' 'libxrender' 'libheif')
makedepends=('git' 'python-pip' 'python-virtualenv' 'npm')
backup=('etc/tracefinity/tracefinity.env')
optdepends=('nginx: Reverse proxy to combine frontend and backend on a single port')
install='tracefinity.install'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tracefinity/tracefinity/archive/refs/tags/${pkgver}.tar.gz"
  "tracefinity-backend.service"
  "tracefinity-frontend.service"
  "tracefinity.sysusers"
  "tracefinity.tmpfiles"
  "tracefinity.nginx.conf"
  "tracefinity.env")

sha256sums=('70dd8038c5756f9eb13b78fff6a447198ab01d653f12413a08cd4a09ce7f197e'
            'd4f393ee489dc518bf42a93d8ace1322bc7edd68d96a5d676a7f0b00f948e773'
            '7e50478cde51f9c618eeeb09e7529f9471b2e0bd463c72987fb7415eba3adf35'
            '7be50bd94eefbbb8907f5f150761b76e16f65f7a2527f2bb371cac426303cf2d'
            '69751a017f2f4d5b89b69efaf5958a9db4728e2352ce9476ac677341a201f2a6'
            '0fe90b1c7354e22f4fe69ac69d5005e35addf86a02069e4ed60e57480a0e911f'
            'd6ce79dca841cdbde9e68c5dfd2aead1930263c89b03f8db8a2b4e7d06fcfeb1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  msg2 "Building frontend..."
  cd frontend

  # Remove test files so Next.js doesn't type-check them during the build
  find src -type f -name "*.test.ts*" -delete

  npm install --cache "$srcdir/npm-cache" --no-audit --no-fund --legacy-peer-deps

  NEXT_TELEMETRY_DISABLED=1 NEXT_PUBLIC_API_URL= npm run build

  msg2 "Pruning frontend development dependencies..."
  npm prune --omit=dev --legacy-peer-deps
  cd ..

  msg2 "Building backend virtualenv..."
  python -m venv "$srcdir/venv"
  source "$srcdir/venv/bin/activate"
  pip install --upgrade pip

  pip install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cpu
  pip install --no-cache-dir -r backend/requirements.txt

  find "$srcdir/venv" -type d -name "__pycache__" -exec rm -rf {} +
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -d "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/venv" "$pkgdir/opt/$_pkgname/"

  install -d "$pkgdir/opt/$_pkgname/backend"
  cp -a backend/* "$pkgdir/opt/$_pkgname/backend/"

  install -d "$pkgdir/opt/$_pkgname/frontend"
  cp -a frontend/.next "$pkgdir/opt/$_pkgname/frontend/"
  cp -a frontend/public "$pkgdir/opt/$_pkgname/frontend/"
  cp frontend/package*.json "$pkgdir/opt/$_pkgname/frontend/"
  cp -a frontend/node_modules "$pkgdir/opt/$_pkgname/frontend/"

  # Fix python venv shebang paths (makes the venv portable to /opt/tracefinity)
  find "$pkgdir/opt/$_pkgname/venv/bin" -type f -exec sed -i "s|$srcdir/venv|/opt/$_pkgname/venv|g" {} +

  # Inject the package version into the backend systemd service
  sed -i "/^Environment=\"STORAGE_PATH=/a Environment=\"APP_VERSION=${pkgver}\"" "$srcdir/tracefinity-backend.service"

  install -Dm644 "$srcdir/tracefinity-backend.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/tracefinity-frontend.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/tracefinity.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/tracefinity.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

  install -Dm600 "$srcdir/tracefinity.env" "$pkgdir/etc/$_pkgname/$_pkgname.env"
  install -Dm644 "$srcdir/tracefinity.nginx.conf" "$pkgdir/etc/$_pkgname/nginx.example.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
