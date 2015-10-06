# Maintainer: JokerYu <dayushinn@gmail.com>
pkgname=forticlientsslvpn
pkgver=4.0.2307
pkgrel=2
epoch=1
pkgdesc="Fortinet SSL VPN Client for linux"
arch=("i686" "x86_64")
url="https://support.fortinet.com"
license=("custom")
depends=("ppp" "net-tools" "libsm" "gtk2")
optdepends=("gtk-engines: for gtk theme support")

_versionFix=4.4.2307
_sourceName=${pkgname}_linux_${_versionFix}.tar.gz

if [ "$CARCH" = "i686" ]; then
  _arch=32bit
elif [ "$CARCH" = "x86_64" ]; then
  _arch=64bit
fi

md5sums=('8775babcca3dedf2b62ceaac4041a3a9'
         'b31a9c85d223fc19df051ca426522399'
         'ba87cd86fec77062c0d20da95c9e21f6'
         '6f5ebe493c5abaf60bfcd2b8bc9d73fc'
         '03f0d0ade9b76776a39d9162d5708f97'
         '43f95eae96db16248d7294c1e8bfc561')

# _tarballsrc="ftp://pftpintl:sgn89IOngs@support.fortinet.com/FortiGate/v5.00/5.2/5.2.2/VPN/SSLVPNTools/${_sourceName}"
_tarballsrc="http://www.zen.co.uk/userfiles/knowledgebase/FortigateSSLVPNCLient/${_sourceName}"
# _tarballsrc="http://support.safe-t.com/forticlients/${_sourceName}"

source=(
  "${_tarballsrc}"
  "FixNoDeviceError.patch"
  "${pkgname}.sh"
  "${pkgname}_cli.sh"
  "${pkgname}.desktop"
  "${pkgname}.png"
)

package() {
  _srcpath=${srcdir}/${pkgname}/${_arch}

  cd ${_srcpath}/helper
  patch < ${srcdir}/FixNoDeviceError.patch

  msg "creating path and copying files..."

  mkdir -p ${pkgdir}/opt/fortinet/${pkgname}/icons
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cp -rp ${_srcpath}/* ${pkgdir}/opt/fortinet/${pkgname}

  chmod -R 777 ${pkgdir}/opt/fortinet/
  chmod 555 ${pkgdir}/opt/fortinet/${pkgname}/helper

  install -Dm 644 ${srcdir}/${pkgname}.png ${pkgdir}/opt/fortinet/${pkgname}/icons/
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm 644 ${_srcpath}/helper/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${srcdir}/${pkgname}_cli.sh ${pkgdir}/usr/bin/${pkgname}_cli
}