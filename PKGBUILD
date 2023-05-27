# Maintainer: Robin Lange <robin.langenc@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-prime
pkgname=(gdm-prime libgdm-prime)
pkgver=44.1
pkgrel=1
pkgdesc="Display manager and login screen - patched with Prime support for Optimus laptops"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=(GPL)
depends=(
  gnome-session
  gnome-shell
  libcanberra
  libxdmcp
  systemd
  upower
  xorg-server
  xorg-xhost
  xorg-xrdb
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  meson
  plymouth
  yelp-tools
)
checkdepends=(check)
_commit=b622872c5f24960c18900ebf14b5233b8701a8f9  # tags/44.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
  0001-Xsession-Don-t-start-ssh-agent-by-default.patch
  0002-nvidia-prime.patch
)
sha256sums=('SKIP'
            '39a7e1189d423dd428ace9baac77ba0442c6706a861d3c3db9eb3a6643e223f8'
            'a1fb80c69454492390e4b7edac0efe55b2178c7031051d3eab99ed8c14d3e0e4')

pkgver() {
  cd gdm
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gdm

  # https://gitlab.gnome.org/GNOME/gdm/-/issues/730
  git cherry-pick -n b29510dbc51ccf71a7c0ed656d21634a83766c0c

  # Don't start ssh-agent by default
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch

  git apply -3 ../0002-nvidia-prime.patch
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

package_gdm-prime() {
  provides=(gdm)
  conflicts=(gdm)
  depends+=(libgdm)
  optdepends=('fprintd: fingerprint authentication')
  backup=(etc/pam.d/gdm-autologin etc/pam.d/gdm-fingerprint etc/pam.d/gdm-launch-environment
          etc/pam.d/gdm-password etc/pam.d/gdm-smartcard etc/gdm/custom.conf
          etc/gdm/Xsession etc/gdm/PostSession/Default etc/gdm/PreSession/Default)
  groups=(gnome)
  install=gdm-prime.install

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

  install -Dm644 /dev/stdin usr/lib/sysusers.d/gdm.conf <<END
g gdm 120 -
u gdm 120 "Gnome Display Manager" /var/lib/gdm
END

  _pick libgdm usr/include
  _pick libgdm usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  _pick libgdm usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-prime() {
  pkgdesc+=" - support library"
  depends=(libsystemd.so libg{lib,object,io}-2.0.so)
  provides=(libgdm.so libgdm)
  conflicts=(libgdm)

  mv libgdm/* "$pkgdir"
}
