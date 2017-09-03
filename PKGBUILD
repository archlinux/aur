# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz
pkgver=3.8153
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave' 'libusb-compat' 'curl' 'sqlite' 'boost-libs' 'lua52' 'mosquitto')
makedepends=('git' 'cmake' 'boost')
install='domoticz.install'
source=("https://github.com/domoticz/domoticz/archive/${pkgver}.tar.gz"
        'domoticz.service')
sha256sums=('5ea8f37f2ef900e9bd17b1b5375e75bfdec4f09001e3e2e0b647a260989d014c'
            '52ea28893fc70a278a728f975c249ace48e48f595c9da01895bde115e8e6b255')

prepare() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/opt/domoticz \
	-DUSE_STATIC_OPENZWAVE=NO \
	-DUSE_BUILTIN_LUA=NO \
        -DUSE_BUILTIN_MQTT=NO \
        -DUSE_BUILTIN_SQLITE=NO \
        -DUSE_BUILTIN_ZLIB=NO \
        -DUSE_STATIC_BOOST=NO \
        -DUSE_STATIC_LIBSTDCXX=NO \
        -DUSE_STATIC_OPENZWAVE=NO \
        ..
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install 
  chmod o+r "${pkgdir}/opt/domoticz/updatedomo"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ${srcdir}/domoticz.service "${pkgdir}/usr/lib/systemd/system/"
  chown -R http:http "${pkgdir}/opt/domoticz"
}

# vim:set ts=2 sw=2 et:
