pkgbase=gdm-git
pkgname=('gdm-git' 'libgdm-git')
pkgver=3.37.1+2+g5e321bbe
pkgrel=1
pkgdesc="Display manager and login screen"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=('gnome-shell' 'gnome-session' 'upower' 'xorg-xrdb' 'xorg-server' 'xorg-xhost')
makedepends=('yelp-tools' 'gobject-introspection' 'git' 'docbook-xsl')
source=("git+https://gitlab.gnome.org/GNOME/gdm.git"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-pam-arch-Don-t-check-greeter-account-for-expiry.patch
        0003-pam-arch-Restrict-greeter-service-to-the-gdm-user.patch)
sha512sums=('SKIP'
            '08566451366502496c1892aa1a7f6e244fd64d170c45e51bd9d60d48afbd761e6aad43d7d6c46958b6073b058952ffa0d14392c27463de49fd6505160025fe8c'
            'a21056d37632abc91e59c99eb396b742083e3142d36bc6333c2b81fb00be3e595c1f695aebf09e798627bd137b7d5ef782ba047c5596da3cc0f9185dcb890d6d'
            '02bfafce2c77b25545d72aeccb0606b7425d85d4c2d6bfaf0632bd46997d57acfe35cd686aeafda08018d555f0b690f192752b1baad951d5e47dd0e636267559')

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
}

build() {
  arch-meson gdm build \
  -Dplymouth=disabled \
  -Dselinux=disabled
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
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

  DESTDIR="$pkgdir" meson install -C build

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

package_libgdm-git() {
  pkgdesc="GDM support library"
  depends=('systemd' 'glib2' 'dconf')
  provides=('libgdm')
  conflicts=('libgdm')
  mv libgdm "$pkgdir/usr"
}
