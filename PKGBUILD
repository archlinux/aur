# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://services.lidarr.audio/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="lidarr-develop"
pkgver=0.7.1.1566
pkgrel=1
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

source_x86_64=("Lidarr.develop.${pkgver}.linux-core-x64.tar.gz::https://services.lidarr.audio/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Lidarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://services.lidarr.audio/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Lidarr.develop.${pkgver}.linux-core-arm.tar.gz::https://services.lidarr.audio/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('lidarr.service'
        'lidarr.tmpfiles'
        'lidarr.sysusers')

sha512sums=('11bd4fc0021f813477f199d649f9cc98605d0538b9fc2cc4484e43ae84d924c24105436fc7b601d6b4fe516279b77e6b8bc8c7077fb3a3560b4bf1503018aee9'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')
sha512sums_x86_64=('5ffe2ae3ab7443941bcacc78607deaadb32e2199106a962c17f948321ed3678a69eafe19028ed1b41d898f5a8fc8a9a8097b0716677a3ba28528198918530911')
sha512sums_aarch64=('d7e134f8e8a44ccb341bf1842e3e2cadab882715905ec8a758ea0d74b1009ac4c888bd5f7c293aab7dc3dfacdec793c271039c2b6bb78ed6aacfae05ffa2abd0')
sha512sums_armv7h=('6c17a29f3cf909610c07aa1afbd446f5fc91688590d0207aaf5cd6304e4c386609ee21e6cb280b0f88cb0a4988b72e727ba55607b0e71b1fd2b71d8f30585111')



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
