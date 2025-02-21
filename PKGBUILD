# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>
_pkgname="harper"
pkgname="${_pkgname}-git"
pkgver=1526.8578e2b
pkgrel=1
pkgdesc="The Grammar Checker for Developers"
arch=('x86_64')
url="https://github.com/elijah-potter/${_pkgname}"
license=("Apache-2.0")
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('harper')
conflicts=('harper')
options=(!lto)
source=($pkgname::git+https://github.com/elijah-potter/harper.git)

sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  cargo build --frozen --release --bin harper-cli --bin harper-ls
}

package() {
  cd $pkgname
  install -Dm 755 -t "${pkgdir}/usr/bin" \
      target/release/harper-cli \
      target/release/harper-ls
}

