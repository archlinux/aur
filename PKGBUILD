# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Alexander Zhuk <zhuk.a.v@gmail.com>
# Contributor: Wiadufa Chen <wiadufachen@gmail.com>

pkgname=wxformbuilder-svn
pkgver=3.5.2.RC2.r2227
pkgrel=1
pkgdesc="Designer, GUI builder, and RAD tool For wxWidgets"
arch=('i686' 'x86_64')
provides=('wxformbuilder')
conflicts=('wxformbuilder')
depends=('wxgtk')
makedepends=('subversion')
source=("wxformbuilder::svn+http://svn.code.sf.net/p/wxformbuilder/code/3.x/trunk")
md5sums=('SKIP')
url="http://wxformbuilder.sourceforge.net/"
license=('GPL')

pkgver() {
  cd "${srcdir}/wxformbuilder"
  local release="$(awk '/Version/{print $2}' output/resources/about.html | tr '[:blank:]-:' '.')"
  local svnver="$(svnversion)"
  printf "%s.r%s" "${release}" "${svnver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/wxformbuilder"
  ./create_build_files4.sh
  cd build/$(wx-config --release)/gmake
  make config=release
}

package() {
  cd "$srcdir/wxformbuilder"

  install -m755 -d "$pkgdir"/usr/{lib,share}/wxformbuilder "$pkgdir"/usr/bin  "$pkgdir"/usr/share/mime/packages/
  install -m755 output/bin/wxformbuilder "$pkgdir"/usr/bin
  cp -r output/{xml,resources,plugins} "$pkgdir"/usr/share/wxformbuilder
  cp -r output/lib install/linux/data/gnome/usr/share "$pkgdir"/usr
  install -m644 install/linux/debian/wxformbuilder.sharedmimeinfo "$pkgdir"/usr/share/mime/packages/wxformbuilder.xml
}
