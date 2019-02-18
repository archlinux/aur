# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Alexander Zhuk <zhuk.a.v@gmail.com>
# Contributor: Wiadufa Chen <wiadufachen@gmail.com>

pkgname=wxformbuilder-git
_gitname=wxFormBuilder
pkgver=3.9.0.r48f2f0f
pkgrel=1
pkgdesc="Designer, GUI builder, and RAD tool For wxWidgets"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/wxformbuilder/"
license=('GPL')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn')
depends=('wxgtk' 'boost')
makedepends=('git')
source=("git://github.com/wxFormBuilder/wxFormBuilder.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  local release="$(awk '/Version/{print $2}' output/resources/about.html | tr '[:blank:]-:' '.')"
  local gitver="$(git show --summary | grep commit | sed 's/commit //')"

  printf "%s.r%s" "${release}" "${gitver:0:7}"
}

prepare() {
  cd "$srcdir/${_gitname}"

  git submodule init
  git submodule update
}

build() {
  # build premake manually
  cd "$srcdir/${_gitname}/build/premake/linux"

  # Remove conflicting left over objects from a bad github commit.
  rm -rf obj > /dev/null 2>&1

  # Generate builds files with premake
  cd "$srcdir/${_gitname}"
  ./create_build_files4.sh

  # Just to make sure we are on the upper dir.
  cd "$srcdir/${_gitname}"
  cd build/$(wx-config --release)/gmake

  make config=release
}

package() {
  cd "$srcdir/${_gitname}"

  install -m755 -d "$pkgdir"/usr/{lib,share}/wxformbuilder "$pkgdir"/usr/bin  "$pkgdir"/usr/share/mime/packages/
  install -m755 output/bin/wxformbuilder "$pkgdir"/usr/bin
  cp -r output/{xml,resources,plugins} "$pkgdir"/usr/share/wxformbuilder
  cp -r output/lib install/linux/data/gnome/usr/share "$pkgdir"/usr
  install -m644 install/linux/debian/wxformbuilder.sharedmimeinfo "$pkgdir"/usr/share/mime/packages/wxformbuilder.xml
}
