# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://prowlarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="prowlarr"
pkgver=0.1.0.50
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Prowlarr/Prowlarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')
#optdepends=('sabnzbd: usenet downloader'
#            'nzbget: usenet downloader'
#            'transmission-cli: torrent downloader (CLI and daemon)'
#            'transmission-gtk: torrent downloader (GTK+)'
#            'transmission-qt: torrent downloader (Qt)'
#            'deluge: torrent downloader'
#            'rtorrent: torrent downloader'
#            'jackett: torrent indexer proxy'
#            'libgdiplus: provides a gdi+ compatible api')

source_x86_64=("prowlarr.develop.${pkgver}.linux-core-x64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("prowlarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("prowlarr.develop.${pkgver}.linux-core-arm.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=(
  'prowlarr.service'
  'prowlarr.tmpfiles'
  'prowlarr.sysusers'
  'package_info'
)

sha512sums=('9af66dd3d444064c01bc578376d71bedcd65f58f122e9e930e3347709f3b08166033d4f5518e375add94d68f24390a7ade1b62e57e331d8cd3fd2543a644c16a'
            '9159ceda0955f2ebc495dd470c9d6234d8534a120ab81fa58fefae94a8ecfdc8fe883fb1287bc10429e7b4f35ac59d36232d716c161a242a4bfcdff768f1b9a2'
            '6ebd6f268e5aa7446e3c77540f5c95b3237959892e8800f5f380a0f979c71ec0d6f7664c1a58f7d10a255bc21a19bad0fef8609b02b4d5e15f340e66364017d2'
            '0e305d68b950372ed169f3b89a3b97d3423f968460a11b9620e779444d04227091daaad5a9fcad1c24aa868fc5b39129ba247f4a09d9191292bfd20230f88da2')
sha512sums_x86_64=('dede775f9600df6155e1450ec43bc879ae24ca377e4fd8b628190a6f88928a85aab2ec7352cb4cb24ce95bb0b29b98bb1a152e117dae23982b4f98c9039e429c')
sha512sums_aarch64=('bd91753307ed4cb2d4c46e4c0a61b5889108809928ba4ecf66ffb8b273efee5bdf2043e38a919a4503824d42d6a8ed7a642fbe47d8080f0d75a48f813132db6e')
sha512sums_armv7h=('515d4271150ca08ffcfbae0fefde0477d7576dec5ec40c48a73be939061e8ccd6deb2967570258cf626637c4fb4395cce0f08bc0acc825d546dff4b7a5df810a')


package() {
  rm -rf "${srcdir}/Prowlarr/prowlarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/prowlarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Prowlarr/"* "${pkgdir}/usr/lib/prowlarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/prowlarr/bin"
  chmod +x "${pkgdir}/usr/lib/prowlarr/bin/Prowlarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/prowlarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/prowlarr/package_info"

  install -D -m 644 "${srcdir}/prowlarr.service" "${pkgdir}/usr/lib/systemd/system/prowlarr.service"
  install -D -m 644 "${srcdir}/prowlarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/prowlarr.conf"
  install -D -m 644 "${srcdir}/prowlarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/prowlarr.conf"
}
