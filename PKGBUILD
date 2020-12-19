# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta36.1
pkgrel=1
pkgdesc="Software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=('gtk3'
	'libxss')
optdepends=('libpulse')
makedepends=('p7zip')
arch=('x86_64')
source=('teamspeak.desktop'
        'teamspeak.svg'
        "teamspeak-client-$pkgver.tar.compressed::http://update.teamspeak.com/linux/x64/latest/0-1608110690.patch")
noextract=("teamspeak-client-$pkgver.tar.compressed") # Unpacking will fail,
sha512sums=('57c618d386023d27fcb5f6b7e5ce38fe7012680988aff914eeb6c246d855b190689bbad08d9824c864c1776af322e8df34019234128beb306a09b114673b37c9'
            '3b0c7fe2e71eb207a9874c3fba31c18067867481d81c7a8a2a9fef5956f04cfbd559186f6996e2e3d79292d1aaaae443ab6ea6272d0f6b3205fdd12387de27b0'
            '94a7cbdec46e750d1a027c4db475796dae4229d5558d19cc11414d253d38d8bd6ad5c7e91da34dea59e06071a3e5e079f9b7cbd36c4adf803a939e6c2dfdc84b')
# Following authorization token is hard-coded. It is not bound to any account, but without it you will get 403 Forbidden error from any request to update.teamspeak.com
DLAGENTS=("http::/usr/bin/curl --basic -u teamspeak5:LFZ6Z^kvGrnX~an,\$L#4gxL3'a7/a[[&_7>at}A3ARRGY -A teamspeak.downloader/1.0 -o %o %u")

prepare() {
  mkdir -p "${srcdir}/teamspeak-client"
  # It's some werid archive, it requires special handling
  7z e -y "${srcdir}/teamspeak-client-${pkgver}.tar.compressed"
  tar -xf "${srcdir}/teamspeak-client-${pkgver}.tar" -C "${srcdir}/teamspeak-client/" --overwrite
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/teamspeak-client/"* "${pkgdir}/opt/${pkgname}/"

  chmod 755 "${pkgdir}/opt/${pkgname}/TeamSpeak"

  install -Dm644 "${srcdir}/teamspeak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/teamspeak.svg" "${pkgdir}/usr/share/pixmaps/teamspeak.svg"

  ln -s /opt/${pkgname}/TeamSpeak/licenses/en/la.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/${pkgname}/TeamSpeak "${pkgdir}/usr/bin/teamspeak"
}
