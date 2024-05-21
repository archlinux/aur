# Maintainer: Hikari Takahashi <yyrud4c1p@mozmail.com>
# This script is not official and it is provided as a helper. You are solely responsible for the use of this installer.

# By using CrowdStrike, you are bound by CrowdStrike license terms that may change without notice.
# Terms of Use: https://www.crowdstrike.com/software-terms-of-use/
# Privacy Notice: https://www.crowdstrike.com/privacy-notice/

pkgname=falcon-sensor
pkgver=7.14.0.16703
_pkgver=7.14.0-16703
pkgrel=1
pkgdesc="Crowdstrike Falcon Sensor daemon and kernel modules"
arch=("x86_64")
url="https://crowdstrike.com"
license=("custom")
depends=("openssl" "libnl1")
backup=("etc/logrotate.d/falcon-sensor")
source=(
  "manual://${pkgname}_${pkgver/_/-}_amd64.deb"
  "LICENSE"
)
sha256sums=(
  "SKIP"
  "323c9971c5f7e3b360783601922c063801e0bbd425351faaafaf476b5b29fecb"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  bsdtar -xf "${srcdir}/data.tar.xz" -C .

  # Remove unnecessary .deb related directory
  rm -rf "${srcdir}/${pkgname}/etc/init.d"
}

package() {
  warning "You may need to uninstall the package first and remove the folder /opt/CrowdStrike"

  cd "${srcdir}/${pkgname}"
  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}"
  install -dm755 "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod a+x "${pkgdir}/opt/CrowdStrike"
  chmod -R a+r "${pkgdir}/opt/CrowdStrike"
  
  #/opt/CrowdStrike/falconctl -s --cid=<your CID here>  
}
