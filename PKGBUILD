# Maintainer: nezu <nezu@nezu.cc>
#
# This is a modified version of the libfprint PKGBUILD file from the official Arch Linux repositories

pkgname=libfprint-tod
_pkgdirname=libfprint
pkgver=1.95.2+tod1
pkgrel=1
pkgdesc="Library for fingerprint readers - TOD version"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  nss
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
# Provide libfprint for compatibility with fprintd and also provide libfprint-tod for tod-style-only drivers
provides=(libfprint libfprint-tod libfprint-2.so libfprint-2-tod.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/3v1n0/libfprint.git?signed#tag=v$pkgver")
b2sums=('7409a4fb2de8dc03c8829f2c6fecd14484ca880bf6860ac6948bc2186f989077ae4316bfd4e077d0f3b9127f98fbdac8915e034b4958fdb363c31e51897359d1')
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F # Marco Trevisan (Treviño) <mail@3v1n0.net>
)
options=('!lto')

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson $_pkgdirname build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
