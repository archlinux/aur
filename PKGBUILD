# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Philip Müller <philm[at]manjaro[dog]org>
# Contributer : Roland Singer <roland[at]manjaro[dog]org>

pkgbase=mhwd-garuda-git
pkgname=('mhwd-garuda-git')
pkgver=r20.dc8eff1
pkgrel=2
pkgdesc="mhwd-garuda(manjaro's mhwd backported to archlinux with additional features and limited to only dkms drivers)"
arch=('any')
_branch='master'
url="https://gitlab.com/garuda-linux/applications/mhwd-garuda"
license=('GPL')
depends=('gcc-libs' 'hwinfo')
makedepends=('git' 'cmake')
_git=yes
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/mhwd-garuda"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd ${srcdir}/mhwd-garuda

  if [ -e ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch ]; then
     patch -Np1 -i ${srcdir}/../mhwd-${pkgver}-${pkgrel}.patch
  fi

  cmake ./
  make all
}

package_mhwd-garuda-git() {
  pkgdesc="mhwd-garuda(manjaro's mhwd backported to archlinux with additional features and limited to only dkms drivers)"
  depends=('hwinfo' 'mesa' 'mhwd-db-garuda-git' 'pacman' 'mesa-demos' 'vulkan-tools' 'libva-utils' 'vdpauinfo' 'vulkan-icd-loader' 'opencl-icd-loader')
  depends_x86_64=("lib32-mesa" "lib32-mesa-demos" "lib32-vulkan-icd-loader" "lib32-opencl-icd-loader")
  provides=("mhwd" "mhwd-garuda")
  conflicts=("mhwd" "mhwd-garuda")
  replaces=("mhwd-garuda")
  install=mhwd.install

  cd ${srcdir}/mhwd-garuda

  make DESTDIR="${pkgdir}" install
  install -d -m755 ${pkgdir}/var/lib/mhwd/{db,local}/{pci,usb}
}
