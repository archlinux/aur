# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Alexander Zhuk <zhuk.a.v@gmail.com>
# Contributor: Wiadufa Chen <wiadufachen@gmail.com>

pkgname=wxformbuilder-git
_gitname=wxFormBuilder
pkgver=3.9.0.r188.g0eccdbc5
pkgrel=1
pkgdesc="Designer, GUI builder, and RAD tool For wxWidgets"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wxformbuilder/"
license=('GPL')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn')
depends=('wxgtk' 'boost')
makedepends=('git' 'ninja' 'meson')
source=("git://github.com/wxFormBuilder/wxFormBuilder.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v\([0-9]\)/\1/g'
}

prepare() {
  cd "$srcdir/${_gitname}"
  git submodule update --init
}

build() {
  cd "$srcdir/${_gitname}"
  meson _build --prefix /usr
  ninja -j$(nproc) -C _build
}

package() {
  cd "$srcdir/${_gitname}"

  DESTDIR="${pkgdir}" ninja -C _build install

  mkdir -p "$pkgdir"/usr/share/mime/packages/
  cp -r install/linux/data/gnome/usr/share "$pkgdir"/usr
  install -m644 install/linux/debian/wxformbuilder.sharedmimeinfo "$pkgdir"/usr/share/mime/packages/wxformbuilder.xml
}
