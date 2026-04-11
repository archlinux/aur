# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-multiseat
pkgname=(
  gdm-multiseat
  libgdm-multiseat
)
pkgver=50.0
pkgrel=1
pkgdesc="Display manager and login screen with multiseat support"
url="https://gitlab.gnome.org/GNOME/gdm"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  accountsservice
  audit
  bash
  gdk-pixbuf2
  glib2
  glibc
  gnome-session
  gnome-shell
  json-glib
  keyutils
  libcanberra
  libgcc
  libgudev
  libxau
  libxcb
  pam
  polkit
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
)
checkdepends=(check)
source=(
  "git+https://gitlab.gnome.org/GNOME/gdm.git#tag=${pkgver/[a-z]/.&}"
  0001-Xsession-Don-t-start-ssh-agent-by-default.patch
  291.patch
)
b2sums=('5c3784315c8718aabe6c4abacfca3bc00ac8d028f2a0442d397496633f1e0af44ac4dd156d8b2025212b68a43b3d837d32423aa82cc2be7d565f2445c8144839'
        'f7e868fdd7cc121433de1572583eb728f4d186cd4f52c6d6c8f2ccf4a3cf781144ff71f704f13571ddb97a1ff4ec55cfa3df25d38737ad19da21e84ddc2d3ee4'
        '3e29d50e6f96a7d56f40fae808ba25147a4c4114bae4fb48b1f7c9c698359dcca95d3eae65f9c288f4667b3f94a56f05761d36ea0e32898723c3453ec9e491db')

prepare() {
  cd gdm

  # Don't start ssh-agent by default
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch
  git apply -3 ../291.patch
}

build() {
  local meson_options=(
    -D dbus-sys="/usr/share/dbus-1/system.d"
    -D default-pam-config=arch
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin"
    -D gdm-xsession=true
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

package_gdm-multiseat() {
  depends+=(libgdm-multiseat)
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
  provides=(gdm)
  conflicts=(gdm)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  install -Dm644 /dev/stdin usr/lib/sysusers.d/gdm.conf <<END
g gdm 120 -
END
  mkdir -p var/lib/gdm

  install -Dm644 /dev/stdin usr/share/glib-2.0/schemas/30_org.archlinux.gdm.gschema.override <<END
[org.gnome.login-screen]
enable-smartcard-authentication=false
logo='/usr/share/pixmaps/archlinux-logo-text-dark.svg'
END

  _pick libgdm usr/include
  _pick libgdm usr/lib/{girepository-1.0,libgdm*,pkgconfig}
  _pick libgdm usr/share/{gir-1.0,glib-2.0}
}

package_libgdm-multiseat() {
  pkgdesc+=" - support library"
  depends=(
    dconf
    glib2
    glibc
    libgcc
    libg{lib,object,io}-2.0.so
    libsystemd.so
    systemd-libs
  )
  provides=(
      libgdm
      libgdm.so
  )
  conflicts=(libgdm)

  mv libgdm/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
