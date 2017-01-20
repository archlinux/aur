# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=polkit-kde-kcmodules-frameworks 
pkgver=20170120.g8d55dee
_revision=8d55deee00e385bad6897e470d7467f522db477c
pkgrel=1
pkgdesc="Set of configuration modules which allows administrator to change polkit settings."
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1'
license=('GPL')
provides=(polkit-kde-kcmodules)
conflicts=(polkit-kde-kcmodules)
depends=('kdelibs4support' 'polkit-qt5' 'kcmutils')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'kdesignerplugin')
source=("git+https://anongit.kde.org/polkit-kde-kcmodules-1.git#commit=${_revision}"
        "port_to_kf5.patch")
groups=('plasma')
md5sums=('SKIP'
         '85835fcd7d88a755ffe1be79b46183dd')

pkgver() {
  echo $(date "+%Y%m%d").g$(echo ${_revision}|cut -b 1-7)
}

prepare() {
  mkdir -p build
  cd polkit-kde-kcmodules-1
  patch -p1 -i "$srcdir/port_to_kf5.patch"
}

build() {
  cd build
  cmake ../polkit-kde-kcmodules-1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/qt/plugins/kcm_polkitconfig.so
  rm "$pkgdir"/usr/share/kservices5/kcm_polkitconfig.desktop
}
