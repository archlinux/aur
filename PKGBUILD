# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Philip Müller <philm[at]manjaro[dog]org>
# Contributer : Roland Singer <roland[at]manjaro[dog]org>

pkgbase=mhwd-croco-git
pkgname=('mhwd-croco-git')
pkgver=r11.b17a3eb
pkgrel=1
pkgdesc="mhwd-croco(manjaro's mhwd backported to archlinux with additional features and limited to only dkms drivers)"
arch=('any')
_branch='master'
url="https://gitlab.com/croco-linux/applications/mhwd-croco"
license=('GPL')
depends=('gcc-libs' 'hwinfo')
makedepends=('git' 'cmake')
_git=yes
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/mhwd-croco"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd ${srcdir}/mhwd-croco

  if [ -e ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch ]; then
     patch -Np1 -i ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch
  fi

  cmake ./
  make all
}

package_mhwd-croco-git() {
  pkgdesc="mhwd-croco(manjaro's mhwd backported to archlinux with additional features and limited to only dkms drivers)"
  depends=('hwinfo' 'mesa' 'mhwd-db-croco-git' 'pacman' 'mesa-demos' 'vulkan-tools' 'libva-utils' 'vdpauinfo' 'vulkan-icd-loader' 'opencl-icd-loader')
  depends_x86_64=("lib32-mesa" "lib32-mesa-demos" "lib32-vulkan-icd-loader" "lib32-opencl-icd-loader")
  provides=("mhwd" "mhwd-croco")
  conflicts=("mhwd" "mhwd-croco")
  replaces=("mhwd-croco")
  install=mhwd.install

  cd ${srcdir}/mhwd-croco

  make DESTDIR="${pkgdir}" install
  install -d -m755 ${pkgdir}/var/lib/mhwd/{db,local}/{pci,usb}
}
