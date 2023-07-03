# Maintainer: Sven Frenzel <aur@frenzel.dk>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname='lidarr'
pkgver=1.2.6.3313
pkgrel=1
pkgdesc="Music download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/lidarr/Lidarr"
license=("GPL3")
depends=('sqlite' 'chromaprint')
options=('!strip' 'staticlibs')
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'qbittorrent: torrent downloader'
  'qbittorrent-nox: torrent downloader (no X)'
  'jackett: torrent indexer proxy'
  'libgdiplus: provides a gdi+ compatible api'
)

source_x86_64=("lidarr-${pkgver}-linux-core-x64.tar.gz::https://services.lidarr.audio/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("lidarr-${pkgver}-linux-core-arm64.tar.gz::https://services.lidarr.audio/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("lidarr-${pkgver}-linux-core-arm.tar.gz::https://services.lidarr.audio/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=(
  'lidarr.service'
  'lidarr.tmpfiles'
  'lidarr.sysusers'
  'package_info'
)

sha512sums=('156c1437b4d71858e01c60b5af65c0a52aab4554e3b26c3b5685291e230d93596a756ae4bcc5828238ad265bf066d6ebeea91f0e2c3e1732cdbb5ebdf9517238'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622'
            'cabbd3d6387f4198097573da23032d80c1fec11835c180e55a28ee54c79c821d3c49c039762cc3ddc5126efc37d50d93cdd89a75ff809a3d533533a30353933e')
sha512sums_x86_64=('fe25211e40639fa6ad533e2d49bfdbf09057a53a0e43d66fabeac941567abad23ebea6b3fea62962cddf5b0f059fdea751eb947d3c9d4d7e57d41bdd976799e8')
sha512sums_aarch64=('71c2b82d8c6a84f254b19577577d4a6e77bda51799ccbc6c647044bbaea25343699693f5b1f54c2189b38da23f668c4a3bc3c5f11933aee3fc114b2e54316e22')
sha512sums_armv7h=('2c09ebd3987dbc84bfe64dfe1243b38b3314cd132ff744d0292557d4106bdc58b5d244f204162403f0d78d892606a7b3389fea6b5eb6d2aedce119ee7a895598')



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
