# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://prowlarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="prowlarr"
pkgver=0.1.1.978
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Prowlarr/Prowlarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')

source_x86_64=("prowlarr.develop.${pkgver}.linux-core-x64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("prowlarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("prowlarr.develop.${pkgver}.linux-core-arm.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=(
  'prowlarr.service'
  'prowlarr.tmpfiles'
  'prowlarr.sysusers'
  'package_info'
)

sha512sums=('bc0df2df010d8e272ff7a1fabc24e2012b87bc260bac79ffd7b3716e38fa9b2fe84c5f8f57b22e1812f702c3809d63086a0586db58ce66bfeeb2a9ad5cffd3ca'
            '9159ceda0955f2ebc495dd470c9d6234d8534a120ab81fa58fefae94a8ecfdc8fe883fb1287bc10429e7b4f35ac59d36232d716c161a242a4bfcdff768f1b9a2'
            '6ebd6f268e5aa7446e3c77540f5c95b3237959892e8800f5f380a0f979c71ec0d6f7664c1a58f7d10a255bc21a19bad0fef8609b02b4d5e15f340e66364017d2'
            '97adb155a014d909aa4234923f1734862a35e626afe926f341ea0ce0129ad35b8494c678f087ba4c71f451fd3462ee64420cc27f7ae5f1a6ef9dbaad9712046e')
sha512sums_x86_64=('909347ead13fba10d73518740f415f6b7ead450d931b1c2428e1c5cd4f176808bc7446a5192440ebd14866ca3f555e2eb124f6b30d996f0b03a65bccde7709c3')
sha512sums_aarch64=('d4b4f2b62715465580f1cc7963e30e105cb6e4b45522ec0eb249d3dd205369853532fd0af6e90b7adbdc0662b6a833bc7d1571e793b3e715828ade2a784a5c79')
sha512sums_armv7h=('0593f4557649cfe8235504cacf2dec6d7b9907f6321882a61662585136cd3af7e15e2a0cb3da176824ff7080cc8560d8c0d726717d195ebe517821cd7e231dd8')


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
