# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgbase=wireplumber
pkgbase=wireplumber-set-route-git
pkgname=(
  wireplumber-set-route-git
  libwireplumber-set-route-git
)
pkgver=0.4.17.r3.gf01177d
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire, with wpctl set-route"
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
source=("git+https://gitlab.freedesktop.org/Ferdi265/$_pkgbase.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

_ver=${pkgver:0:3}

package_wireplumber-set-route-git() {
  depends=(
    "libwireplumber-set-route-git=$pkgver-$pkgrel"
    libsystemd.so
    lua
    pipewire
  )
  provides=(pipewire-session-manager wireplumber wireplumber-git)
  conflicts=(pipewire-media-session wireplumber wireplumber-git)
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

package_libwireplumber-set-route-git() {
  pkgdesc+=" - client library"
  depends=(
    libg{lib,module,object,io}-2.0.so
    libpipewire-0.3.so
  )
  provides=(libwireplumber-$_ver.so libwireplumber libwireplumber-git)
  conflicts=(libwireplumber libwireplumber-git)

  mv libw/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/LICENSE
}

# vim:set sw=2 sts=-1 et:
