# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=polkit
pkgver=128
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://github.com/polkit-org/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  lib32-glib2
  lib32-glibc
  lib32-systemd
  "polkit>=${pkgver}"
)
makedepends=(
  dbus
  git
  glib2-devel
  lib32-pam
  meson
  systemd
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
source=(
  "git+$url#tag=$pkgver"
  0001-meson-Support-explicit-GID.patch
  0002-meson-Detect-Arch-Linux-and-set-the-UID-and-GID.patch
)
b2sums=('c14ca008a1f2ba5c04fff3d0c0fd6cc4c4114fdd46709fca756f00ceb894ed0f9b8ff55df3656035172d9e6753fe862371e9ceb5368fdcba198b0359f574ec33'
        '5549570ecce8db08263167a52211befda69eca2dd65020d132c3001b621e7b6db8a092eefb29ad0e50ab980b0158ed15a79ab7f23e1754e890b51c6ef827eb72'
        '6d4d435c8af82270fb6720ca00bab14492fbf6f0d73ba0eba0ac909cc192452a78de56ceb2fe224ac68fcc0f7c9decc01771aaa3f1956ccfae9747620986948c')

pkgname="lib32-${pkgname}"

prepare() {
  cd polkit
  git apply -3 ../0001-meson-Support-explicit-GID.patch
  git apply -3 ../0002-meson-Detect-Arch-Linux-and-set-the-UID-and-GID.patch
}

build() {
  local _meson_options=(
    --cross-file lib32
    -D gettext=true
    -D introspection=false
    -D libs-only=true
    -D tests=true
  )

  arch-meson polkit build "${_meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{include,lib,share}
}

# vim:set sw=2 sts=-1 et:
