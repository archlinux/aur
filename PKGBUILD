# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=macports-base
pkgname=$_pkgname-git
pkgver=2.4.0.beta1.r151.gf5e9264d
pkgrel=1
pkgdesc='The MacPorts command-line client'
url='https://www.macports.org/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('curl' 'mtree' 'openssl' 'sqlite')
# MacPorts comes with its own vendored tclsh, while a system interpreter
# is still needed to build tcllib
makedepends=('git' 'tcl')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/macports/$_pkgname"
        'fix-install.sh')
sha256sums=('SKIP'
            '59657974ca800933c0a1d997a90d171c10462e41dc313afd7a800984ddecd2f7')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  patch -Np1 -i ../fix-install.sh
}

build() {
  cd "$_pkgname"

  ./configure
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
}
