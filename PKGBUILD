# Maintainer: melvyn2 <melvyn(dot)depeyrot(at)gmail(dot)com>
# Forked from: aur/linux-apfs-dkms-git
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: ManU
# Forked from aur/linux-can-dkms
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=linux-apfs-rw-dkms-git
epoch=1
pkgver=r53.58104ba
pkgrel=1
pkgdesc="Experimental APFS kernel module with Write support (DKMS)"
arch=('any')
url="https://github.com/linux-apfs/linux-apfs-rw"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+${url}.git"
	'dkms_module_name.patch')
sha256sums=('SKIP'
	    '4890c2589d30ca88fbf782a7bc101853ed51d939272c2f466e27bc56f54dded4')

pkgver() {
  cd linux-apfs-rw
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/linux-apfs-rw"
    patch --forward --strip=1 --input="${srcdir}/dkms_module_name.patch"
}

package() {
  cd linux-apfs-rw
  dkms_version=$(grep PACKAGE_VERSION dkms.conf | sed -r 's#PACKAGE_VERSION="([0-9.]+)"#\1#')
  dkms_dir="${pkgdir}/usr/src/linux-apfs-rw-$dkms_version/"
  install -Ddm755 "${dkms_dir}"
  cp -dr --no-preserve=ownership * "$dkms_dir"
}
