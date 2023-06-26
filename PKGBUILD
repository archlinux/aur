# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: dr460nf1r3 <aur@dr460nf1r3.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

_pkgname="gjs"
pkgname="${_pkgname}-git"
pkgver=1.76.0+106+g79d66486
pkgrel=2
epoch=2
pkgdesc="Javascript Bindings for GNOME"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=(
  x86_64
  i686
  pentium4)
license=(GPL)
depends=(
  cairo
  dconf
  gobject-introspection-runtime
  js102
  libsysprof-capture
  readline
)
makedepends=(
  dbus
  git
  gobject-introspection
  meson
)
checkdepends=(
  gtk3
  gtk4
  xorg-server-xvfb
)
provides=(
  "lib_${_pkgname}.so"
  "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || ls
  git describe --tags | sed 's/-/+/g'
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
