# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gksu-polkit-git
pkgver=0.0.2.r3.gd7e3160
pkgrel=1
epoch=2
pkgdesc="Replacement for gksu that uses PolicyKit"
arch=('x86_64' 'i686')
url="https://live.gnome.org/gksu"
license=('GPL3')
depends=('polkit' 'libgee06' 'gtk2' 'startup-notification' 'dbus-glib' 'xorg-xauth')
makedepends=('git' 'gtk-doc' 'vala' 'intltool')
provides=('gksu-polkit')
conflicts=('gksu-polkit')
source=("$pkgname::git://git.debian.org/~kov/gksu-polkit.git"
        "gksu-polkit-0.0.3-policy.patch"
        "gksu-polkit-dbus.patch"
        "gksu-polkit.service")
sha256sums=('SKIP'
            '334e26dce80e0dead984b04122d22ee13e4c5ff5d370098c7e46503855fad250'
            'a0efd0d989abb31c765f4eedda6e1ff99f99cfff1ef52bc11adb983505836f0d'
            '41ff7af4bfbb56893393f25135966b54c1bf7683fc38a2a0f0129fb23712b27b')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  # https://bugzilla.redhat.com/show_bug.cgi?id=883162
  # https://access.redhat.com/security/cve/CVE-2012-5617
  patch -Np1 -b -z .orig -i "$srcdir/gksu-polkit-0.0.3-policy.patch"

  # Systemd dbus service management
  patch -Np0 -b -z .orig -i "$srcdir/gksu-polkit-dbus.patch"
}

build() {
  cd $pkgname
  LDFLAGS=$(echo "$LDFLAGS"|sed 's|,--as-needed||')
  ./autogen.sh --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/gksu-polkit.service" \
    "$pkgdir/$(pkg-config systemd --variable=systemdsystemunitdir )/gksu.service"
}

# vim:set ts=2 sw=2 et:
