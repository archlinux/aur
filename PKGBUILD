# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=libwireplumber-4.0-compat
_pkgname=wireplumber
pkgver=0.4.17
pkgrel=2
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
  "disable-endpoint-test.patch"
)
b2sums=('bca7db62e0efcd27d9a9ee6269f3f26b5e08c39c531f826aff5e1661c64a93a998fe93deb960489563a9dcfe812d09b446cf54096b27dd1155caba99c49cab28'
        'f5f80dd0cde8eb833a0d4f87ac10e5d174ab5311f53e05338cbf5e637036f31539a4a604f69f5fbda1e726ce2da5b581f9dfe9f3640b5332710dc7aaba3229bc')

prepare() {
  cd $_pkgname

  pwd

  git cherry-pick -n f4f495ee212c46611303dec9cd18996830d7f721
  git apply ../disable-endpoint-test.patch
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
