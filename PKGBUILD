# Maintainer: Stanislav T
# Contributor: Sergey Kokorin 

pkgname=libfprint-goodix-60c2
pkgver=1.94.7
pkgrel=2
pkgdesc="Library for fingerprint readers"
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
provides=("libfprint" libfprint-2.so)
conflicts=("libfprint")
source=(
  "git+https://gitlab.freedesktop.org/libfprint/libfprint.git?signed#tag=v$pkgver"
  "enable-goodix-60c2.patch"
)
b2sums=('9859f976227452dc3ea9f8fbde9022809214a4eed0c994d8cb5330d0d7d7fbf19baf066518a72c8345ae01b0f34b7e32b135a4494a48db17bc6186b571f41fe6'
        '7cf36a276e05dc8e5c1615762ca531beb47e15f870b9231132621c7ad163445fbf1c9efb4a362b48029603aa744a37b8306330fc6e7271e606a9e14a38d4f861')
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F # Marco Trevisan (Treviño) <mail@3v1n0.net>
)

prepare() {
  cd $pkgname
  # TODO apply the patch
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
