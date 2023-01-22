# Maintainer  : Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
# Contributor : Martin Dratva <raquacontact+aur at gmail dot com>
# Contributor : Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor : Jaron Viëtor <thulinma@thulinma.com>
# Contributor : Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz
pkgver=2022.2
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://www.domoticz.com'
license=('GPL3')
depends=('libusb-compat'
         'curl'
         'sqlite'
         'boost-libs'
         'lua'
         'minizip'
         'cereal'
         'mosquitto'
         'jsoncpp'
         'python')
makedepends=('git'
             'cmake'
             'boost')
install='domoticz.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/domoticz/domoticz/archive/${pkgver}.tar.gz"
        'domoticz.service')
md5sums=('f9ac0ba4828dc40a19c1f24f8b2d9614'
         'b1c9ad64a372714ffceeb3d3adf7412b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  #local p
  #for p in "${srcdir}"/*.patch; do
  #  patch --forward --strip=1 --input="${p}"
  #done

  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/opt/domoticz \
  -DUSE_STATIC_OPENZWAVE=NO \
  -DUSE_BUILTIN_JSONCPP=NO \
  -DUSE_BUILTIN_MINIZIP=NO \
  -DUSE_BUILTIN_MQTT=NO \
  -DUSE_BUILTIN_SQLITE=NO \
  -DUSE_STATIC_BOOST=NO \
  -DUSE_STATIC_LIBSTDCXX=NO \
  -DUSE_OPENSSL_STATIC=NO \
  -DUSE_PYTHON=YES \
  ..

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
