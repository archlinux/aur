# Maintainer: Melvyn <melvyn2@brcok.tk>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Forked from: aur/linux-apfs-dkms-git
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: ManU
# Forked from aur/linux-can-dkms
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=linux-apfs-rw-dkms-git
epoch=1
pkgver=r288.10557ed
pkgrel=1
pkgdesc="Experimental APFS kernel module with Write support (DKMS)"
arch=('any')
url="https://github.com/linux-apfs/linux-apfs-rw"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+${url}.git"
        "version.patch")
sha256sums=('SKIP'
            '8a2814889a0a8a016d45cc2d7c032aec4a9f6eaa0a8551166c0124ce35bf766c')

prepare() {
  cd "$srcdir/linux-apfs-rw"
  patch -p1 < "$srcdir/version.patch"
}

pkgver() {
  cd "$srcdir/linux-apfs-rw"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/linux-apfs-rw"
  dkms_version=$(grep PACKAGE_VERSION dkms.conf | sed -r 's#PACKAGE_VERSION="([0-9.]+)"#\1#')
  dkms_dir="${pkgdir}/usr/src/linux-apfs-rw-$dkms_version/"
  make version
  install -Ddm755 "${dkms_dir}"
  cp -dr --no-preserve=ownership * "$dkms_dir"
}
