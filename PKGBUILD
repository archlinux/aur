# Maintainer: kotontrion <kotontrion@tutanota.de>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: dr460nf1r3 <aur@dr460nf1r3.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

_pkgname="gjs"
pkgname="${_pkgname}-git"
pkgver=1.88.0+106+g8838384c
pkgrel=1
epoch=2
pkgdesc="Javascript Bindings for GNOME"
_gnome_url="https://gitlab.gnome.org/GNOME"
url="${_gnome_url}/${_pkgname}"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  cairo
  dconf
  glib2
  glibc
  gobject-introspection-runtime
  js140
  libffi
  libgcc
  libstdc++
  libsysprof-capture
  libx11
  readline
)
makedepends=(
  dbus
  git
  glib2-devel
  gobject-introspection
  meson
)
checkdepends=(
  gtk3
  gtk4
  xorg-server-xvfb
)
provides=(
  "lib${_pkgname}.so"
  "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "git+${url}"
  "git+${_gnome_url}/gobject-introspection-tests.git"
  )
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_pkgname}" || ls
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gjs

  git submodule init
  git submodule set-url subprojects/gobject-introspection-tests "${srcdir}/gobject-introspection-tests"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D installed_tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  CXXFLAGS="${CXXFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  depends+=(libreadline.so)
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
