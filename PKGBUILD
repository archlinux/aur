# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=libwireplumber-4.0-compat
_pkgname=wireplumber
pkgver=0.4.16
pkgrel=1
pkgdesc="Compatibility version 4.x of libwireplumber"
url="https://pipewire.pages.freedesktop.org/wireplumber/"
arch=(x86_64)
license=(MIT)
makedepends=(
  doxygen
  gcc-libs
  git
  glib2
  glib2-devel
  glibc
  gobject-introspection
  graphviz 
  meson
  python-breathe
  python-lxml
  python-sphinx
  python-sphinx_rtd_theme
  systemd
)
depends=(systemd-libs lua pipewire)
checkdepends=(pipewire-audio)
source=(
  "git+https://gitlab.freedesktop.org/pipewire/$_pkgname.git#tag=$pkgver"
)
b2sums=('ec758c81c75764613b08baed8c688dc1d92fac4c6a8f889fb91c6132ebb53e865ed7f62090e760424e2f5aee39f2e629848f899d3fcdece1cba775b1e2948a8f')

prepare() {
  cd $_pkgname
}

build() {
  local meson_options=(
    -D elogind=disabled
    -D system-lua=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_ver=${pkgver:0:3}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package() {
  pkgdesc+=" - client library"
  depends=(
    gcc-libs
    glibc
    libg{lib,module,object,io}-2.0.so
    libpipewire-0.3.so
  )
  provides=(libwireplumber-$_ver.so)

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    _pick libw usr/lib/libwireplumber-$_ver.so*
    _pick libw usr/lib/wireplumber-0.4
    _pick libw usr/lib/girepository-1.0
    _pick libw usr/lib/pkgconfig
    _pick libw usr/include
    _pick libw usr/share/gir-1.0
  )

  rm -rf $pkgdir/*

  mv libw/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgname/LICENSE
}

# vim:set sw=2 sts=-1 et:
