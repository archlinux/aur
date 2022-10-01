# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://prowlarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="prowlarr-nightly"
pkgver=0.4.7.1995
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
provides=('prowlarr')
conflicts=('prowlarr')

source_x86_64=("prowlarr.develop.${pkgver}.linux-core-x64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("prowlarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("prowlarr.develop.${pkgver}.linux-core-arm.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=(
  'prowlarr.service'
  'prowlarr.tmpfiles'
  'prowlarr.sysusers'
  'package_info'
)

sha512sums=('53b19cabb99b436867f8a95d94a5c4bdd924207c22c7b9f3df153c672ee87a69c87cbd3ad325bf1d78ceb0c615bc58e2df9cb03ff605bbef7c0b2ce77b0ca6c0'
            '9159ceda0955f2ebc495dd470c9d6234d8534a120ab81fa58fefae94a8ecfdc8fe883fb1287bc10429e7b4f35ac59d36232d716c161a242a4bfcdff768f1b9a2'
            '6ebd6f268e5aa7446e3c77540f5c95b3237959892e8800f5f380a0f979c71ec0d6f7664c1a58f7d10a255bc21a19bad0fef8609b02b4d5e15f340e66364017d2'
            '473f38f922c1c24987bc77bb687739e3de0eed5c567407c690e0e9ac1604479bbe4f606ccb804067dbe97a100a748b4c2e05a11e30835d42e67ec65177a4f42a')
sha512sums_x86_64=('e21bf19eec34c314684fe09f2b26b4a05e636aebfa481a268a21bc839f05bd26e5149eb47327e37485f2501e4afe5066fdddbb623a17c73a87f139c821e97bb8')
sha512sums_aarch64=('65f7256e2c96203b5c5146f081cbe0b6a983178b0023a47d96f6abd76f313e82bbeda82ed207892c8118c2c7577d249d0deff39368d8f6e683cf4a19fd511722')
sha512sums_armv7h=('c32ea89ba355e6ef5558c46d18b5eaf3feadfff466f923a79e947c593564bf7c6c4f4945fe90fe216829e0dab6c70abfdc7d6b91f98151c346a2505aac1e8347')


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
