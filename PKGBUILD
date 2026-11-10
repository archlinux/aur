# Based on Arch's libfprint PKGBUILD (Jan Alexander Steffens, Tom Gundersen, Thomas Baechler)
# Adds press-mode capture and SIGFM matching for the ELAN 04f3:0c28 96x96 sensor.

pkgname=libfprint-elan-0c28-patch
_pkgname=libfprint
pkgver=1.94.100
pkgrel=4
pkgdesc="Library for fingerprint readers, patched for the ELAN 04f3:0c28 press sensor"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  libgcc
  glib2
  glibc
  libgudev
  libgusb
  openssl
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
)
checkdepends=(
  cairo
  umockdev
)
provides=("libfprint=$pkgver" libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git?signed#tag=v$pkgver"
        elan-0c28-press-sigfm.patch)
b2sums=('56cbe62a6d4b98d1de90f45bae8de605418802d1b4d8d5dc55a8557a65045b115df51daf8385decdebd8aea79c86103467d5a327cbd461030d450f0e15466d08'
        'aa4646c8f0b347debc85deb2641335205c0fd15bf2a66cd5fff7d6877fc53f8e6f5d35cef09c3c2b88cf6964ff4cc8ec46cf5704ac781519c97d92d4ea9097a8')
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F # Marco Trevisan (Treviño) <mail@3v1n0.net>
)

prepare() {
  cd $_pkgname
  git apply "$srcdir/elan-0c28-press-sigfm.patch"
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # the umockdev replay for egis_etu905 times out under parallel load
  meson test -C build --print-errorlogs --num-processes 1
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
