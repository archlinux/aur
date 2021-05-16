# Maintainer: robertfoster

pkgname=jacklistener-git
pkgver=r51.2e73f72
pkgrel=1
pkgdesc="Jack Listener Daemon (jack-sensing)"
arch=('i686' 'x86_64')
url="https://github.com/gentoo-root/jacklistener"
license=('GPL3')
depends=('dbus' 'udev')
optdepends=("jackeventcmd-git: Run custom commands when headphones are (un)plugged"
  "jacknotifier-git: Headphones Jack Notification Daemon"
  "musicpaused-git: Pause music when headphones are unplugged"
)
makedepends=('git' 'uthash')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  sed 's#AM_CONFIG_HEADER#AC_CONFIG_HEADERS#g' -i configure.ac
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  libtoolize
  aclocal -I m4
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --sbindir=/usr/bin \
    --sysconfdir=/etc --enable-systemd \
    --enable-arch --enable-udev
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  sed -i 's/sbin/bin/g' "${pkgdir}/usr/lib/systemd/system/jacklistener.service"
  install -D init.d/jacklistener-runscript "${pkgdir}/usr/bin/jacklistenerd-runscript"
  install -D jacklistenerd "${pkgdir}/usr/lib/jacklistener/jacklistenerd"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
