# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=graspit
pkgver=2.2
pkgrel=2
pkgdesc="Environment for grasp analysis and planning."
arch=('i686' 'x86_64')
url="http://www.cs.columbia.edu/~cmatei/graspit/"
license=('GPL')
depends=('qhull' 'soqt' 'lapack')
source=(http://downloads.sourceforge.net/project/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz
        graspit)
md5sums=('608dbe0ef3e610bcd2870414e6ad5476'
         'fd67b4f3927cbfc24f1dab8e52dac3e1')
sha256sums=('98eee3dd647032eb1e4d42f35bc449f8f8611d184437506b15b76a51a11cf568'
            'c8ea82f744b08fdc63154ea1b9347d302b8e219f91ed0f4da75d093570a14814')
sha384sums=('cdf0c4ffd16fcca564f223506abc57aea47eef358a5e6978b19a146da33e3eb2bf2a8d06f6174a711e5f2f463f5a4a31'
            '10ac5747e6f3ebb7f291f786716dbc13527174472c650c48539a3bdf1f6d6e23de0785e17f25252f5b7712743580c532')
sha512sums=('065f5be25ea28740797db61069156edbf56b0198527d5f99e543c5882430d5ed9aebfecfbbdf0ea62ed4ba34320c155536ec7877f6356df5e9f0e451d3105455'
            'dc8833a91f8ec659fede3b63b3e3196cf8d55f1ddfc2e830afeec563cbb150038d00182fd6999482b44ae5ea2b18b807200120e9f035cf3be4cec477051839c6')

build() {
  cd "${srcdir}/Graspit"

  qmake graspit.pro EXT_DESTDIR="${pkgdir}/usr/share/graspit" ADDITIONAL_INCLUDE_DIR=/usr/include/libqhull ADDITIONAL_LINK_FLAGS=-ldl
  make
}

package() {
  cd "${srcdir}/Graspit"

  make install

  # include 3D models and worlds
  install -dm755 "${pkgdir}/usr/share/graspit"
  cp -r models "${pkgdir}/usr/share/graspit/"
  cp -r worlds "${pkgdir}/usr/share/graspit/"

  # include all header files
  install -dm755 "${pkgdir}/usr/include/graspit"
  cp -r include/* "${pkgdir}/usr/include/graspit/"
  cp -r ui/*.h "${pkgdir}/usr/include/graspit/"
  cp -r ui/Planner/*.h "${pkgdir}/usr/include/graspit/"
  cp -r ui/EGPlanner/*.h "${pkgdir}/usr/include/graspit/"
  cp -r src/Collision/*.h "${pkgdir}/usr/include/graspit/"

  # create a directory for plugins
  install -dm755 "${pkgdir}/usr/share/graspit/plugin"

  # install a shell script that intializes environment variables
  # and starts graspit
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/graspit" "${pkgdir}/usr/bin"
}

