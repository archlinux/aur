pkgname=viseron
pkgver=3.5.3
pkgrel=1
pkgdesc="Self-hosted, local only NVR with object detection"
arch=('x86_64')
url="https://github.com/roflcoopter/viseron"
license=('MIT')
depends=(
    'ffmpeg'
    'go2rtc'
    'postgresql-libs'
    'python'
    'python-dlib'
    'python-gobject'
    'python-numpy'
    'python-pillow'
    'python-psycopg2'
    'python-pytorch'
    'python-requests'
    'python-scikit-learn'
    'python-torchvision'
    'python-yaml'
    'cpulimit'
)
optdepends=(
    'libedgetpu: for USB Coral support'
    'cuda: for GPU support'
)
makedepends=(
    'cmake'
    'gcc'
    'gobject-introspection'
    'nodejs'
    'npm'
    'pkgconf'
    'python-pip'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/roflcoopter/viseron/archive/refs/tags/v${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/AlexxIT/go2rtc/v1.9.9/www/video-rtc.js"
    "viseron.service"
    "viseron-go2rtc.service"
    "viseron.sysusers"
    "viseron.tmpfiles"
    "viseron-nginx.conf"
    '01-setup.patch'
    '02-arch-fixes.patch'
    '03-arch-ffmpeg-path.patch'
    '04-go2rtc-config-path.patch'
    '05-arch-python3.14-fork.patch'
    '06-disable-playwright.patch'

)
b2sums=('9a830c0c18dca0576a210cf71fb494283b0ad90b0eb9973574c545c32fca446886ef1782e081cdc9bd7c011fbf20c33ef0cb156923cf2939220c200b6a27b99f'
        '45897a2392b7b84a630999ba6c9680754c0902cdd0907ef3a26a3a36f761ed479dc1fa6d21262d93081c92bbe1852efadde85542f67c31f5a63e2a75da628208'
        '5566b37aaa83c3f8d7862ea4148f5d71855c337d932c57fe4ec16466df6b0ff21ef3a90861237581beb7ef2cfadaac2ca581c65cb8eea532a9be0c98a8cb740b'
        'bf5c9abe11e112157d67e267fc906702ee13ce6937cf31a3a434acc55f45f0fcb09488a21391d8f8e15968da59b3e5b3caa9dc1b94a9371cedf5fd1ab08fc629'
        '9f7963c50af8ced548f868a3a2d6bfe7819feb9870244ef5efd8b22bdbe9465b4eece7f2208482b272bb3c8f91c1fe48fe9c85f4e1f3b213be93edfd9a0eea8e'
        'a452832d65227f565bc18ca5a6bc0dfc3cb59a82ba44dbf5d788d4809b6e44c42445c760357dc48d5074d0d3131607eac8b47dfd1b46e29bd84f25c189b4cd65'
        '8869068c2d23078adc84670b30c8db39754e4cc07f115cf74060dfc1b2037ff9aaacbda56a295b4d9f10314e026f575ac8d1794a60ea43da52adf94294473ea1'
        'a3171e1dd064c362048b11aed8d5ca2144882f9d214a5a60875a0b207067cab788631b52fb42f483deb36f39b15d0cd150cf220a3f651eb304d609be64db0192'
        '1615bfdcb91866a721c6f0d496fb34a9fdaaf995b82278c7afa7445d7043007f7a735b208e234b9338705010eb7013815b15116abb6fcd10cd86e52e0945764e'
        '3a9dd8e33300e8d8b4404ee29b0bd4c597afb79edf0c84dbfd4df37b6ebf0fd242437061c02e966b96782f523b729bed449eb74e3acd299651dbd869ceaab11c'
        'acf86c47b8f18ca7fbd102673ea976ba00b20b5473a40d19fe43cb9a10957a58092dbfcbd8c0e1e4b9475106f41b58285166b0327e435065bd4b12cc7bb968af'
        '1dd80f11d7b4a6ab3dda035da8d00d46822125f680cee1d934ba552f40b17af58c5231ebad3610f932f72ad7f4ad4c963dd7fbd0fd924145de9f196d0620bee2'
        '33d3f613c9c73eb8e4c2071759bd7765a411a47db9a52aad23979f547829116c319eb1a4841c290d7b08ffa7ab2ae83d7c2ed43e51b9c91a2727ec4c6b247e61')

prepare() {
  cd "$pkgname-$pkgver"

  local p
  for p in "$srcdir"/*.patch; do
    if [ -f "$p" ]; then
      msg2 "Applying patch: $(basename "$p")"
      patch -Np1 -i "$p"
    fi
  done

  sed -i 's/==/>=/' requirements.txt
}

build() {
  export NODE_OPTIONS=--max-old-space-size=4096

  cd "$pkgname-$pkgver"

  pushd frontend > /dev/null
  npm ci --legacy-peer-deps
  cp "${srcdir}/video-rtc.js" src/components/player/liveplayer/

  npm run build
  popd

  mkdir -p viseron/frontend
  cp -r frontend/dist/* viseron/frontend/
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 "$srcdir/viseron.service" "$pkgdir/usr/lib/systemd/system/viseron.service"
  install -Dm644 "$srcdir/viseron-go2rtc.service" "$pkgdir/usr/lib/systemd/system/viseron-go2rtc.service"
  install -Dm644 "$srcdir/viseron.sysusers" "$pkgdir/usr/lib/sysusers.d/viseron.conf"
  install -Dm644 "$srcdir/viseron.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/viseron.conf"
  install -Dm644 "$srcdir/viseron-nginx.conf" "$pkgdir/usr/share/doc/$pkgname/nginx.conf.example"

  install -d "$pkgdir/usr/lib/viseron"
  python -m venv --system-site-packages "$pkgdir/usr/lib/viseron"
  source "$pkgdir/usr/lib/viseron/bin/activate"

  pip install --upgrade pip
  pip install -r requirements.txt

  # Viseron expects to run from its source tree.
  cp -r manager.py viseron "$pkgdir/usr/lib/viseron/"

  pip cache purge
  find "$pkgdir/usr/lib/viseron" -type d -name "__pycache__" -exec rm -rf {} +
}
