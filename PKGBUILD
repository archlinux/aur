# Maintainer: Crstian <me@crstian.me>
#
# Built from a tarball of the repo: `just package-arch` locally (working tree)
# or the release workflow (the tagged commit). The AUR packages are in
# packaging/aur.

pkgname=herakleo
pkgver=0.3.0
pkgrel=1
pkgdesc='Desktop IPTV player for M3U lists and Xtream Codes'
arch=('x86_64')
url='https://github.com/crstian19/herakleo'
license=('GPL-3.0-or-later')
# Wails v3: GTK 4 + webkitgtk-6.0 (scrolls at the monitor's refresh rate).
depends=(
  'webkitgtk-6.0'
  'gtk4'
  'libsoup3'
  'glib2'
  'hicolor-icon-theme'
  'glibc'
)
makedepends=(
  'go'
  'bun'
  'nodejs'
  'pkgconf'
)
optdepends=(
  'mpv: default video player'
  'vlc: alternative video player'
  'celluloid: alternative video player'
  'haruna: alternative video player'
)
# The package was called herakleo-wails while a second (Tauri) build existed.
provides=('herakleo-wails')
conflicts=('herakleo-wails')
replaces=('herakleo-wails')
# makepkg's LTO flags break cgo
options=('!lto' '!debug')
source=("herakleo-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('907b6ff63cee481620f3907427a723be690d312e72fae981dbd22c859e1face3')

_goenv() {
  export GOPATH="$srcdir/gopath"
  # -buildvcs=false: the source may sit inside another user's git checkout (CI).
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -buildvcs=false'
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
}

prepare() {
  cd "herakleo-$pkgver"
  _goenv
  (cd wails && go mod download)
  (cd frontend && bun install --frozen-lockfile)
}

build() {
  cd "herakleo-$pkgver"
  _goenv
  # Wails v3 needs no CLI: build the UI, then a plain cgo build that embeds it.
  (cd frontend && bun run build:wails)
  (cd wails && go build -tags production -ldflags '-s -w' -o build/bin/herakleo .)
}

package() {
  cd "herakleo-$pkgver"
  install -Dm755 wails/build/bin/herakleo "$pkgdir/usr/bin/herakleo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/linux/me.crstian.Herakleo.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/me.crstian.Herakleo.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  local size
  for size in 128 256 512; do
    install -Dm644 "packaging/linux/icons/$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/me.crstian.Herakleo.png"
  done
}
