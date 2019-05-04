# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-prime
pkgname=(gdm-prime libgdm-prime)
pkgver=3.32.0+2+g820f90f5
pkgrel=2
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(gnome-shell gnome-session upower xorg-xrdb xorg-server xorg-xhost)
makedepends=(yelp-tools gobject-introspection git docbook-xsl binutils make patch autoconf automake gcc)
checkdepends=(check)
_commit=820f90f5a78b81b2e4610da14627266c2135c8b0  # master
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-nvidia-prime.patch)
sha256sums=('SKIP'
            '3412f7da0205409f08a126a1d166b644fe0f1d0444f7cdebdce8e59cea2d672c'
            'f2ac60c8e4d62805dc2f441a8754f1c15e12c64ec0dbb1031dbd91dd47df52d9')

pkgver() {
  cd gdm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir build
  cd gdm
  patch -Np1 -i ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch
  patch -Np1 -i ../0002-nvidia-prime.patch
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
