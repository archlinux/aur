# Maintainer: Sven Frenzel <aur@frenzel.dk>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname='lidarr'
pkgver=1.4.5.3639
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
sha512sums_x86_64=('70818e3a5cb5af6c78aa5e6f33dbfe0ba28f9cce88268ca2033412014ed7f65e177fbf4af4e7c13bf9936ea45983cf80d5569ec0df285092505b6778a12a99de')
sha512sums_aarch64=('0c1be4e6d14a33e5116396d87dcff5e2bbc4ce7e8d86094a55f9d81d0b1db440a7f82477fd4c4986f85f9bda837495d88072cc526df5b900369956dce4da9134')
sha512sums_armv7h=('d6f24859a6cebc38ef5e50268636bfa6faa60ea264066b5c84dc684f8721140f6f14df2d27eed5e344f7bc273075f76721cbbf08c792bfa22720b02c025eb7ad')



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
