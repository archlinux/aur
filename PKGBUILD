# Maintainer: Sam Tay <sam dot chong dot tay at gmail dot com>
pkgname=so-git
_pkgname=so
pkgver=r109.1b0b2f9
pkgrel=1
pkgdesc="A terminal interface for StackOverflow"
arch=('any')
url="https://github.com/samtay/so"
license=('MIT')
depends=('openssl')
makedepends=('git' 'rust' 'cargo')
provides=('so')
conflicts=('so' 'so-bin')
source=('git+https://github.com/samtay/so')
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}" || exit 1
  # Patch version
  sed -i 's/^version = "\(.*\)"/version = "\1-aur-'${pkgver}'"/' Cargo.toml
  cargo build --release
}

pkgver() {
  cd "$srcdir/${_pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}" || exit 1
  # install binary
  install -D -o root -g root -m 755 target/release/so "$pkgdir/usr/bin/${_pkgname}"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
