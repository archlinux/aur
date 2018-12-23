# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-dev
pkgver=3.0.4069
pkgrel=1
pkgdesc="Ombi V3 Develop branch. Gives Plex or Emby users the ability to request content by themselves"
jobid=n8yo9mvgjah9jbd6
arch=('x86_64')
url='https://github.com/tidusjar/Ombi'
license=('GPL2')
depends=('libunwind' 'openssl-1.0')
makedepends=('libarchive')
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
options=('staticlibs')
install='ombi.install'
source=("${pkgname}-${pkgver}.tar.gz::https://ci.appveyor.com/api/buildjobs/$jobid/artifacts/linux.tar.gz"
        'ombi.service'
        'ombi.sysusers'
        'ombi.tmpfiles')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('fc264872070ca6acefd3f1ee93f4469a6ba5cb3a43a50579b483b6d99f83e3eb'
            '79f4860eaf9d00d3739c6d9fc5e9625ea68dc329bb1cbddae5b51ae4faaae20f'
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
