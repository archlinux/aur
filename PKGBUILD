# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=3491
pkgrel=1
_rpmver=2.0-0
pkgdesc='Cross-platform mobile and IoT development environment'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/intel-xdk'
license=('custom')
depends=('libudev0' 'libnotify')
makedepends=('rpmextract')

source=('intel-xdk' 'intel-xdk.desktop')
md5sums=('f7438a93f7691901ac17ea39b3fbb6a8' '34d9c2b87221acf10812ab1150357dc9')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  _carch='i486'
  md5sums+=('cd2064e4c6788d38da104b8496a543a3')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  _carch='x86_64'
  md5sums+=('22a29b5224cbe04a613604af3be00667')
fi

_base="xdk_web_linux${_arch:-64}"
source+=("https://xdk2-installers.s3.amazonaws.com/xdk/${_base}_master_${pkgver}.tgz")

package() {
  cd "${srcdir}/${_base}/rpm"
  rpmextract.sh "${pkgname}-${pkgver}-${_rpmver}.${_carch}.rpm"

  mkdir -p "${pkgdir}/opt/intel" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -r opt/intel/XDK "${pkgdir}/opt/intel/"
  rm -f "${pkgdir}/opt/intel/XDK/libudev.so.0"
  install -m755 "${srcdir}/intel-xdk" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/intel-xdk.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${pkgdir}/opt/intel/XDK/xdk/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
