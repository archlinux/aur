pkgname=sabnzbd
_pkgname=SABnzbd
pkgver=2.3.6
pkgrel=1
pkgdesc="A web-interface based binary newsgrabber with NZB file support"
url="http://www.sabnzbd.org"
arch=("any")
license=("GPL")
depends=("curl" "par2cmdline"
         "python2" "python2-cheetah" "python2-sabyenc"
         "sqlite" "unrar" "unzip")
optdepends=("xdg-utils: registration of .nzb files" "python2-feedparser: rss support" "python2-pyopenssl: ssl support" "par2cmdline-tbb: par2 multi-threading")
install="${pkgname}.install"
backup=("etc/conf.d/sabnzbd" "opt/${pkgname}/${pkgname}.ini")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.gz"
        "${pkgname}" "${pkgname}.desktop" "addnzb.sh" "nzb.png" "sabnzbd.png" "x-nzb.xml" "${pkgname}.service" "${pkgname}.confd")
md5sums=('8ebdf61ae058209704619f5aa637bdee'
         '48d60a1c626503c7fef1bc5374390513'
         '36e5f0f60f28f67102682f80e33c6d4b'
         '69b9bcbcf67ff3e7a4cdd9f26e001341'
         '46fa8020fcfaad1e06d370fa3b0ea09a'
         'b834ca5dfb63a5d06041c3174172ec09'
         '11fb2cd1451e3725b08bfc2bd045be54'
         'da07971fa3790ea4824ed4ce611b38f3'
         '8fc2607a7961fc643ef4f6640166322a')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.ini"
  cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"

  # Fix for issues with Python 3
  find "${pkgdir}/opt/${pkgname}" -type f -exec sed -i 's/python/python2/g' {} \;
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/${pkgname}/${_pkgname}.py"

  install -Dm755 "${srcdir}/${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.confd" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm755 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/addnzb.sh"    "${pkgdir}/opt/${pkgname}/addnzb.sh"
  install -Dm644 "${srcdir}/nzb.png"    "${pkgdir}/opt/${pkgname}/nzb.png"
  install -Dm644 "${srcdir}/sabnzbd.png"  "${pkgdir}/opt/${pkgname}/sabnzbd.png"
  install -Dm770 "${srcdir}/x-nzb.xml"    "${pkgdir}/opt/${pkgname}/x-nzb.xml"
}
