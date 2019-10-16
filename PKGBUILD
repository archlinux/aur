# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/netcore?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="lidarr-netcore"
pkgver=0.7.1.1542
pkgrel=5
pkgdesc="Music downloader for usenet and torrents."
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
conflicts=('lidarr')

source_x86_64=("Lidarr.dotnet-core-${pkgver}.linux-core-x64.tar.gz::https://services.lidarr.audio/v1/update/netcore/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Lidarr.dotnet-core-${pkgver}.linux-core-arm64.tar.gz::https://services.lidarr.audio/v1/update/netcore/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Lidarr.dotnet-core-${pkgver}.linux-core-arm.tar.gz::https://services.lidarr.audio/v1/update/netcore/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('lidarr.service'
        'lidarr.tmpfiles'
        'lidarr.sysusers')

sha512sums=('11bd4fc0021f813477f199d649f9cc98605d0538b9fc2cc4484e43ae84d924c24105436fc7b601d6b4fe516279b77e6b8bc8c7077fb3a3560b4bf1503018aee9'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')
sha512sums_x86_64=('c952724247ecd9ccfce81d9cb68944e5f920932893157c8c0ed4e8d05c06a3152edebd77ea46a9d8d1a0ae8245b2085d74abb1d5e7e3645ec30cba3a922446c8')
sha512sums_aarch64=('7e4480ec175c829b789aa52a75c2c3d5d62a9718717bf326b34e8211d8d338db8d8cc4c6cc9c5d7a7f1fb1ddecbf38502d79853309e26ec15219159fbfd1395b')
sha512sums_armv7h=('ec76587737667c90a6d8ddfb9578a4232b0b75200a8359c71d32375fd46bd45fb32247b2b75dffcea06db623a676154897409b35ca10dbf5fd8377827a5c62bd')



package() {
  # Update environment isn't needed.
  rm -rf "${srcdir}/Lidarr/Lidarr.Update"

  # The fpcalc binary comes from chromaprint.
  rm -rf "${srcdir}/Lidarr/fpcalc"
  
  install -d -m 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/lidarr/"
  chmod +x "${pkgdir}/usr/lib/lidarr/Lidarr"

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
