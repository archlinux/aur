# Maintainer: Morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>
 
_appname=Quaternion
_pkgname=quaternion
pkgname=quaternion-git
_soname=libQMatrixClient
_libname=libqmatrixclient
pkgver=0.0.9.4a.r36.g05c1819
pkgrel=2
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=(GPL3)
depends=(hicolor-icon-theme qt5-multimedia qt5-tools qt5-quickcontrols qt5-quickcontrols2)
makedepends=(cmake git)
optdepends=('qtkeychain: Store access tokens in a keyring')
provides=(quaternion)
conflicts=(quaternion-git)
source=('git://github.com/QMatrixClient/Quaternion'
        'git://github.com/QMatrixClient/libqmatrixclient'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_appname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -r ${_libname}/* ${srcdir}/${_appname}/lib/
}

build() {
  mkdir ${_appname}/build_dir -p
  cd ${_appname}/build_dir
  cmake .. -DBUILD_SHARED_LIBS:BOOL=ON -DUSE_INTREE_LIBQMC=true
  cmake --build . --target all
}
 
package() {
  cd ${_appname}

  # The binary
  install -Dm755 "build_dir/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # .desktop file
  install -Dm644 "linux/com.github.quaternion.desktop" -t "${pkgdir}/usr/share/applications/"

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
  cp build_dir/lib/${_soname}.so.0.*.0 ${pkgdir}/usr/lib/
  ln -s /usr/lib/${_soname}.so.0.*.0 ${pkgdir}/usr/lib/${_soname}.so.0
  ln -s /usr/lib/${_soname}.so.0.*.0 ${pkgdir}/usr/lib/${_soname}.so
}
# vim:set ts=2 sw=2 et:
