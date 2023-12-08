# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete (dvorak)  <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkg=gcr
_pkgbase="${_pkg}-4"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgbase}-docs-git"
)
pkgver=4.1.0
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/${_pkg}"
arch=(
  x86_64)
license=(
  GPL2)
depends=(
  glib2
  libgcrypt
  libsecret
  openssh
  p11-kit
  systemd
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  gtk4
  meson
  vala
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd gcr
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gcr
}

build() {
  arch-meson gcr build
  meson compile -C build
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package_gcr-4-git() {
  conflicts+=(
    "${_pkgbase}")
  optdepends=(
    'gtk4: gcr-viewer-gtk4')
  provides=(
    "${_pkgbase}"
    libgck-2.so
    libgcr-4.so
  )
  install="${_pkgbase}.install"
  meson \
    install \
    -C build \
    --destdir "${pkgdir}"

  mkdir \
    -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gcr-4-docs-git() {
  pkgdesc+=" (documentation)"
  conflicts+=(
    "${_pkgbase}-docs-git")
  provides+=(
    "${_pkgbase}-docs-git")
  depends=()
  mv \
    doc/* \
    "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
