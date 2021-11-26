# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-prime
pkgname=(gdm-prime libgdm-prime)
pkgver=41.0+r15+g23ebe617
pkgrel=1
pkgdesc="Display manager and login screen"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(gnome-shell gnome-session upower xorg-xrdb xorg-server xorg-xhost
         libxdmcp systemd)
makedepends=(yelp-tools gobject-introspection git docbook-xsl meson)
checkdepends=(check)
_commit=23ebe617119506a0614f1bd2c76cd9bcf7e8fb7c  # main
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-pam-arch-Drop-pam_faillock-counting-from-fingerprint.patch
        0003-nvidia-prime.patch
        default.pa)
sha256sums=('SKIP'
            '39a7e1189d423dd428ace9baac77ba0442c6706a861d3c3db9eb3a6643e223f8'
            'e3dcaaa5ffa2dd4d3338c8b5827965ea2ca1efd9a95d7272a107e6121cb7898f'
            'a1fb80c69454492390e4b7edac0efe55b2178c7031051d3eab99ed8c14d3e0e4'
            'e88410bcec9e2c7a22a319be0b771d1f8d536863a7fc618b6352a09d61327dcb')

pkgver() {
  cd gdm
  git describe --tags | sed 's/\.rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gdm

  # https://bugs.archlinux.org/task/67485
  git cherry-pick -n 8528a503ad70669a5f0c03d0a92ba19326983b82

  # Don't start ssh-agent by default
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch

  # https://bugs.archlinux.org/task/71750
  git apply -3 ../0002-pam-arch-Drop-pam_faillock-counting-from-fingerprint.patch

  git apply -3 ../0003-nvidia-prime.patch
}

build() {
  arch-meson gdm build \
    -D dbus-sys="/usr/share/dbus-1/system.d" \
    -D default-pam-config=arch \
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin" \
    -D gdm-xsession=true \
    -D ipv6=true \
    -D plymouth=disabled \
    -D run-dir=/run/gdm \
    -D selinux=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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

  meson install -C build --destdir "$pkgdir"

  install -d "$pkgdir/var/lib"
  install -d "$pkgdir/var/lib/gdm"                           -o120 -g120 -m1770
  install -d "$pkgdir/var/lib/gdm/.config"                   -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.config/pulse"             -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.local"                    -o120 -g120 -m700
  install -d "$pkgdir/var/lib/gdm/.local/share"              -o120 -g120
  install -d "$pkgdir/var/lib/gdm/.local/share/applications" -o120 -g120

  # https://src.fedoraproject.org/rpms/gdm/blob/master/f/default.pa-for-gdm
  install -t "$pkgdir/var/lib/gdm/.config/pulse" -o120 -g120 -m644 default.pa

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
