# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr-develop"
pkgver=0.3.12.2327
pkgrel=1
pkgdesc="Audio and eBook download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Readarr/Readarr"
license=("GPL3")
depends=(
  'sqlite'
  'chromaprint'
)
options=(
  '!strip'
  'staticlibs'
)
provides=('readarr')
conflicts=('readarr')
optdepends=('calibre: calibre-server as root folder'
            'sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'qbittorrent: torrent downloader'
            'qbittorrent-nox: torrent downloader (no X)'
            'jackett: torrent indexer proxy')

source_x86_64=("readarr.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("readarr.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("readarr.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('readarr.service'
        'readarr.tmpfiles'
        'readarr.sysusers'
        'package_info')

sha512sums=('dc70d824047bf92ed62bc5ed8745688ae18fb151ab1f7347c1c20f70f33e5edd4f58baf7816b46cdaed2c55ddcba1dbb1842303ecc153d552bae424079bd3c4b'
            'b34389cf2966a7a1a1fe6708303641e144191a95001c5ca6e570e9d50ba334fcbc1603852c3c2bfe008d97aaf54207690c689f00dd63378157af33ceebbbb089'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb'
            'e7d23886761a5052d9c9efa24d938bce7ab52b19713a50cc5338f1273bba6615c49ccf1612c412320fd7ff91fff4bff4e95a58db83ae7bd6b6bc83568ffeb90f')
sha512sums_x86_64=('af92ad83647fe6f7d7d1ff1bed8f158ba88b3a5c055f464e2de6ee1eaa9f60e530a6295a5deab6f9e41c1b8f4fd4413c1e81933a8eb2063eddde25ad2b116d38')
sha512sums_aarch64=('deacae6df7ebe86bab24615542c7aacd143204e58bba1ca469c9edff56773249833e9204958d1476275580288422899a33cb887cfaa5a4288bf7deb877948053')
sha512sums_armv7h=('1cf5c92b1404d090f7b46c98c0ba76cb6a2ad1cc9631670991e43853f7d7c2e3ccb95abc6d21b3b22c9dbad7eb8a8727426945e6b25e8eb4c22f2cc736ea387e')



package() {
  # Update environment isn't needed.
  rm -rf "${srcdir}/Readarr/Readarr.Update"

  # Remove unneeded fpcalc
  rm -f "${srcdir}/Readarr/fpcalc"

  install -d -m 755 "${pkgdir}/usr/lib/readarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Readarr/"* "${pkgdir}/usr/lib/readarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/readarr/bin"
  chmod +x "${pkgdir}/usr/lib/readarr/bin/Readarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/readarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/readarr/package_info"

  install -D -m 644 "${srcdir}/readarr.service" "${pkgdir}/usr/lib/systemd/system/readarr.service"
  install -D -m 644 "${srcdir}/readarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/readarr.conf"
  install -D -m 644 "${srcdir}/readarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/readarr.conf"
}
