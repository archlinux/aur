# Maintainer: Huw Rogers <djnz00@gmail.com>

pkgname=libfprint-goodixtls52xd-git
pkgver=1.94.10.r2010.g39e145b
pkgrel=1
pkgdesc="Library for fingerprint readers with Goodix TLS 52xd support"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
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
  appstream
  cairo
  umockdev
)
provides=(
  "libfprint=$pkgver"
  libfprint-goodixtls52xd
  libfprint-2.so
)
conflicts=(
  libfprint
  libfprint-goodix-521d
  libfprint-goodixtls52xd
)
groups=(fprint)
source=("git+https://github.com/djnz00/libfprint.git#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd libfprint
  local version rev hash
  version=$(awk -F"'" '/version:/ { print $2; exit }' meson.build)
  rev=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s' "$version" "$rev" "$hash"
}

build() {
  local meson_options=(
    # Match Arch's libfprint package so this remains a drop-in replacement.
    -D drivers=all
    -D installed-tests=false
  )

  arch-meson libfprint build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
