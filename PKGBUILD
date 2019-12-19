pkgbase=gdm-git
pkgname=(gdm-git libgdm-git)
pkgver=3.34.1+6+g8e109b8b
pkgrel=1
pkgdesc="Display manager and login screen"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=('gnome-shell' 'gnome-session' 'upower' 'xorg-xrdb' 'xorg-server' 'xorg-xhost')
makedepends=('yelp-tools' 'gobject-introspection' 'git' 'docbook-xsl')
checkdepends=('check')
source=("git+https://gitlab.gnome.org/GNOME/gdm.git"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-pam-arch-Don-t-check-greeter-account-for-expiry.patch
        0003-pam-arch-Restrict-greeter-service-to-the-gdm-user.patch)
sha256sums=('SKIP'
            '098ffb1cdc0232f014e5fe5fb8d268b752afc54d6ee661664036879acd075b22'
            '2e2b12d4609004a010245de51a8c017b164e84f249cd19706d020cb599d2d7e7'
            '3fa02eb7bbbe1586eae4ae98221a284251ca2869dc731c80b753e7effc443379')

pkgver() {
  cd gdm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir build
  cd gdm
  patch -Np1 -i ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch

  # https://bugs.archlinux.org/task/63706
  patch -Np1 -i ../0002-pam-arch-Don-t-check-greeter-account-for-expiry.patch
  patch -Np1 -i ../0003-pam-arch-Restrict-greeter-service-to-the-gdm-user.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd build
  ../gdm/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    with_dbus_sys=/usr/share/dbus-1/system.d \
    --disable-schemas-compile \
    --disable-static \
    --enable-gdm-xsession \
    --enable-ipv6 \
    --with-default-pam-config=arch \
    --with-default-path=/usr/local/bin:/usr/local/sbin:/usr/bin \
    --without-plymouth \
    --without-tcp-wrappers
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  make -C build check
}

package_gdm-git() {
  depends+=('libgdm')
  optdepends=('fprintd: fingerprint authentication')
  provides=('gdm')
  conflicts=('gdm')
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  install=gdm.install

  DESTDIR="$pkgdir" make -C build install

  chown -Rc 120:120 "$pkgdir/var/lib/gdm"

  # Unused or created at start
  rm -r "$pkgdir"/var/{cache,log,run}

### Split libgdm
  mkdir -p libgdm/{lib,share}
  mv -t libgdm       "$pkgdir"/usr/include
  mv -t libgdm/lib   "$pkgdir"/usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  mv -t libgdm/share "$pkgdir"/usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-git() {
  pkgdesc="GDM support library"
  depends=('systemd' 'glib2' 'dconf')
  provides=('libgdm')
  conflicts=('libgdm')
  mv libgdm "$pkgdir/usr"
}
