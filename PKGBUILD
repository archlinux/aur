# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=castor
pkgname=castor-git
pkgver=0.7.0.r6.g188cd6c
pkgrel=1
pkgdesc="A gemini, gopher and finger graphical client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('unknown')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'atk' 'cairo' 'openssl')
makedepends=('git' 'rust' 'cargo')
source=("${_pkgname}::git+${url}"
        castor-0.7.0-makefile.patch)
sha256sums=('SKIP'
            '5ac7e5460d00176db71ec0d7972af1adee58c57dd9d7dff29ddecbadb07f4ee9')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"

  # Fix installing to pkgdir
  patch -p1 -i ../castor-0.7.0-makefile.patch
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
