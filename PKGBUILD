# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Damian01w <damian01w@gmail.com>

_pkgbase=gdm
pkgbase=gdm-plymouth
pkgname=(gdm-plymouth libgdm-plymouth)
pkgver=3.20.0
pkgrel=1
pkgdesc="Gnome Display Manager with Plymouth support."
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org"
depends=(plymouth gnome-shell gnome-session upower xorg-xrdb xorg-server xorg-server-xwayland xorg-xhost)
makedepends=(itstool intltool yelp-tools gobject-introspection)
checkdepends=('check')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgbase/${pkgver:0:4}/$_pkgbase-$pkgver.tar.xz
	0002-Xsession-Don-t-start-ssh-agent-by-default.patch)
sha256sums=('c64fba0bb07a86504bc8cb877fd529938c1cc931b6ff1cbca0e99b4a24d9d3c2'
            '63f99db7623f078e390bf755350e5793db8b2c4e06622caf42eddc63cd39ecca')

prepare() {
  cd $_pkgbase-$pkgver

  patch -Np1 -i ../0002-Xsession-Don-t-start-ssh-agent-by-default.patch

  AUTOPOINT='intltoolize --automake -c' autoreconf -fi
}

build() {
  cd $_pkgbase-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/gdm \
    --localstatedir=/var \
    --disable-static \
    --disable-schemas-compile \
    --enable-gdm-xsession \
    --enable-ipv6 \
    --with-plymouth \
    --with-at-spi-registryd-directory=/usr/lib/at-spi2-core \
    --with-check-accelerated-directory=/usr/lib/gnome-session \
    --with-authentication-agent-directory=/usr/lib/polkit-gnome \
    --with-gnome-settings-daemon-directory=/usr/lib/gnome-settings-daemon \
    --without-consolekit \
    --without-tcp-wrappers \
    --with-systemd \
    --with-default-pam-config=arch

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

check() {
  cd $_pkgbase-$pkgver
  make check
}

package_gdm-plymouth() {
  depends+=(libgdm-plymouth)
  provides=("gdm")
  conflicts=("gdm")
  optdepends=('fprintd: fingerprint authentication')
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  groups=(gnome)
  install=gdm-plymouth.install

  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  chmod 711 "$pkgdir/var/log/gdm"
  rm -r "$pkgdir/var/run"

### Split libgdm
  make -C libgdm DESTDIR="$pkgdir" uninstall
  mv "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.login-screen.gschema.xml" "$srcdir"
}

package_libgdm-plymouth() {
  pkgdesc="GDM support library including Plymouth support"
  depends=(systemd glib2)
  provides=("libgdm")
  conflicts=("libgdm")
  install=libgdm-plymouth.install

  cd $_pkgbase-$pkgver
  make -C libgdm DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/org.gnome.login-screen.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.login-screen.gschema.xml"
}

