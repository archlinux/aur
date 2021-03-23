
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://radarr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="radarr-nightly"
pkgver=3.1.0.4790
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Radarr/Radarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('radarr' 'radarr-aphrodite')
conflicts=('radarr' 'radarr-aphrodite')

source_x86_64=("Radarr.nightly.${pkgver}.linux-core-x64.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Radarr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Radarr.nightly.${pkgver}.linux-core-arm.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers'
        'package_info')

sha512sums=('fa3829ed19801a212d389d902d385589553fe0b0d7920b57f5ebf12d6ffedcd30a58403d61845d5ecd63380c4264115827f7cd602295cb7648db6c5e71601575'
            '2ef38a061f4438349f7dafe209328fe9de5f44712f16435805e2622050be45a3fffd1838d9fccef2d6aa7603cf05b01280df6fed957b66d2d67ceaeeedcd5f6f'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e'
            '591b6356c9f9cbf05738e13c808ab8cb8f31215315d9af7e7137fb12956aeb2ef424622d83094699ee2bc30d407cf34262371ab23066eb487038e731c25775bc')
sha512sums_x86_64=('4c16d3f26f874e8323f85d2cc01c7365df5b2b5f0f991f4ed00748e73cc656b4627bc1c44e6266bdde65249ea9031500f3246c39571c1b5badf7a988e8268db7')
sha512sums_aarch64=('0eaefdf864526324929113f522a37e1b7da03a47e3b9e8d87cae5c4dab730b64dafd6958f957ea58495f1d19add5452afe7a2950a73ee8a12ff0ecb230e26f89')
sha512sums_armv7h=('f2f6a697e44040823841f805cf3138599ac9e1a662cdbb0e5b9b0974db491c56f98782c9e692928a9bc3536b5e3304871b945b9fc946dec658e0d60017ae9048')


package() {
  rm -rf "${srcdir}/Radarr/Radarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/radarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/radarr/bin"
  chmod +x "${pkgdir}/usr/lib/radarr/bin/Radarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
