# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="lidarr-develop"
pkgver=1.3.5.3530
pkgrel=1
pkgdesc="Music download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/lidarr/Lidarr"
license=("GPL3")
depends=('sqlite' 'chromaprint')
options=('!strip' 'staticlibs')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'qbittorrent: torrent downloader'
            'qbittorrent-nox: torrent downloader (no X)'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('lidarr')
conflicts=('lidarr' 'lidarr-nightly')

source_x86_64=("lidarr-${pkgver}-linux-core-x64.tar.gz::https://services.lidarr.audio/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("lidarr-${pkgver}-linux-core-arm64.tar.gz::https://services.lidarr.audio/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("lidarr-${pkgver}-linux-core-arm.tar.gz::https://services.lidarr.audio/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('lidarr.service'
        'lidarr.tmpfiles'
        'lidarr.sysusers'
        'package_info')

sha512sums=('156c1437b4d71858e01c60b5af65c0a52aab4554e3b26c3b5685291e230d93596a756ae4bcc5828238ad265bf066d6ebeea91f0e2c3e1732cdbb5ebdf9517238'
            '3800547b7c3d2b6e0a590ebd2db5ed48a6c31249098a4c36876faca36dd81e84ac45f3679d16bfe101be594dc6d5d0cfc91bfc66ed8cba35ec05f22027ab2441'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622'
            'c9bd8707cceed880ecebd974f0c5db0801cfafd714bf939e9c688212e4b092cc9e6452c899ae30d8d5c5acc9a4e41c9fa0f1e5c1daef7cdb0bd5d66c6be0eb4a')
sha512sums_x86_64=('2fd80873bea9020132596c5af8ad2a4a72e9a58537a888a7657b11e363acb104efadad7d2732f5145ac2a82c3cfa99bab1bad9c35626beff3aef5c63712d284e')
sha512sums_aarch64=('89dcfe74aa70116c4dccd72c6796901ece84863911991bb743105100e5fd8300c3032f391f88e87ae4a54d1eed35e4cebbbf0b0bb03b1e793ff370f2d9ff3c64')
sha512sums_armv7h=('ba82d6c2ca0150d5ddb8e0700ecb6cd01d384197fa2140569c3fd3667b2a94492d1b5e0ff2e8ad2f9de84b11f33d49a60c311281961a457ceb60c0262c846d30')



package() {
  # Update environment isn't needed.
  rm -rf "${srcdir}/Lidarr/Lidarr.Update"

  # The fpcalc binary comes from chromaprint.
  rm -rf "${srcdir}/Lidarr/fpcalc"

  install -d -m 755 "${pkgdir}/usr/lib/lidarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/lidarr/bin"
  chmod +x "${pkgdir}/usr/lib/lidarr/bin/Lidarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/lidarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/lidarr/package_info"

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
