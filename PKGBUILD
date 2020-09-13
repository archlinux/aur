# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-prime
pkgname=(gdm-prime libgdm-prime)
pkgver=3.36.3
pkgrel=1
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(gnome-shell gnome-session upower xorg-xrdb xorg-server xorg-xhost)
makedepends=(yelp-tools gobject-introspection git docbook-xsl)
checkdepends=(check)
_commit=24a4c0afe337a7a381397c87a39e3a666c0ae6cc  # tags/3.36.3^0
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-pam-arch-Don-t-check-greeter-account-for-expiry.patch
        0003-pam-arch-Restrict-greeter-service-to-the-gdm-user.patch
	0004-pam-arch-Update-to-match-pambase-20200721.1-2.patch
        0005-nvidia-prime.patch)
sha256sums=('SKIP'
            'b9ead66d2b6207335f0bd982a835647536998e7c7c6b5248838e5d53132ca21a'
            'd89a3a852c9656a61a3d418817c883f7a607a0e65aa0eaf9904738c0299f006d'
            'c18dc79bdd3207c66b6f66a41a51dd069442d2e9053055147c2f90e39f0c4a7d'
            'c4d04a019a7f7db57c6909d76f3c8f3dbaf7be86c81d38c6672f1c730bd5b72d'
            'f2ac60c8e4d62805dc2f441a8754f1c15e12c64ec0dbb1031dbd91dd47df52d9')

prepare() {
  mkdir build
  cd gdm
  patch -Np1 -i ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch

  # https://bugs.archlinux.org/task/63706
  patch -Np1 -i ../0002-pam-arch-Don-t-check-greeter-account-for-expiry.patch
  patch -Np1 -i ../0003-pam-arch-Restrict-greeter-service-to-the-gdm-user.patch

  # https://bugs.archlinux.org/task/67485
  patch -Np1 -i ../0004-pam-arch-Update-to-match-pambase-20200721.1-2.patch

  patch -Np1 -i ../0005-nvidia-prime.patch

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

package_gdm-prime() {
  provides=(gdm)
  conflicts=(gdm)
  pkgdesc="Display manager and login screen - patched with Prime support for Optimus laptops"
  depends+=(libgdm)
  optdepends=('fprintd: fingerprint authentication')
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  groups=(gnome)
  install=gdm-prime.install

  DESTDIR="$pkgdir" make -C build install

  chown -Rc 120:120 "$pkgdir/var/lib/gdm"

  # Unused or created at start
  rm -r "$pkgdir"/var/{cache,log,run}

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/gdm.conf" <<END
g gdm 120 -
u gdm 120 "Gnome Display Manager" /var/lib/gdm
END

### Split libgdm
  mkdir -p libgdm/{lib,share}
  mv -t libgdm       "$pkgdir"/usr/include
  mv -t libgdm/lib   "$pkgdir"/usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  mv -t libgdm/share "$pkgdir"/usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-prime() {
  provides=(libgdm)
  conflicts=(libgdm)
  pkgdesc="GDM support library - patched with Prime support for Optimus laptops"
  depends=(systemd glib2 dconf)
  mv libgdm "$pkgdir/usr"
}
