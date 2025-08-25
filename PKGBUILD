# Maintainer: Adrien DUARTE <samtroulfion@proton.me>

pkgname=nrip
_pkg=NRip
pkgver=0.8.5
pkgrel=1
pkgdesc='Safe rm with a graveyard (rm, list, prune, resurrect, fzf integration)'
arch=('x86_64' 'aarch64')
url='https://github.com/Samtroulcode/NRip'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'fzf')
makedepends=('cargo')
provides=("nrip=${pkgver}")
#conflicts=()

source=("${_pkg}-${pkgver}.tar.gz::https://forgejo.dirty-flix-servarr.fr/Samda/${_pkg}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ce95837d2ba47a397721cde7252de6080c0c5005e43d2eb1dfae9b5620dbea9')

prepare() {
  cd "$srcdir/${pkgname}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/nrip
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/"
}
