
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="radarr-develop"
pkgver=4.4.1.6926
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Radarr/Radarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'jackett: torrent indexer proxy'
  'nzbhydra2: torznab and usenet indexer proxy'
  'prowlarr: torrent and usenet indexer proxy'
  'libgdiplus: provides a gdi+ compatible api'
)

provides=('radarr' 'radarr-aphrodite')
conflicts=('radarr' 'radarr-aphrodite')

source_x86_64=("Radarr.develop.${pkgver}.linux-core-x64.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Radarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Radarr.develop.${pkgver}.linux-core-arm.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers'
        'package_info')

sha512sums=('93794c099257091e0d7176253f795064a554f07ec742a46d3c7b80df521ab435f9ceaa9770c73e7e6a6d4b828357604776d03a95f6f75b49c3d1e0728ba6143b'
            '2ef38a061f4438349f7dafe209328fe9de5f44712f16435805e2622050be45a3fffd1838d9fccef2d6aa7603cf05b01280df6fed957b66d2d67ceaeeedcd5f6f'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e'
            '3ece517c026422dd9f6a8c20e8832021c12be4fa84c85ec0758adf4c955620d2b0e75ee534a09b0f87ab587b374fcd757c818c722d147fd6cc9065735d7d6e0f')
sha512sums_x86_64=('e8a71a210706f8b09ea84028c6c43d131a56f7fdbf3bb94c6a47a75c72bdde351d2f250ec45d1c9c6570f8ef18bb8ab7b83c03e7003c84f91c11d605d8077f70')
sha512sums_aarch64=('71b50d5958ad777742c9377d88def082dd719b88019a688ddaa2094365c663516b4ff1e89cf390772d04ff5f4b90a0a450d0b02ac641927715c89128e2493e75')
sha512sums_armv7h=('dcc477548ea1a48b00ad34f4c22beb1a37c62305f21d5aa8e371b132345551a39388ded31c4a587c0fc4270b76865f0fd8948af5660a783344d995b2a7e89d3b')


package() {
  rm -rf "${srcdir}/Radarr/Radarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/radarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/radarr/bin"
  chmod +x "${pkgdir}/usr/lib/radarr/bin/Radarr" "${pkgdir}/usr/lib/radarr/bin/ffprobe"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
