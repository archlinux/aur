# Maintainer: Jaron Viëtor <thulinma@thulinma.com>
# Previous maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz
pkgver=4.10717
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('libusb-compat' 'curl' 'sqlite' 'boost-libs' 'lua' 'mosquitto')
makedepends=('git' 'cmake' 'boost' 'python')
install='domoticz.install'
source=("https://github.com/domoticz/domoticz/archive/${pkgver}.tar.gz"
        'domoticz.service' 'boostver.patch')
sha256sums=('c053a2161942529f56b748945ec297dcd67f449e68029fc886893a528891ad86'
            '52ea28893fc70a278a728f975c249ace48e48f595c9da01895bde115e8e6b255'
            'b8c136ec718696a1d70d18245c0a3bad490d6f23b0000a53369ab5eb84ca5128')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/boostver.patch"
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/opt/domoticz \
	-DUSE_STATIC_OPENZWAVE=NO \
	-DUSE_BUILTIN_LUA=NO \
  -DUSE_BUILTIN_MQTT=NO \
  -DUSE_BUILTIN_SQLITE=NO \
  -DUSE_BUILTIN_ZLIB=NO \
  -DUSE_STATIC_BOOST=NO \
  -DUSE_STATIC_LIBSTDCXX=NO \
  -DUSE_OPENSSL_STATIC=NO \
  -DUSE_PYTHON=NO \
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
