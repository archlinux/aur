# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>

pkgbase=openxcom-git
pkgname=('openxcom-git' 'openxcom-docs-git')
_gitname=OpenXcom
pkgver=1.0_1037_g894263b
pkgrel=1
arch=('i686' 'x86_64')
url="http://openxcom.org/"
license=('GPL3')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer'
             'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp51' 'libgl' 'gcc-libs' 'glibc'
             'boost' 'glu' 'cmake' 'hicolor-icon-theme')
source=(git+"https://github.com/SupSuper/${_gitname}.git"
        "openxcom.sh")
sha256sums=('SKIP'
            'e30fa48364c66e510825f18e406381811ddffb78b5e8641e6a147b613f36cdc0')

pkgver() {
  cd $_gitname
  git describe --tags | sed -e 's:v::' -e 's:-:_:g'
}

# By default, openxcom builds with -Werror, which causes the build to fail if a compiler
# warning is encountered. Uncomment the following prepare function to turn this off.
#prepare() {
#  cd $_gitname
#  sed -i 's:werror=yes:werror=no:' configure.ac
#}

build() {
  cd $_gitname
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DYAMLCPP_LIBRARY="/opt/yaml-cpp51/lib/libyaml-cpp.so.0.5.1" -DYAMLCPP_INCLUDE_DIR="/opt/yaml-cpp51/include"
  make

  # Make documentation
  cd docs
  make doxygen
}

package_openxcom-git() {
  pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
  depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp51' 'libgl' 'gcc-libs'
           'glibc' 'hicolor-icon-theme')
  optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam')
  provides=('openxcom')
  conflicts=('openxcom')
  install="${pkgname}.install"

  cd $_gitname

  make DESTDIR="$pkgdir" install

  # Move actual binary
  mv "$pkgdir/usr/bin/openxcom" "$pkgdir/usr/share/openxcom/common/openxcom"
  # Install wrapper script
  install -Dm755 "$srcdir/openxcom.sh" "$pkgdir/usr/bin/openxcom"
}

package_openxcom-docs-git() {
  pkgdesc="Documentation for the open-source reimplementation of the famous X-COM game (git-version)"
  arch=('any')
  cd $_gitname/docs
  install -dm755 "$pkgdir/usr/share/doc/openxcom/"
  cp -a html "$pkgdir/usr/share/doc/openxcom/"
}
