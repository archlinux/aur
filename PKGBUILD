# Maintainer: Rasmus Steinke <rasi@xssn.at>
pkgname=melody-git
pkgver=r115.gfbc825e
pkgrel=1
pkgdesc='Music server with MPD support, remote playback, and terminal clients (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-music'
license=(GPL-3.0-only)
depends=(glibc ffmpeg mpv)
makedepends=(git go)
optdepends=('rofi: menu interface for melody-rofi'
            'flac: embed downloaded lyrics into FLAC files')
provides=(melodyd melody-agent melody-tui melody-cli melody-musiclist melody-lrcmatch melody-watcher melody-rofi)
conflicts=(melodyd melody-agent melody-tui melody-cli melody-musiclist melody-lrcmatch melody-watcher melody-rofi)
install=melody.install
source=("melody::git+https://github.com/carnager/melody-music.git")
sha256sums=('SKIP')

pkgver() {
  cd melody
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody
  export CGO_ENABLED=1
  export GOFLAGS='-trimpath -mod=readonly -buildvcs=false'
  ./build
}

check() {
  cd melody
  go test ./...
}

package() {
  cd melody
  local binary
  for binary in melodyd melody-agent melody-tui melody-cli melody-musiclist melody-lrcmatch melody-watcher melody-rofi; do
    install -Dm755 "bin/$binary" "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 melodyd/melodyd.service "$pkgdir/usr/lib/systemd/user/melodyd.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/melodyd.md "$pkgdir/usr/share/doc/$pkgname/melodyd.md"
  install -Dm644 docs/clients.md "$pkgdir/usr/share/doc/$pkgname/clients.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
