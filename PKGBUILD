# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>
 
appname=Quaternion
_pkgname=quaternion
pkgname=quaternion-git
libname=libQMatrixClient
_libname=libqmatrixclient
pkgver=0.0.9.3.r159.59d41e2
_libqmatrixclient_pkgver=0.5.0
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=(GPL3)
depends=(qt5-declarative hicolor-icon-theme)
makedepends=(cmake)
provides=(quaternion)
conflicts=(quaternion-git)
source=('git://github.com/QMatrixClient/Quaternion'
        'git://github.com/QMatrixClient/libqmatrixclient'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $appname
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cp -r ${_libname}/* ${srcdir}/${appname}/lib/
}

build() {
  mkdir ${appname}/build_dir -p
  cd ${appname}/build_dir
  cmake .. -DBUILD_SHARED_LIBS:BOOL=ON -DUSE_INTREE_LIBQMC=true
  cmake --build . --target all
}
 
package() {
  cd ${appname}

  # The binary
  install -Dm755 "build_dir/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # .desktop file
  install -Dm644 "linux/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

  # Icons
  install -Dm644 "icons/quaternion/16-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/16x16/apps/"
  install -Dm644 "icons/quaternion/22-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/22x22/apps/"
  install -Dm644 "icons/quaternion/32-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm644 "icons/quaternion/48-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
  install -Dm644 "icons/quaternion/64-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  install -Dm644 "icons/quaternion/128-apps-quaternion.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "icons/quaternion/sources/quaternion.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

  # The lib
  mkdir ${pkgdir}/usr/lib
  mv build_dir/lib/${libname}.so.0.5.0 ${pkgdir}/usr/lib/
  ln -s /usr/lib/${libname}.so.0.5.0 ${pkgdir}/usr/lib/${libname}.so.0
  ln -s /usr/lib/${libname}.so.0.5.0 ${pkgdir}/usr/lib/${libname}.so
}
# vim:set ts=2 sw=2 et:
