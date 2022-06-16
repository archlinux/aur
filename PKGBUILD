# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr-nightly"
pkgver=0.1.1.1374
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

sha512sums=('dc70d824047bf92ed62bc5ed8745688ae18fb151ab1f7347c1c20f70f33e5edd4f58baf7816b46cdaed2c55ddcba1dbb1842303ecc153d552bae424079bd3c4b'
            'b34389cf2966a7a1a1fe6708303641e144191a95001c5ca6e570e9d50ba334fcbc1603852c3c2bfe008d97aaf54207690c689f00dd63378157af33ceebbbb089'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb'
            'f762a01de8c4448a64da61fc6804587b2679d3c2b874c42cd920d7af0a380ed4c93ff8e89aac72a1cdca90c98596d97f593c98f6528326e4dacfc3f09ab536a5')
sha512sums_x86_64=('5f8204c42cab577874fc0782a860a76ea35dcf77fa7e9f9c9971cdf2fa9b2d0ca8cab359ce1829ccd1e32df147091f2f6d9b44d8072ff934431ed08b7b59e80d')
sha512sums_aarch64=('0cd34ff522ea2ba02d232bdbd5bdd5b1572cdbb6a4f448366d90636a57357e2a347c1ccd3e98ea848369fea736c3e6e528890a79d739b2623e21de7edb2d110a')
sha512sums_armv7h=('e5689b018c582a0ca161543d5f54753b9fdb594de5ee0a4bb27e888b97dfebcdba73f737f85c5851726a96aa5d29be03ede16b529ad30eb6189bb85c01a08119')



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
