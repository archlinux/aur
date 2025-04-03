# Maintainer: Robin Lange <robin.langenc@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-prime
pkgname=(
  gdm-prime
  libgdm-prime
)
pkgver=48.0
pkgrel=1
pkgdesc="Display manager and login screen - patched with Prime support for Optimus laptops"
url="https://gitlab.gnome.org/GNOME/gdm"
arch=(x86_64)
license=(GPL-2.0-or-later)
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
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  meson
  plymouth
  yelp-tools
  xorg-server
  xorg-xhost
  xorg-xrdb
)
optdepends=(
  'xorg-server: X session support'
  'xorg-xhost: X session support'
  'xorg-xrdb: X session support'
)
checkdepends=(check)
source=(
  "git+https://gitlab.gnome.org/GNOME/gdm.git#tag=${pkgver/[a-z]/.&}"
  0001-Xsession-Don-t-start-ssh-agent-by-default.patch
  0002-nvidia-prime.patch
)
b2sums=('d08d2137f630999b2f36bd8b798805e145fd7350fc4a092056cfdddd2170ae57b3b17a3a8f44f4c08a7e527a165fdce0dfa7a934188bc487d2a6d5bd848497b0'
        'f7e868fdd7cc121433de1572583eb728f4d186cd4f52c6d6c8f2ccf4a3cf781144ff71f704f13571ddb97a1ff4ec55cfa3df25d38737ad19da21e84ddc2d3ee4'
        'b02edd38bb178b457379717633f935f18bea153470905d34675a587c807a4c0de79e48cc82c53ec5a139d667f57c13e652ea6d9cb3a7fcd05bdd59b9cf715b45')

prepare() {
  cd gdm

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

  install -Dm644 /dev/stdin usr/share/glib-2.0/schemas/org.gnome.login-screen.gschema.override <<END
[org.gnome.login-screen]
enable-smartcard-authentication=false
logo='/usr/share/pixmaps/archlinux-logo-text-dark.svg'
END

  _pick libgdm usr/include
  _pick libgdm usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  _pick libgdm usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-prime() {
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
  provides=(libgdm.so libgdm)
  conflicts=(libgdm)

  mv libgdm/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
