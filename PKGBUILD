# Maintainer: Carl Kittelberger <icedream@icedream.pw>

pkgname=spd5118-dkms-git
pkgver=r3.3beaed5
pkgrel=1
url="https://github.com/Steve-Tech/SPD5118-DKMS"
pkgdesc="René Rebe's driver for the SPD-5118 DDR5 Temperature sensor, with a DKMS config added."
license=('GPLv2')
arch=('any')
depends=('dkms')
conflicts=("spd5118-dkms")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
makedepends=('git')
source=("${pkgname}::git+https://github.com/Steve-Tech/SPD5118-DKMS.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  dir_name="${pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/src/${dir_name}/
  install -Dm644 "${srcdir}/${pkgname}"/* "${pkgdir}/usr/src/${dir_name}/"

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${pkgname}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
