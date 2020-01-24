# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=castor
pkgname=castor-git
pkgver=0.4.0.r1.g7f50a34
pkgrel=1
pkgdesc="A gemini, gopher and finger graphical client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('unknown')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'atk' 'cairo' 'openssl')
makedepends=('git' 'rust' 'cargo')
source=("${_pkgname}::git+${url}"
        'castor-0.4.0-install.patch')
sha256sums=('SKIP'
            'a659bb60626aa505b6f61f2a4669304a9806717858c79facc69b101879e4d0e2')

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
  patch -p1 -i ../castor-0.4.0-install.patch
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
