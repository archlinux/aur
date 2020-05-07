# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr"
pkgver=0.1.0.60
pkgrel=1
pkgdesc="Audio and eBook download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Readarr/Readarr"
license=("GPL3")
depends=('sqlite')
options=('!strip' 'staticlibs')
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

source_x86_64=("readarr.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("readarr.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("readarr.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('readarr.service'
        'readarr.tmpfiles'
        'readarr.sysusers'
        'package_info')

sha512sums=('ffcc3297f44f31daf21c79febcd6730a79ffd1e46cdb256f9b23a85ede4d026a6d6272aae23d1d055b3295b848be1385ce6d4c7b93b910b15be1e05f2aa04c27'
            'b34389cf2966a7a1a1fe6708303641e144191a95001c5ca6e570e9d50ba334fcbc1603852c3c2bfe008d97aaf54207690c689f00dd63378157af33ceebbbb089'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb'
            'c0019acdbbd37702e1fd63d6a19fcc8b6624972befcfa059985f85efef727bab6a7dab908ecee5834a6612a33262d37010a7f6bc6dbf9141b59c1372d5580fd6')
sha512sums_x86_64=('b1c54cc95e74c0cd706ff981235d4312f5c5091946abb580122ca04dad0b849f04d0a397bfba3757676535d5918119cf86df494a3fe74b1c9dfd7a886380b16b')
sha512sums_aarch64=('90adf23fab1718cc528ae0157c6d39e387c97fa1e236e94e13867fc788e029b30c3a9f656eec51321f837a8a6983a09f2d7c18f1d1d86ec8bd36396ef2198969')
sha512sums_armv7h=('07a637b33d1b85bcaaa54fdf3ad6a25d248df061778791005c04cbb8513583cd6e231a2f8488808ac2951830607a557b5595a0beac70a0b54c623cb3f9806f96')



package() {
  # Update environment isn't needed.
  rm -rf "${srcdir}/Readarr/Readarr.Update"

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
