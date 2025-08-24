# Maintainer: Adrien DUARTE <samtroulfion@proton.me>

pkgname=nrip
_pkg=NRip
pkgver=0.7.2
pkgrel=1
pkgdesc='Safe rm with a graveyard (rm, list, prune, resurrect)'
arch=('x86_64' 'aarch64')
url='https://github.com/Samtroulcode/NRip'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=("nrip=${pkgver}")
conflicts=('rip' 'rm-improved' 'rm-improved-git' 'rm-improved-bin' 'rip2-git')

source=("${_pkg}-${pkgver}.tar.gz::https://github.com/Samtroulcode/${_pkg}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d48075cc49b0877eb77af51fd561a1a13fae7ffe7b5f7214b7eeecbe3e0bb188')

prepare() {
  cd "$srcdir/${_pkg}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${_pkg}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/${_pkg}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/nrip
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/"
}
