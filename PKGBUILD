# Maintainer: Librewish <librewish@gmail.com>
# maintainer: Philip Müller <philm[at]manjaro[dog]org>
# maintainer: Roland Singer <roland[at]manjaro[dog]org>

pkgbase=mhwd-garuda-git
pkgname=('mhwd-garuda-git')
pkgver=r11.b17a3eb
pkgrel=1
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
  pkgdesc="mhwd library and application"
  depends=('hwinfo' 'mesa' 'mhwd-db-garuda' 'uvesafb-dkms' 'pacman')
  provides=("mhwd")
  conflicts=("mhwd")
  if [ "${CARCH}" = "x86_64" ]; then
     optdepends=('lib32-mesa: for 32bit libgl support')
  fi
  install=mhwd.install

  cd ${srcdir}/mhwd-garuda

  make DESTDIR="${pkgdir}" install
  install -d -m755 ${pkgdir}/var/lib/mhwd/{db,local}/{pci,usb}
}
