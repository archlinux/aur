# Maintainer: teraflops <me@priet.us>
pkgname=roon-kit
pkgver=0.0.0
pkgrel=1
pkgdesc="Roon API Kit"
arch=('any')
url="https://github.com/Minterl/roon-kit"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'typescript')
source=("git+https://github.com/Minterl/roon-kit.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/roon-kit/packages/roon-kit"
  
  sed -i 's/"node-uuid":.*/"uuid": "^9.0.0",/' package.json
  npm config set legacy-peer-deps true
  npm install --package-lock-only
}

build() {
  cd "$srcdir/roon-kit/packages/roon-kit"
  
  npm ci
  tsc --outDir bin --skipLibCheck --sourceMap true
  
  declare -a required_files=(
    "bin/index.js"
    "bin/RoonExtension.js"
    "bin/RoonKit.js"
  )
  
  for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
      echo "ERROR: missing essential file: $file"
      exit 1
    fi
  done
}

package() {
  cd "$srcdir/roon-kit/packages/roon-kit"
  
  install -dm755 "$pkgdir/usr/lib/node_modules/roon-kit"
  cp -r package.json bin src tsconfig.json "$pkgdir/usr/lib/node_modules/roon-kit"
  
  npm install --production --prefix "$pkgdir/usr/lib/node_modules/roon-kit"
  
  local bin_path="$pkgdir/usr/lib/node_modules/roon-kit/bin"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "$bin_path/RoonKit.js" "$pkgdir/usr/bin/roon-kit"
  ln -s "$bin_path/RoonExtension.js" "$pkgdir/usr/bin/roon-extension"

  install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -exec chmod 644 {} +
}
