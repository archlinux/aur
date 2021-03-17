# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr-nightly"
pkgver=0.1.0.537
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

source_x86_64=("readarr.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("readarr.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("readarr.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('readarr.service'
        'readarr.tmpfiles'
        'readarr.sysusers'
        'package_info')

sha512sums=('29b1a5c4162a6cd6da8215baffcab074658cdbd47c55f9b400f621aa42545336746cdc022c517374ac9589bcf9de5e9f18c1739c05b5fa529d7a60fd5f6d9150'
            'b34389cf2966a7a1a1fe6708303641e144191a95001c5ca6e570e9d50ba334fcbc1603852c3c2bfe008d97aaf54207690c689f00dd63378157af33ceebbbb089'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb'
            'f762a01de8c4448a64da61fc6804587b2679d3c2b874c42cd920d7af0a380ed4c93ff8e89aac72a1cdca90c98596d97f593c98f6528326e4dacfc3f09ab536a5')
sha512sums_x86_64=('9c9da264e508888308fae99f7c61c2b6b54447ea94c7d76130ea445b5a6a35c2942d6ba70200ff74831987e8f920ce2715d5b4b12f6b77e518a14437b1a9d3be')
sha512sums_aarch64=('37d1dc1172aa0e0c97c2d8ef663c03cd1f4b8fd3d966acc897f51f1d5afa774dda520d66b366ab7b1099854ce84e7a61019af112515f5a61f1aae4486adf52dc')
sha512sums_armv7h=('498bbd80d465b14c43cc09efa2f38b5ae26d00cf3ea5d6b467f7ccd3d5e0fbff0e55317f65f0e37091e64e65607b67616c6dfed84d96212ec24902b7f0793c77')



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
