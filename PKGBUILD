# Maintainer: Andrew Fader (afader) <fader@yagni.co>

pkgbase=(gdm-wayland-nvidia)
pkgname=(gdm-wayland-nvidia libgdm-wayland-nvidia)
_pkgname=(gdm)
pkgver=3.30.1+1+g7b499a0d
pkgrel=1
pkgdesc="Display manager and login screen"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(gnome-shell gnome-session upower xorg-xrdb xorg-server xorg-server-xwayland xorg-xhost)
makedepends=(yelp-tools intltool gobject-introspection git docbook-xsl)
checkdepends=(check)
_commit=9e532ea4b400914704e063d81d21c73c9b84c048  # tags/3.30.1^0
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0002-Xsession-Don-t-start-ssh-agent-by-default.patch
        gdm.sysusers)
provides=(gdm)
conflicts=(gdm)
sha256sums=('SKIP'
            '9449da0b6ee58aa3fde65e6d8d1f30513e4176a7dc6d176f17f320ce82cb1d82'
            '6d9c8e38c7de85b6ec75e488585b8c451f5d9b4fabd2a42921dc3bfcc4aa3e13')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git revert 5cd78602 --no-edit
  patch -Np1 -i ../0002-Xsession-Don-t-start-ssh-agent-by-default.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
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
  cd $_pkgname
  make check
}

package_gdm-wayland-nvidia() {
  depends+=(libgdm-wayland-nvidia)
  optdepends=('fprintd: fingerprint authentication')
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  groups=(gnome)

  cd $_pkgname
  make DESTDIR="$pkgdir" install

  chown -Rc 120:120 "$pkgdir/var/lib/gdm"

  # Unused or created at start
  rm -r "$pkgdir"/var/{cache,log,run}

  install -Dm644 ../gdm.sysusers "$pkgdir/usr/lib/sysusers.d/gdm.conf"

### Split libgdm
  make -C libgdm DESTDIR="$pkgdir" uninstall
  mv "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.login-screen.gschema.xml" "$srcdir"
}

package_libgdm-wayland-nvidia() {
  pkgdesc="GDM support library"
  depends=(systemd glib2 dconf)
  conflicts=(libgdm)
  provides=(libgdm)

  cd $_pkgname
  make -C libgdm DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/glib-2.0/schemas" -m644 \
    "$srcdir/org.gnome.login-screen.gschema.xml"
}
