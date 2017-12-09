# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname="wxbase"
pkgver=latest
pkgrel=5
pkgdesc="wxWidgets base libraries for no X install (3.x branch stable version)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
provides=('wxbase')
conflicts=('wxgtk' 'wxwidgets' 'wxbase')
source=("https://github.com/wxWidgets/wxWidgets/releases/latest")
md5sums=('SKIP')

build() {
  cd "${srcdir}/wxWidgets"
  ./configure \
 	  --prefix=/usr \
	  --libdir=/usr/lib \
	  --disable-gui \
	  --disable-compat28 \
	  --enable-unicode \
	  --disable-precomp-headers
  make
}

pkgver() {
  curl -s https://api.github.com/repos/wxWidgets/wxWidgets/releases/latest | grep tarball_url | sed 's/^.*\/v\(.*\)".*$/\1/'
}

package() {
  cd "${srcdir}/wxWidgets"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/wxWidgets/LICENSE"
}
