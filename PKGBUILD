# Maintainer: Gaurav Kumar Yadav <gaurav712@protonmail.com>
# Based on the official libfprint PKGBUILD by Jan Alexander Steffens (heftig)

pkgname=libfprint-goodix-55a2
_pkgname=libfprint
pkgver=1.94.100
pkgrel=4
_commit=b14dfc587e0f8962e88fdc7efa3d923ff482cf46
pkgdesc="Library for fingerprint readers, with a driver for the Goodix 27c6:55a2 (GF3206/GF3208) sensor"
url="https://github.com/gaurav712/libfprint"
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
  meson
  python-cairo
  python-gobject
  systemd
)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/gaurav712/libfprint.git#commit=$_commit")
b2sums=('SKIP')

build() {
  # g-ir-scanner runs under whichever python3 is first on PATH. A user venv
  # without setuptools breaks it, so prefer the system interpreter.
  export PATH="/usr/bin:$PATH"

  local meson_options=(
    -D drivers=all
    -D installed-tests=false
    -D doc=false
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
