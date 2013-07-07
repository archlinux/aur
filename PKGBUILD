# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-rtt
_pkgname=orocos-toolchain
pkgver=2.6.0
pkgrel=3
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Real-Time Toolkit)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('boost-libs')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2
        boost.diff
        scripting_fix.diff)
md5sums=('ac68f90da0d7c4595e5d78687d68ab2f'
         'e4fa9508a90d20a5437ceed5ec8b72ff'
         '0006918a6a0687f59b477b537ff571b8')
sha256sums=('d98adaf4975ffef6b79b7d31f16c488014e347afbc5549910f209db4a9f469fd'
            '6f242c19983e556505206cda3406060c3d93652d21d8fabf537dbcbd2d7e7b0b'
            '9047e7e47c6db32a883bde58a48a69a8325a1d2ab2555c1f154db1b789204308')
sha384sums=('6fc673dd6a5f034b21f87b2171f6303077a5759cdcc7c9dd745e44b1a51a7a5a4028455c6588b24556d2d3907dd5b372'
            'aa629cf52c075f6a84c1ca33c7b75cb947d65ac6254e85173bc74a7a44c18743a6780d181b3a6b79aa823d2215177e63'
            'cad4c573dd76a728a97a16cf34297a02dacbfb3ab7af9669d9f23989f161cb7a7cab941ac9a94d81736797a5c538d5c4')
sha512sums=('7d30ac8bb751c489302cb15c8a613345aabb2023c935c04f371bb35b52faabd9563e20da384fbe409a7f4533c133eea983484800680d22737be95b37653a6be9'
            '31b88512783b07218cbda58a292f98fae190610ea4e8cc03472d4c81656b299015ecc2c256ecd70b70617046f2aad17bf5a5fcb3072f608840453592eda29410'
            '8dd3c1750e83e5295fd9c59da514c26673a30909753f331d86d51dc92f2896d1d80666e09fb01e8a5afcdf5c35b58f71f2220dc679ef8ca050c86dbc5ec5fe04')

build() {
  # build rtt
  cd "${srcdir}/${_pkgname}-${pkgver}/rtt"

  patch -p1 < "${srcdir}/boost.diff"
  patch -p1 < "${srcdir}/scripting_fix.diff"

  # update the cmake configuration file so that it finds the RTT
  sed 's/set(OROCOS-RTT_FOUND ${OROCOS-RTT_IMPORT_FILE})/set(OROCOS-RTT_FOUND TRUE)/g' -i orocos-rtt-config.cmake

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  # install rtt
  cd "${srcdir}/${_pkgname}-${pkgver}/rtt"
  make DESTDIR=${pkgdir} install
}

