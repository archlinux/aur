# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=facron-git
pkgver=20150129
pkgrel=1
pkgdesc="Advanced filesystem cron based on fanotify"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'gcc' 'git' 'make' 'pkg-config')
url="https://github.com/Keruspe/facron"
license=('GPL3')
source=(git+https://github.com/Keruspe/facron)
sha256sums=('SKIP')
provides=('facron')
conflicts=('facron')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/facron \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/facron \
    --localstatedir=/var/lib/facron \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
