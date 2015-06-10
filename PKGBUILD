# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jacob Courtneay <jacob@sporkexec.com>
pkgname=sscrotwm-git
pkgver=r33.07c58bf
pkgrel=1
pkgdesc="Shriveled scrotwm: A minimalist fork of scrotwm/spectrwm."
arch=('i686' 'x86_64')
url="http://github.com/sporkexec/sscrotwm"
license=('custom:ISC')
depends=('libxrandr' 'bash')
backup=(etc/sscrotwm.conf)
provides=('sscrotwm')
conflicts=('sscrotwm')
makedepends=('git')
optdepends=('scrot: screenshots' 'xlockmore: screenlocking' 'dmenu: program launching')
source=("$pkgname::git+https://github.com/sporkexec/sscrotwm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname/linux
  ln -s ../version.h version.h
}

build() {
  cd $pkgname/linux
  make PREFIX=/usr
}

package() {
  cd $pkgname/linux
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm0644 sscrotwm.desktop "$pkgdir/usr/share/xsessions/sscrotwm.desktop"
  cd ..
  install -Dm0644 sscrotwm.conf "$pkgdir/etc/sscrotwm.conf"
  install -Dm0755 screenshot.sh "$pkgdir/usr/share/sscrotwm/screenshot.sh"
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: set sw=2 et:
