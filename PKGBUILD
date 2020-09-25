# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=ombi-preview
pkgver=4.0.483
pkgrel=1
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('x86_64' 'aarch64' 'armv7h')
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
backup=('var/lib/appsettings.json')
replaces=('plexrequests')
provides=('ombi')
conflicts=('ombi')
options=('staticlibs')

source=("ombi.service"
        "ombi.sysusers"
        "ombi.tmpfiles")

source_x86_64=("ombi-x86_64-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi.Releases/releases/download/v${pkgver}/linux-x64.tar.gz")
source_armv7h=("ombi-armv7h-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi.Releases/releases/download/v${pkgver}/linux-arm.tar.gz")
source_aarch64=("ombi-aarch64-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi.Releases/releases/download/v${pkgver}/linux-arm64.tar.gz")

noextract=("ombi-x86_64-${pkgver}.tar.gz"
           "ombi-i686-${pkgver}.tar.gz"
           "ombi-armv7h-${pkgver}.tar.gz")

sha256sums=('f940ba92228b198ffa59603e10e25a3a1958c06207705edcc62b805adfa1a9d4'
            '6efc381990e1113737686d4f61795095fa8edbc176daa877fd755f1ddb3a40fa'
            '49fc5edca9d88fc9d6e9f0f4a6d707b072f32daa097305f0bf905dfff342f44a')
sha256sums_x86_64=('1fc8fe11e1918111b597cec1bc75c803032c8f9fc6b2b15419cb3a6df07d8836')
sha256sums_aarch64=('1a2665e872a9345141e14c2e20bd9e69ca17dc0740887f3cbf02e477e309635f')
sha256sums_armv7h=('910c2bd4a278039c6407b48dea6f5aef96cf91e9d943eb81e8fa730eb42811d6')

prepare() {
  # The source is packaged w/o a sub directory, so create our own and 
  # extract to it. Arm package has a different name too.
  mkdir -p "${srcdir}/ombi"
  bsdtar -x -C "${srcdir}/ombi" -f "ombi-${CARCH}-${pkgver}.tar.gz"
}

package() {
  # Copy the default appsettings.json
  install -d -m 755 "${pkgdir}/var/lib/ombi"
  install -D -m 644 "${srcdir}/ombi/appsettings.json" "${pkgdir}/var/lib/ombi/"
  install -D -m 644 "${srcdir}/ombi/HealthCheck.css" "${pkgdir}/var/lib/ombi/"

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
