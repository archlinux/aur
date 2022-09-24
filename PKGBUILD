# Maintainer: Ivan Zenin <i.zenin@gmx.com>
# Maintainer: Johann Klahn <kljohann@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=ledger-git
pkgver=latest
pkgrel=6
pkgdesc="A double-entry accounting system with a command-line reporting interface (development version)"
arch=('i686' 'x86_64')
url="http://ledger-cli.org"
license=('BSD')
depends=('mpfr' 'boost-libs' 'libedit')
provides=('ledger')
conflicts=('ledger')
makedepends=('boost' 'git' 'sed' 'cmake')
source=("git+https://github.com/ledger/ledger.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/ledger
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}"/ledger
}

build() {
  cd "${srcdir}"/ledger
  cmake . \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
  -DCMAKE_INSTALL_LIBDIR:PATH=lib \
  -DUSE_PYTHON=ON
  make
}

package () {
  cd "${srcdir}"/ledger
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}"/usr/include/ledger
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/ledger/LICENSE"
}
