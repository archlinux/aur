# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ncgopher
pkgname=ncgopher-git
pkgver=v0.4.0.r70.g12de57a
pkgrel=1
pkgdesc='A gemini and gopher console client'
arch=('i686' 'x86_64')
url='https://github.com/jansc/ncgopher'
license=('BSD')
depends=('ncurses' 'openssl' 'sqlite')
makedepends=('git' 'rust' 'cargo')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -d -m 0755 "${pkgdir}/usr/bin"
  install -m 0755 target/release/${_pkgname} "${pkgdir}/usr/bin"

  install -d -m 0755 "${pkgdir}/usr/share/man/man1"
  install -m 0644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m 0644 CHANGELOG LICENSE \
    "${pkgdir}/usr/share/doc/${_pkgname}"
}
