# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>
 
_appname=Quaternion
_pkgname=quaternion
pkgname=quaternion-git
pkgver=0.0.9.4a.r139.ge56c41b
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=(GPL3)
depends=(hicolor-icon-theme qt5-multimedia qt5-tools qt5-quickcontrols qt5-quickcontrols2 qt5-olm)
makedepends=(cmake git)
optdepends=('qtkeychain: Store access tokens in a keyring')
provides=(quaternion)
source=('git://github.com/QMatrixClient/Quaternion'
        'git://github.com/quotient-im/libQuotient')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_appname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd $_appname
  git config submodule.lib.url $srcdir/libQuotient
  git submodule update
}

build()
{
  mkdir ${_appname}/build_dir -p
  cd ${_appname}/build_dir

  cmake .. \
      -DUSE_INTREE_LIBQMC=ON              \
      -DCMAKE_INSTALL_PREFIX=$pkgdir/usr  \
      -DCMAKE_BUILD_TYPE=Release

  cmake --build . --target all
}
 
package()
{
  cd ${_appname}

  cmake --install build_dir
  rm $pkgdir/usr/share/icons/*/icon-theme.cache
}
# vim:set ts=2 sw=2 et:
