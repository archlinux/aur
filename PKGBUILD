
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="radarr-develop"
pkgver=5.0.2.8103
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
sha512sums_x86_64=('83e609d0bc6770ca23a5083fc05d3eafe3d2d13cc7884e3a37f8e1676425dc2048b8a9c619579b26f946bf34e2797f5f14826f4f7257f913d8876342a9c44e88')
sha512sums_aarch64=('1ae4c3de01dd2bb42a77c4593e6d6a3975e3d9382f08fedfd67bb563d2c417b92dc6e84e59a26ec56eb9ffac484c8459564be2a4c4e0cb6f2b38cf25329765ad')
sha512sums_armv7h=('11a7203d78e0e0b125990ddf2b3df98ab3714ac19d92071dba7f06dba6af730c56990d85bf9a1e92aba2b7c1aa4861bb8c47575f02355321cfb4a5ea893353ec')


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
