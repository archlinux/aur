# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=wxbase-git
pkgver=latest
pkgrel=5
pkgdesc="wxWidgets base libraries for no X install (3.x branch development version)" 
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('git')
provides=('wxbase=3.1')
conflicts=('wxgtk' 'wxwidgets' 'wxbase')
source=("git+git://github.com/wxWidgets/wxWidgets.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/wxWidgets
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"/wxWidgets
  git submodule update --init 3rdparty/catch
  ./configure \
 	  --prefix=/usr \
	  --libdir=/usr/lib \
	  --disable-gui \
	  --disable-compat28 \
	  --enable-unicode \
	  --disable-precomp-headers
  make
} 

package() {
  cd "${srcdir}"/wxWidgets
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/wxWidgets/LICENSE"
}
