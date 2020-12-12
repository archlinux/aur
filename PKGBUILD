# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>

pkgname=ombi-v4
pkgver=4.0.748
pkgrel=1
pkgdesc="Ombi V4 branch. Gives Plex or Emby users the ability to request content by themselves"
jobid=
arch=('x86_64')
url='https://github.com/tidusjar/Ombi'
license=('GPL2')
depends=('libunwind' 'openssl-1.0')
makedepends=('libarchive'
             'unzip')
optdepends=('sonarr: Automated TV show downloads'
            'sickrage: Automated TV show downloads'
            'radarr: Automated movie downloads'
            'couchpotato: Automated movie downloads'
            'plex-media-server: Plex media server'
            'plex-media-server-plexpass: Plex media server (Plexpass version)'
            'emby-server: Emby media server')
replaces=('plexrequests' 'ombi-beta')
provides=('ombi')
conflicts=('ombi')
options=('!strip' 'staticlibs')
install='ombi.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi.Releases/releases/download/v4.0.748/linux-x64.tar.gz"
        'ombi.service'
        'ombi.sysusers'
        'ombi.tmpfiles')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('0ff8c5f94c37bbbef766079d02a59df48752526c5d54ea69ca9c9243d93ebe7d'
            '64e7170dcf8648dca99831c139fecfa6505bc61d9e9188346af931e137d067dc'
            '6efc381990e1113737686d4f61795095fa8edbc176daa877fd755f1ddb3a40fa'
            'afb971692d313d988096cb4447033f8ca2234016ccc2b3590afd5cbcb36a8e56')

prepare() {
  mkdir -p "${srcdir}/ombi"
  bsdtar -x -C "${srcdir}/ombi" -f "${pkgname}-${pkgver}.tar.gz"
}

package() {
  install -dm755 "${pkgdir}/opt/Ombi"
  cp -dpr --no-preserve=ownership "${srcdir}/ombi/"* "${pkgdir}/opt/Ombi/"
  find ${pkgdir}/opt/Ombi/ -type f -exec chmod 644 '{}' ';'
  find ${pkgdir}/opt/Ombi/ -type d -exec chmod 755 '{}' ';'
  chmod +x "${pkgdir}/opt/Ombi/Ombi"

  install -Dm644 "${srcdir}/ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
  install -Dm644 "${srcdir}/ombi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ombi.conf"
}



