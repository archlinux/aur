# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=fcp
pkgname=fcp-git
pkgver=v0.2.2.r0.gf8db060
pkgrel=1
pkgdesc="A faster rust cp command"
arch=('i686' 'x86_64')
url='https://github.com/Svetlitski/fcp'
license=('BSD')
makedepends=('git' 'cargo')
provides=('fcp')
conflicts=('fcp')
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
  cargo build --release --locked --all-features
}

package() {
  cd "${_pkgname}"
  install -Dvm755 target/release/fcp -t "${pkgdir}/usr/bin"
  install -Dvm644 LICENSE README.md -t "${pkgdir}/usr/share/doc/fcp"
}
