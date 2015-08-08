# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Christoph Haag <haagch at studi.informatik.uni-stuttgart.de>

pkgname=lib32-libglu-git
pkgver=9.0.0.r2.g0692115
pkgrel=1
pkgdesc="GL utility library for mesa builds from git after 2012-08-31"
arch=('x86_64')
url="http://mesa.freedesktop.org/"
license=('LGPL')
provides=('lib32-libglu' 'lib32-glu')
depends=('lib32-libgl' 'lib32-gcc-libs')
makedepends=('lib32-mesa')
conflicts=('lib32-libglu' 'lib32-glu')
options=(!libtool)
source=('git://cgit.freedesktop.org/mesa/glu/')

pkgver() {
        cd "${srcdir}/glu"

        if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
                echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
        else
                echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
        fi
}


build() {
  cd "${srcdir}/glu"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/glu"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/include/ || true
}
md5sums=('SKIP')
