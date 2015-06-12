# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname="wxbase2.8-git"
pkgver=head
pkgrel=1
pkgdesc="wxWidgets base libraries for no X install (2.8 branch development version)" 
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
makedepends=('git')
provides=('wxbase=2.8')
conflicts=('wxgtk' 'wxwidgets' 'wxbase')
source=("git+git://github.com/wxWidgets/wxWidgets.git")
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/wxWidgets"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/wxWidgets"
  git checkout WX_2_8_BRANCH
  ./configure \
	  --prefix=/usr \
	  --libdir=/usr/lib \
	  --disable-gui \
	  --disable-compat26 \
	  --enable-unicode \
	  --disable-precomp-headers
  make
} 

package() {
  cd "${srcdir}/wxWidgets"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/wxWidgets/LICENSE"
}
