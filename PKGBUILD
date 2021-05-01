# Maintainer: Filippo Roggi <zzkw35@gmail.com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>

_pkgbase=gdm
pkgbase=gdm-plymouth-prime
pkgname=(gdm-plymouth-prime libgdm-plymouth-prime)
pkgver=40.0
pkgrel=1
pkgdesc="Display manager and login screen with plymouth and Prime support for Optimus laptops"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(plymouth gnome-shell gnome-session upower systemd xorg-xrdb xorg-server xorg-xhost libxdmcp)
makedepends=(yelp-tools gobject-introspection git docbook-xsl meson)
checkdepends=(check)
_commit=3246bf1af8589899621649df523e6840e4858cda  # tags/40.0^0
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0001-pam-arch-Update-to-match-pambase-20200721.1-2.patch
        0002-Xsession-Don-t-start-ssh-agent-by-default.patch
        0003-nvidia-prime.patch
        default.pa)
sha256sums=('SKIP'
            'f32555703d4f3b6babbe49ddd2c82295238623050b63826c95a959d5caec37f8'
            'aa751223e8664f65fe2cae032dc93bb94338a41cfca4c6b66a0fca0c788c4313'
            'a1fb80c69454492390e4b7edac0efe55b2178c7031051d3eab99ed8c14d3e0e4'
            'e88410bcec9e2c7a22a319be0b771d1f8d536863a7fc618b6352a09d61327dcb')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/\.rc/rc/;s/-/+/g'
}

prepare() {
  cd $_pkgbase
  

  # https://bugs.archlinux.org/task/67485
  git apply -3 ../0001-pam-arch-Update-to-match-pambase-20200721.1-2.patch
  
  
  # Don't start ssh-agent by default
  git apply -3 ../0002-Xsession-Don-t-start-ssh-agent-by-default.patch


  # Patch with Prime support for Optimus laptops
  git apply -3 ../0003-nvidia-prime.patch
}

build() {
  arch-meson gdm build \
    -D dbus-sys="/usr/share/dbus-1/system.d" \
    -D default-pam-config=arch \
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin" \
    -D gdm-xsession=true \
    -D ipv6=true \
    -D run-dir=/run/gdm \
    -D selinux=disabled
  meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package_gdm-plymouth-prime() {
  depends+=(libgdm-plymouth-prime)
  optdepends=('fprintd: fingerprint authentication')
  provides=("gdm")
  conflicts=("gdm")
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  groups=(gnome)
  install=gdm.install

  DESTDIR="$pkgdir" meson install -C build

  install -d "$pkgdir/var/lib"
  install -d "$pkgdir/var/lib/gdm"                           -o120 -g120 -m1770
  install -d "$pkgdir/var/lib/gdm/.config"                   -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.config/pulse"             -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.local"                    -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.local/share"              -o120 -g120
  install -d "$pkgdir/var/lib/gdm/.local/share/applications" -o120 -g120

  # https://src.fedoraproject.org/rpms/gdm/blob/master/f/default.pa-for-gdm
  install -Dt "$pkgdir/var/lib/gdm/.config/pulse" -o120 -g120 -m644 default.pa

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

package_libgdm-plymouth-prime() {
  pkgdesc="GDM support library with plymouth support"
  depends=(systemd glib2 dconf)
  provides=("libgdm")
  conflicts=("libgdm")
  mv libgdm "$pkgdir/usr"
}
