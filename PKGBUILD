# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=media-session
pkgbase=pipewire-media-session-git
pkgname=(pipewire-media-session-git pipewire-media-session-docs-git)
pkgver=0.4.0.r1.g4bf1b295
pkgrel=1
pkgdesc="Low-latency audio/video router and processor - Session manager"
url="https://gitlab.freedesktop.org/pipewire/${_pkgbase}"
license=(MIT)
arch=(x86_64)
makedepends=(git meson
             alsa-lib dbus doxygen graphviz 'pipewire>=0.3.39' systemd)
source=("git+https://gitlab.freedesktop.org/pipewire/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # make AUR helper happy
  rm -rf builddir || true
  arch-meson $_pkgbase builddir \
    -D docs=enabled \
    -D with-module-sets=[]

  meson compile -C builddir
}

check() {
  meson test -C builddir --print-errorlogs
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

package_pipewire-media-session-git() {
  depends=('pipewire>=0.3.39' libpipewire-0.3.so
           libasound.so libdbus-1.so libsystemd.so)
  provides=(pipewire-media-session pipewire-session-manager)
  conflicts=(pipewire-media-session)
  install=pipewire-media-session.install

  meson install -C builddir --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING

  cd "$pkgdir"

  _pick docs usr/share/doc
}

package_pipewire-media-session-docs-git() {
  pkgdesc+=" - documentation"
  provides=(pipewire-media-session-docs)
  conflicts=(pipewire-media-session-docs)

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
