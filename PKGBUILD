# Contributor: Pavel Ordenko <zoltor@gmail.com>
# This PKGBUILD based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=i3lock-lixxia-git

pkgname=i3lock-cac03-git
pkgver=r219.98bbe80
pkgrel=1
epoch=1
pkgdesc="An improved screenlocker based upon XCB and PAM (cac03 fork) with clock, layout indicator, CAPS indicator"
arch=('x86_64')
url="https://github.com/cac03/i3lock"
license=('MIT')
groups=("i3")
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11' 'pam' 'libxkbfile')
makedepends=('git')
provides=('i3lock')
conflicts=('i3lock')
backup=("etc/pam.d/i3lock")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "i3lock"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short=7 HEAD)
}

prepare() {
  # fix Makefile since there are no tags
  sed -i '/^VERSION/d' i3lock/Makefile
}

build() {
  cd "i3lock"
  make
}

package() {
  cd "i3lock"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1 "${pkgdir}/usr/share/man/man1/i3lock.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
