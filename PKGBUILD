# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Damian01w <damian01w@gmail.com>

_pkgbase=gdm
pkgbase=gdm-nox
pkgname=(gdm-nox libgdm-nox)
pkgver=46.0
pkgrel=1
pkgdesc="Display manager and login screen, but without the dependency on xorg-server"
url="https://wiki.gnome.org/Projects/GDM"
arch=(x86_64)
license=('GPL-2.0-or-later')
depends=(
  accountsservice
  audit
  bash
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-session
  gnome-shell
  gtk3
  json-glib
  keyutils
  libcanberra
  libgudev
  libx11
  libxau
  libxcb
  libxdmcp
  pam
  systemd
  systemd-libs
  upower
)
makedepends=(
  dconf
  plymouth
  python-packaging
  yelp-tools
  gobject-introspection
  git
  docbook-xsl
  meson
)
checkdepends=(check)
_commit=a5b591cd8d1db5c5d1ebe67d10ec3fe57b9bbded  # tags/46.0^0
source=("git+https://gitlab.gnome.org/GNOME/gdm.git#commit=$_commit"
        0001-Xsession-Don-t-start-ssh-agent-by-default.patch
        )
sha256sums=('bf1a7723223164be9afaa7f15af0da3251112a527b74f2fca7ef192ff2ffba9c'
            '39a7e1189d423dd428ace9baac77ba0442c6706a861d3c3db9eb3a6643e223f8')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgbase
  
  # Don't start ssh-agent by default
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch
}

build() {
  local meson_options=(
    -D dbus-sys="/usr/share/dbus-1/system.d"
    -D default-pam-config=arch
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin"
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

package_gdm-nox() {
  depends+=(libgdm-nox)
  optdepends=('fprintd: fingerprint authentication')
  provides=("gdm")
  conflicts=("gdm")
  replaces=("gdm-plymouth-nox")
  backup=(
    etc/gdm/PostSession/Default
    etc/gdm/PreSession/Default
    etc/gdm/Xsession
    etc/gdm/custom.conf
    etc/pam.d/gdm-autologin
    etc/pam.d/gdm-fingerprint
    etc/pam.d/gdm-launch-environment
    etc/pam.d/gdm-password
    etc/pam.d/gdm-smartcard
  )
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

package_libgdm-nox() {
  pkgdesc+=" - support library"
  depends=(
    dconf
    gcc-libs
    glib2
    glibc
    libg{lib,object,io}-2.0.so
    libsystemd.so
    systemd-libs
  )
  provides=(libgdm)
  conflicts=(libgdm)
  replaces=("libgdm-plymouth-nox")

  mv libgdm/* "$pkgdir"
}
