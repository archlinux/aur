# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://prowlarr.servarr.com/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="prowlarr"
pkgver=1.0.1.2220
pkgrel=1
pkgdesc="Usenet and torrent aggregator, similar to nzbhydra2 and jackett."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Prowlarr/Prowlarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')
optdepends=(
  'sonarr: automatically adds and remove indexers/trackers'
  'radarr: automatically adds and remove indexers/trackers'
  'lidarr: automatically adds and remove indexers/trackers'
  'readarr: automatically adds and remove indexers/trackers'
)

source_x86_64=("prowlarr.master.${pkgver}.linux-core-x64.tar.gz::https://prowlarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("prowlarr.master.${pkgver}.linux-core-arm64.tar.gz::https://prowlarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("prowlarr.master.${pkgver}.linux-core-arm.tar.gz::https://prowlarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=(
  'prowlarr.service'
  'prowlarr.tmpfiles'
  'prowlarr.sysusers'
  'package_info'
)

sha512sums=('53b19cabb99b436867f8a95d94a5c4bdd924207c22c7b9f3df153c672ee87a69c87cbd3ad325bf1d78ceb0c615bc58e2df9cb03ff605bbef7c0b2ce77b0ca6c0'
            '9159ceda0955f2ebc495dd470c9d6234d8534a120ab81fa58fefae94a8ecfdc8fe883fb1287bc10429e7b4f35ac59d36232d716c161a242a4bfcdff768f1b9a2'
            '6ebd6f268e5aa7446e3c77540f5c95b3237959892e8800f5f380a0f979c71ec0d6f7664c1a58f7d10a255bc21a19bad0fef8609b02b4d5e15f340e66364017d2'
            '13562cac353f9fbf3545613d49186b5c7b35a3726b003133044212f65ec51eece88fb06017a90d0a67fa5cf694fed142c20704cc174b408016f9e3176296c5b6')
sha512sums_x86_64=('9fdf49633687b309c8d9ccc64700e5a0e32c5f46174136f5f451d43054683250003800c1a6289e93066d1e2e84deb3bd78c13b93349c4bccc5fe6c9baa4b8c01')
sha512sums_aarch64=('a349fa9479c8fef0dc9097144dd5b3c626dbabd06f9b6ef46da708e1275328f2d83fb0e7711187dfab74f0215c72e5c0eb27fd473ee666fb3573a27ff6abb70f')
sha512sums_armv7h=('695dd17595d679c5d372e7b031635431f3f0f455c86667c4c2b773ffdc55db7450e96cdecceaaeda53c181e1e21bc7fa8617885177afdcb93211b6ed0c8eb44e')


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
