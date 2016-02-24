# Maintainer: Manuel Olguin <manuel@niclabs.cl>

pkgname=i3lock-custom
pkgver=2.7.r20.g1b6765e
pkgrel=1
pkgdesc="Fork of i3lock which adds options to resize the indicator, hide the indicator text and set the indicator background opacity. See https://github.com/molguin92/i3lock-custom for reference."
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
source=(git://github.com/molguin92/i3lock-custom)
sha1sums=('SKIP')

_gitname='i3lock-custom'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
