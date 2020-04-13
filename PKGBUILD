# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=i3lock-git
pkgver=2.12.r9.gf3b0612
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM"
arch=('i686' 'x86_64')
url="https://i3wm.org/i3lock/"
license=('MIT')
groups=('i3-vcs')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11')
backup=("etc/pam.d/i3lock")
options=('docs')
makedepends=('git')
source=('git://github.com/i3/i3lock#branch=master')
sha1sums=('SKIP')

_gitname='i3lock'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"

  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' pam/i3lock

  autoreconf -fiv
}

build() {
  cd "$_gitname"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}


package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1 ${pkgdir}/usr/share/man/man1/i3lock.1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
