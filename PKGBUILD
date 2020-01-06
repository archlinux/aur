# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=budgie-screensaver
pkgver=3.6.0.r36.g1ef29c0
pkgrel=2
pkgdesc="Ubuntu Budgie's fork of GNOME's legacy screensaver"
arch=('x86_64')
license=('GPL')
url="https://github.com/getsolus/budgie-screensaver"
backup=(etc/pam.d/gnome-screensaver)
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
provides=(gnome-screensaver)
conflicts=(gnome-screensaver)
source=("${pkgname}::git+${url}"
        gnome-screensaver.pam)

sha256sums=('SKIP'
            'b6ea9e2eb586d94bcabb617a8f1c2958111df87afdbb51f645882bccdc15cbda')

pkgver() {
  cd "${pkgname}"
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  # Fix build with systemd support
  sed -i 's/libsystemd-login libsystemd-daemon/libsystemd/' configure.ac

  autoreconf -fi
  ./autogen.sh
}

build() {
  cd "${pkgname}"
  CFLAGS+=" -Wno-error=return-type"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --with-mit-ext --without-console-kit --with-systemd
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../gnome-screensaver.pam "$pkgdir/etc/pam.d/gnome-screensaver"
}
