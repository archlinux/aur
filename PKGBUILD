# Maintainer: Blacky Fox <blacky@blackyfox.net>
# Contributor: Filippo Roggi <zzkw35@gmail.com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>

_pkgbase=gdm
pkgbase=gdm-plymouth-prime
pkgname=(gdm-plymouth-prime libgdm-plymouth-prime)
pkgver=43.0
pkgrel=1
pkgdesc="Display manager and login screen with plymouth and Prime support for Optimus laptops"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(plymouth gnome-shell gnome-session upower systemd xorg-xrdb xorg-server xorg-xhost libxdmcp libcanberra)
makedepends=(yelp-tools gobject-introspection git docbook-xsl meson)
checkdepends=(check)
_commit=afa6f2ef3d34048cd7a3e1a1ec478be2ff464806  # tags/43.0
source=("git+https://github.com/GNOME/gdm.git#commit=$_commit"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        0002-pam-arch-Remove-user_readenv-1-from-pam_env.patch
        0003-nvidia-prime.patch)
sha256sums=('SKIP'
            '39a7e1189d423dd428ace9baac77ba0442c6706a861d3c3db9eb3a6643e223f8'
            '7e42077a89a6fcf8b02244b01127af7000a10ed55e09e385eb6fac5aef421c07'
            'a1fb80c69454492390e4b7edac0efe55b2178c7031051d3eab99ed8c14d3e0e4')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgbase
  
  # Don't start ssh-agent by default
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch

  # https://bugs.archlinux.org/task/68945
  git apply -3 ../0002-pam-arch-Remove-user_readenv-1-from-pam_env.patch

  # Patch with Prime support for Optimus laptops
  git apply -3 ../0003-nvidia-prime.patch
}

build() {
  local meson_options=(
    -D dbus-sys="/usr/share/dbus-1/system.d"
    -D default-pam-config=arch
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin"
    -D gdm-xsession=true
    -D ipv6=true
    -D run-dir=/run/gdm
    -D selinux=disabled
  )

  arch-meson gdm build "${meson_options[@]}"
  meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
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

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  install -d -o   0 -g   0 -m 0755 var
  install -d -o   0 -g   0 -m 0755 var/lib
  install -d -o 120 -g 120 -m 1770 var/lib/gdm
  install -d -o 120 -g 120 -m 0700 var/lib/gdm/.config
  install -d -o 120 -g 120 -m 0700 var/lib/gdm/.config/pulse
  install -d -o 120 -g 120 -m 0700 var/lib/gdm/.local
  install -d -o 120 -g 120 -m 0755 var/lib/gdm/.local/share
  install -d -o 120 -g 120 -m 0755 var/lib/gdm/.local/share/applications

  # https://src.fedoraproject.org/rpms/gdm/blob/master/f/default.pa-for-gdm
  install -o120 -g120 -m644 /dev/stdin var/lib/gdm/.config/pulse/default.pa <<END
load-module module-device-restore
load-module module-card-restore
load-module module-udev-detect
load-module module-native-protocol-unix
load-module module-default-device-restore
load-module module-always-sink
load-module module-intended-roles
load-module module-suspend-on-idle
load-module module-systemd-login
load-module module-position-event-sounds
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/gdm.conf" <<END
g gdm 120 -
u gdm 120 "Gnome Display Manager" /var/lib/gdm
END

  _pick libgdm usr/include
  _pick libgdm usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  _pick libgdm usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-plymouth-prime() {
  pkgdesc+=" - support library"
  depends=(libsystemd.so libg{lib,object,io}-2.0.so)
  provides=(libgdm)
  conflicts=(libgdm)

  mv libgdm/* "$pkgdir"
}
