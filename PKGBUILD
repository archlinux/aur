# Maintainer: joegruff
pkgname=bisonw
pkgver=1.0.5
pkgrel=1
pkgdesc="Self-custody multi-coin wallet with atomic swap capability, by Decred."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
makedepends=('go>=1.24' 'npm')
groups=('decred')
url="https://dex.decred.org"
license=('custom:BlueOak-1.0.0')
options=('!strip' '!emptydirs')
source=("https://github.com/decred/dcrdex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a89c6b5250d1ee4b1adc23e56078f22585794445f8ad54145ded73e7e95fee6c')

build() {
  cd "dcrdex-$pkgver"
  mkdir -p build
  go build -trimpath -ldflags "-s -w" -o ./build/bwctl ./client/cmd/bwctl
  cd client/webserver/site
  go generate
  npm ci
  npm run build
  cd ${srcdir}/dcrdex-$pkgver/client/cmd/bisonw
  go build -trimpath -ldflags "-s -w" -o ${srcdir}/dcrdex-$pkgver/build/bisonw .
}

package() {
  cd "${srcdir}/dcrdex-$pkgver"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/dcrdex/LICENSE"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/bisonw"
  install -Dm 755 ./build/bisonw -t "$pkgdir/usr/bin"
  install -Dm 755 ./build/bwctl -t "$pkgdir/usr/bin"
}

