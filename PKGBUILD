# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=ombi
pkgver=3.0.4248
pkgrel=1
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/tidusjar/Ombi"
license=('GPL2')
depends=('libunwind' 'openssl-1.0' 'icu')
optdepends=('sonarr: TV daemon for usenet & torrents'
            'radarr: Movie daemon for usenet & torrents (sonarr fork)'
            'lidarr: Music daemon for usenet & torrents (sonarr fork)'
            'sickrage: TV daemon for usenet & torrents (sickbeard fork)'
            'couchpotato: Movie daemon for usenet & torrents'
            'plex-media-server: Media server'
            'plex-media-server-plexpass: Media server (plexpass version)'
            'emby-server: Media server')
replaces=('plexrequests')
options=('staticlibs')

source=("${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/linux.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/linux-arm.tar.gz")

noextract=("${pkgname}-x86_64-${pkgver}.tar.gz"
           "${pkgname}-i686-${pkgver}.tar.gz"
           "${pkgname}-armv7h-${pkgver}.tar.gz")

sha256sums=('d5893f6b665a0646054343a051e462a49569d51de224b45d3d2542b6c4e3d168'
            '6efc381990e1113737686d4f61795095fa8edbc176daa877fd755f1ddb3a40fa'
            '49fc5edca9d88fc9d6e9f0f4a6d707b072f32daa097305f0bf905dfff342f44a')
sha256sums_x86_64=('80bf050b84afc03b958c3025158110adde87b157659e7e5a4ab7552553624819')
sha256sums_armv7h=('da3e276b33ac86d5ec8e83f693697627c30678514efc09262485a5582422b4c2')

prepare() {
  # The source is packaged w/o a sub directory, so create our own and 
  # extract to it. Arm package has a different name too.
  mkdir -p "${srcdir}/ombi"
  bsdtar -x -C "${srcdir}/ombi" -f "${pkgname}-${CARCH}-${pkgver}.tar.gz"
}

package() {
  # Copy in files and then fix permissions
  install -d -m 755 "${pkgdir}/usr/lib/ombi"
  cp -dpr --no-preserve=ownership "${srcdir}/ombi/"* "${pkgdir}/usr/lib/ombi/"
  chmod -R a=,a+rX,u+w ${pkgdir}/usr/lib/ombi/
  chmod 755 ${pkgdir}/usr/lib/ombi/Ombi

  install -D -m 644 "${srcdir}/ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -D -m 644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
  install -D -m 644 "${srcdir}/ombi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ombi.conf"
}

# vim:set ts=2 sw=2 et:
