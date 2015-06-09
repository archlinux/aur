# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=i3lock-git
pkgver=2.6
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM"
arch=('i686' 'x86_64')
url="http://i3wm.org/i3lock/"
license=('MIT')
groups=('i3-vcs')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11')
backup=("etc/pam.d/i3lock")
options=('docs')
makedepends=('git')
source=(git://code.i3wm.org/i3lock)
sha1sums=('SKIP')

_gitname='i3lock'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"

  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' i3lock.pam

  make
  gzip i3lock.1
}


package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:

