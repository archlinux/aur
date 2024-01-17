# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr-nightly"
pkgver=0.3.16.2386
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

sha512sums=('8479a08e504c0e5be48d0e97e849c589f9b49855de5fe8edf8c24b9317263283fd92f8eee9d2bc1fb927b7186eb6721bf0a1c063c68a80811a11efc4105914ec'
            'b34389cf2966a7a1a1fe6708303641e144191a95001c5ca6e570e9d50ba334fcbc1603852c3c2bfe008d97aaf54207690c689f00dd63378157af33ceebbbb089'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb'
            'f762a01de8c4448a64da61fc6804587b2679d3c2b874c42cd920d7af0a380ed4c93ff8e89aac72a1cdca90c98596d97f593c98f6528326e4dacfc3f09ab536a5')
sha512sums_x86_64=('51267f28d9b8e5f0628991f6120dbedb8222fb26541db7e8d1830562768a1f90096d3a1f17c01ccdd9b9188867fcbc0b2ccbfbe6182a4561d94f46f896567c0b')
sha512sums_aarch64=('a5cb48313379e9af61dfc8bb78e8ba600e4a71bb5aebffb6a85d85b1efd25d0b578315b322aedf83ec18d803d80db917a3783be65873281b9830d64c6ac8221f')
sha512sums_armv7h=('29bc6ca9d15af8ad90351aa5287fc94244a3873ea3d1e72030ff0c9a9416d0acc00286536df299d275c8727da9070e8f978c6a6a3aff2cd41a8e0f73a5b2e711')



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
