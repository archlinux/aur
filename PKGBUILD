# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# gdm-selinux: a drop-in replacement for the official `gdm` built from a small
# SELinux fork (gitlab.gnome.org/nikicat/gdm, branch `selinux`) plus
# -D selinux=enabled. The fork clears the pending pam_selinux exec context in the
# session-worker-job child setup, so the screen-UNLOCK reauthentication worker
# runs in gdm's own SELinux domain (xdm_t) instead of inheriting the staff_t exec
# context the login worker armed for the user session. Without it the whole unlock
# PAM core (pam_faillock, pam_systemd, audit_write/net_admin/setuid) runs as
# staff_t, leaking login capabilities into the user's shell domain. Arch builds
# stock gdm with -D selinux=disabled, which also compiles out gdm's own existing
# setexeccon(NULL) guard; this package re-enables both.
#
# Only the gdm daemon is patched, so libgdm is byte-identical to upstream: this
# package ships just `gdm` and depends on the stock `libgdm`.

pkgname=gdm-selinux
pkgver=50.1
pkgrel=1
pkgdesc="Display manager and login screen (SELinux fork: screen-unlock reauth runs as xdm_t, not staff_t)"
url="https://gitlab.gnome.org/nikicat/gdm"
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
  libgdm
  libgudev
  libselinux
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
  libselinux
  meson
  plymouth
  yelp-tools
)
checkdepends=(check)
provides=("gdm=$pkgver")
conflicts=(gdm)
replaces=(gdm)
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
# Pinned to the fork commit so the AUR build is reproducible (not a moving
# branch). Rebase the fork's `selinux` branch onto a new gdm tag, push, and bump
# pkgver + this commit to update.
source=(
  "gdm::git+https://gitlab.gnome.org/nikicat/gdm.git#commit=d370ba5910c33b31df7ba4ec4f3f49eabd672add"
  0001-Xsession-Don-t-start-ssh-agent-by-default.patch
)
b2sums=('SKIP'
        'f7e868fdd7cc121433de1572583eb728f4d186cd4f52c6d6c8f2ccf4a3cf781144ff71f704f13571ddb97a1ff4ec55cfa3df25d38737ad19da21e84ddc2d3ee4')

prepare() {
  cd gdm

  # Don't start ssh-agent by default (parity with the official gdm package)
  git apply -3 ../0001-Xsession-Don-t-start-ssh-agent-by-default.patch
}

build() {
  local meson_options=(
    -D dbus-sys="/usr/share/dbus-1/system.d"
    -D default-pam-config=arch
    -D default-path="/usr/local/bin:/usr/local/sbin:/usr/bin"
    -D gdm-xsession=true
    -D run-dir=/run/gdm
    -D selinux=enabled
  )

  arch-meson gdm build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  install -Dm644 /dev/stdin usr/lib/sysusers.d/gdm.conf <<END
g gdm 120 -
END

  mkdir -p var/lib/gdm

  # libgdm is identical to upstream and is provided by the stock `libgdm`
  # package (a dependency), so drop the library half meson installed here. These
  # are exactly the paths the official gdm PKGBUILD splits into `libgdm`,
  # including the schemas and the Arch gschema override (libgdm owns those).
  rm -r usr/include
  rm -r usr/lib/girepository-1.0 usr/lib/pkgconfig
  rm    usr/lib/libgdm*
  rm -r usr/share/gir-1.0 usr/share/glib-2.0
}

# vim:set sw=2 sts=-1 et:
