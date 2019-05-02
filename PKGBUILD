# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=keepassx-dark-git
pkgver=2.0.3.r84.g0d0c630
pkgrel=1
pkgdesc="It is an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/keepassx/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'libqdark-git')
makedepends=('git' 'intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-git' 'keepassx-svn' 'keepassx2-git' 'keepassx' 'keepassx2' 'keepassx2-yubikey-git')
provides=("keepassx"{,2}"=${pkgver}" "keepassx-svn=${pkgver}" "keepassx2-git=${pkgver}")
options=(!emptydirs)
source=("${pkgname%-*}::git+https://github.com/suratovvlad/keepassx.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  mkdir -p build
  sed -r 's|(keepassx)|\12|g' -i CMakeLists.txt share/linux/keepassx.desktop
  sed -r 's|(keepassx)(\.desktop\|\.xml)|\12\2|g' -i share/CMakeLists.txt
  sed -r 's|(KeePassX)|\1 2|g' -i share/linux/keepassx.desktop
  rename 'keepassx' 'keepassx2' share/linux/keepassx.{desktop,xml}
  find -name '*.png' -exec optipng -quiet -force -fix {} \;
}

build() {
  cd "${pkgname%-*}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    -DWITH_GUI_TESTS=ON \
    -DLIBQDARK_INCLUDE_DIR=/usr/include/libqdark \
    -DCMAKE_BUILD_TYPE=Release ..
  make
}

#check() {
#    cd "${pkgname%-*}/build"
#    make test
#}

package() {
  cd "${pkgname%-*}/build"
  make DESTDIR="${pkgdir}" install
  rename 'keepassx' 'keepassx2' "${pkgdir}"/usr/share/icons/hicolor/*/*/keepassx.png
}
