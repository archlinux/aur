# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

# Helpful URL: https://ci.appveyor.com/project/tidusjar/requestplex/branch/develop/artifacts

pkgname=ombi-develop
pkgver=3.0.5223
pkgrel=1
#_buildhash="03pr2x76ru4jsx0o"
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
provides=('ombi')
conflicts=('ombi')
options=('staticlibs')

source=("ombi.service"
        "ombi.sysusers"
        "ombi.tmpfiles")

# Commented while release is higher than develop.
# https://ci.appveyor.com/api/buildjobs/${_buildhash}/artifacts/linux.tar.gz
#source_x86_64=("ombi-x86_64-${pkgver}.tar.gz::https://ci.appveyor.com/api/buildjobs/${_buildhash}/artifacts/linux.tar.gz")
#source_armv7h=("ombi-armv7h-${pkgver}.tar.gz::https://ci.appveyor.com/api/buildjobs/${_buildhash}/artifacts/linux-arm.tar.gz")
#source_aarch64=("ombi-aarch64-${pkgver}.tar.gz::https://ci.appveyor.com/api/buildjobs/${_buildhash}/artifacts/linux-arm64.tar.gz")
source_x86_64=("ombi-x86_64-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/linux.tar.gz")
source_armv7h=("ombi-armv7h-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/linux-arm.tar.gz")
source_aarch64=("ombi-aarch64-${pkgver}.tar.gz::https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/linux-arm64.tar.gz")

noextract=("ombi-x86_64-${pkgver}.tar.gz"
           "ombi-i686-${pkgver}.tar.gz"
           "ombi-armv7h-${pkgver}.tar.gz")

sha256sums=('d5893f6b665a0646054343a051e462a49569d51de224b45d3d2542b6c4e3d168'
            '6efc381990e1113737686d4f61795095fa8edbc176daa877fd755f1ddb3a40fa'
            '49fc5edca9d88fc9d6e9f0f4a6d707b072f32daa097305f0bf905dfff342f44a')
sha256sums_x86_64=('51ef1e6a5f4ea3a1e16c84e897a0409952b7f948902bf19cb30c83fb714a566a')
sha256sums_aarch64=('196ce9b4573e5cff1b86f9262dcaa78980b6773389de47d73dd860baa442aa93')
sha256sums_armv7h=('9de774a1049902524f79b182f0f9b8e515ff826a8aa8c2fedf20dc6741391b30')

prepare() {
  # The source is packaged w/o a sub directory, so create our own and 
  # extract to it. Arm package has a different name too.
  mkdir -p "${srcdir}/ombi"
  bsdtar -x -C "${srcdir}/ombi" -f "ombi-${CARCH}-${pkgver}.tar.gz"
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
