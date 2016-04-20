# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=3240
pkgrel=1
_rpmver=2.0-0
pkgdesc='Comprehensive, cross-platform HTML5 development environment'
arch=('i686' 'x86_64')
url='http://xdk.intel.com'
license=('custom')
depends=('libudev0' 'libnotify')
makedepends=('rpmextract')

source=('intel-xdk' 'intel-xdk.desktop')
md5sums=('f7438a93f7691901ac17ea39b3fbb6a8' '34d9c2b87221acf10812ab1150357dc9')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  _carch='i486'
  md5sums+=('2193818b6ac157c63fcf51f92949e065')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  _carch='x86_64'
  md5sums+=('053d25797807d8c67a430a3a58113c34')
fi

_base="xdk_web_linux${_arch:-64}"
source+=("https://download.xdk.intel.com/${_base}_master_${pkgver}.tgz")

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
