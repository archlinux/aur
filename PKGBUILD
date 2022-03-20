# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Philip Müller <philm[at]manjaro[dog]org>
# Contributer : Roland Singer <roland[at]manjaro[dog]org>

pkgbase=mhwd-db-garuda-git
pkgname=('mhwd-db-garuda-git')
pkgver=r17.e3f7adf
pkgrel=1
pkgdesc="mhwd-db-garuda(manjaro's mhwd-db backported to archlinux with additional features and limited to only dkms drivers)"
arch=('any')
_branch='master'
url="https://gitlab.com/garuda-linux/applications/mhwd-db-garuda"
license=('GPL')
depends=('gcc-libs' 'hwinfo')
makedepends=('git' 'cmake')
_git=yes
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/mhwd-db-garuda"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd ${srcdir}/mhwd-db-garuda

  if [ -e ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch ]; then
     patch -Np1 -i ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch
  fi
}

package_mhwd-db-garuda-git() {
  pkgdesc="mhwd-db-garuda(manjaro's mhwd-db backported to archlinux with additional features and limited to only dkms drivers)"
  arch=('any')
  depends=('mhwd-nvidia' 'mhwd-ati' 'mhwd-amdgpu' 'mhwd-nvidia-470xx' 'mhwd-nvidia-390xx')
  depends_x86_64=('mhwd-nvidia' 'mhwd-ati' 'mhwd-amdgpu' 'mhwd-nvidia-470xx' 'mhwd-nvidia-390xx')
  replaces=("mhwd-db-garuda")
  provides=("mhwd-db" "mhwd-db-garuda")
  conflicts=("mhwd-db" "mhwd-db-garuda")
  install=mhwd-db.install

  cd ${srcdir}/mhwd-db-garuda/

  if [ -e ${srcdir}/../mhwd-db-${pkgver}-${pkgrel}.patch ]; then
     patch -Np1 -i ${srcdir}/../mhwd-db-${pkgver}-${pkgrel}.patch
  fi

  mkdir -p ${pkgdir}/var/lib/mhwd/db
  mkdir -p ${pkgdir}/etc/X11/mhwd.d

  cp -r pci ${pkgdir}/var/lib/mhwd/db/
  # cp -r usb ${pkgdir}/var/lib/mhwd/db/

  # remove nvidia on i686
  if [ "${CARCH}" = "i686" ]; then
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/nvidia-418xx/
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/nvidia-430xx/
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/nvidia-435xx/
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/nvidia-440xx/
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/hybrid-intel-nvidia-418xx-bumblebee/
     rm -r ${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/hybrid-intel-nvidia-430xx-bumblebee/
  fi
}
