# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdm-multiseat
pkgname=(
  gdm-multiseat
  libgdm-multiseat
)
pkgver=49.1
pkgrel=1
pkgdesc="Display manager and login screen with multiseat support"
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
#  xorg-server
#  xorg-xhost
#  xorg-xrdb
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
  291.patch
)
b2sums=('f572859eeedc982b41819a0181baccdd3e1d8a364de4f9cf0335f0ad59678d95857478276537bc61839728076cf4150383fa2158d4a52847de9ba99a2b191826'
        'f7e868fdd7cc121433de1572583eb728f4d186cd4f52c6d6c8f2ccf4a3cf781144ff71f704f13571ddb97a1ff4ec55cfa3df25d38737ad19da21e84ddc2d3ee4'
        '0264316685d58b04ec28dbfa72d3be9e082b59b504ef68df1e7eabc3c6e0cd44c5dbd9bf595207090d94c624f9f7aefd2b958431212549a12989a7859743f654')

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
    gcc-libs
    glib2
    glibc
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
