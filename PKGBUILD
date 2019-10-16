# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/netcore?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="lidarr-netcore"
pkgver=0.7.1.1530
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
sha512sums_x86_64=('17b96f48d4f0085109d2885947997d66939d28bc3830c68a77fcb612a8eb57d829c08359ac78422718ef09e1c5d1b1589652bb4e954c8184699e390617750e01')
sha512sums_aarch64=('b73d0c8090bc46489cc1d2066b99bba832be3555e52821efea31ab51cef19bdd6d3f8098818aca6ac2157ba9821f175f486c10853f12f174595cd2fc81c8088e')
sha512sums_armv7h=('1855d5325e65ba1d53d00abb6c841eaabda688383c43b31c95ae2c4faccb5df829f975b69536292232e82cecbb4033cc1f65495aa97b225dfc6ee9ddea91f2ff')



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
