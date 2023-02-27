# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=ombi
pkgver=4.35.10
pkgrel=1
pkgdesc='Simple automated way for users to request new content for Plex'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Ombi-app/Ombi'
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
backup=('var/lib/ombi/appsettings.json')
replaces=('plexrequests')
options=('!strip' 'staticlibs')

source=("ombi.service"
        "ombi.sysusers"
        "ombi.tmpfiles")

# https://github.com/Ombi-app/Ombi/releases/download/v4.0.1342/linux-x64.tar.gz
source_x86_64=("ombi-x86_64-${pkgver}.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-x64.tar.gz")
source_armv7h=("ombi-armv7h-${pkgver}.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-arm.tar.gz")
source_aarch64=("ombi-aarch64-${pkgver}.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-arm64.tar.gz")

noextract=("ombi-x86_64-${pkgver}.tar.gz"
           "ombi-i686-${pkgver}.tar.gz"
           "ombi-armv7h-${pkgver}.tar.gz")

sha256sums=('263c0f3bce912441c8473203096958c8037e577df879403f6f93ac9317cee185'
            '6efc381990e1113737686d4f61795095fa8edbc176daa877fd755f1ddb3a40fa'
            '49fc5edca9d88fc9d6e9f0f4a6d707b072f32daa097305f0bf905dfff342f44a')
sha256sums_x86_64=('a2ca67151decc8d2f1cba5120ab7c579adb378f31af4fee8a5193785b3eda4e3')
sha256sums_aarch64=('c1e39f6f535c5461c5d5b925974b642f1567dd342722ad95b117a055693c6837')
sha256sums_armv7h=('2fdc8983cd869504eef54d0335fc56ceb00995fd5d74e6da6412767b72edd1c5')

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
  #install -D -m 644 "${srcdir}/ombi/HealthCheck.css" "${pkgdir}/var/lib/ombi/"

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
