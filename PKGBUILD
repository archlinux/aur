# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgbase=wireplumber
pkgbase=wireplumber-git
pkgname=(
  wireplumber-git
  libwireplumber-git
)
pkgver=0.4.81.r22.g6f3eb329
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
url="https://pipewire.pages.freedesktop.org/wireplumber/"
arch=(x86_64)
license=(MIT)
makedepends=(
  doxygen
  git
  glib2
  gobject-introspection
  graphviz
  lua
  meson
  pipewire
  python-lxml
  systemd
)
checkdepends=(pipewire-audio)
source=("git+https://gitlab.freedesktop.org/pipewire/$_pkgbase.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
}

build() {
  local meson_options=(
    -D doc=disabled
    -D elogind=disabled
    -D system-lua=true
  )

  arch-meson $_pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_ver=0.5

package_wireplumber-git() {
  depends=(
    "libwireplumber-git=$pkgver-$pkgrel"
    libsystemd.so
    lua
    pipewire
  )
  provides=(pipewire-session-manager "wireplumber=$pkgver")
  conflicts=(pipewire-media-session wireplumber)
  install=wireplumber.install

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    _pick libw usr/lib/libwireplumber-$_ver.so*
    _pick libw usr/lib/girepository-1.0
    _pick libw usr/lib/pkgconfig
    _pick libw usr/include
    _pick libw usr/share/gir-1.0
  )

  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 $_pkgbase/{NEWS,README}*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/LICENSE
}

package_libwireplumber-git() {
  pkgdesc+=" - client library"
  depends=(
    libg{lib,module,object,io}-2.0.so
    libpipewire-0.3.so
  )
  provides=(libwireplumber-$_ver.so "libwireplumber=$pkgver")
  conflicts=(libwireplumber)

  mv libw/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/LICENSE
}
