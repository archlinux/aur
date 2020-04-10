# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jaron Viëtor <thulinma@thulinma.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz
pkgver=2020.1
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://www.domoticz.com'
license=('GPL-3.0')
depends=('libusb-compat'
         'curl'
         'sqlite'
         'boost-libs'
         'lua'
         'mosquitto')
makedepends=('git'
             'cmake'
             'boost'
             'python')
install='domoticz.install'
source=("https://github.com/domoticz/domoticz/archive/${pkgver}.tar.gz"
        'domoticz.service')
md5sums=('00ea7ab5c3f6de94fe590b8cf99a7e1f'
         'c13a3f5d04142587d159820156a6223f')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
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

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install 
  chmod o+r "${pkgdir}/opt/domoticz/updatedomo"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ${srcdir}/domoticz.service "${pkgdir}/usr/lib/systemd/system/"
  chown -R http:http "${pkgdir}/opt/domoticz"
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/opt/domoticz/License.txt"
}
# vim:set ts=2 sw=2 et: