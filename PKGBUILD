# Maintainer: M0Rf30

pkgname=jacklistener-git
pkgver=46.6779b2e
pkgrel=1
pkgdesc="Jack Listener Daemon (jack-sensing)"
arch=('i686' 'x86_64')
url="https://github.com/gentoo-root/jacklistener"
license=('GPL3')
provides=('jacklistener')
depends=('dbus')
optdepends=("jackeventcmd-git: Run custom commands when headphones are (un)plugged"
	    "jacknotifier-git: Headphones Jack Notification Daemon"
	    "musicpaused-git: Pause music when headphones are unplugged"
)
makedepends=('git')
source=('jacklistener::git://github.com/gentoo-root/jacklistener.git')

build() {
  cd jacklistener
  sed 's#AM_CONFIG_HEADER#AC_CONFIG_HEADERS#g' -i configure.ac 
  libtoolize
  aclocal -I m4
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc --enable-systemd --enable-arch
  make
}

package() {
   cd jacklistener
   make DESTDIR="$pkgdir" install
   install -D init.d/jacklistener-runscript $pkgdir/usr/bin/jacklistenerd-runscript
   install -D jacklistenerd $pkgdir/usr/lib/jacklistener/jacklistenerd
}

pkgver() {
  cd jacklistener
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
