# Maintainer: Rasmus Steinke <rasi@xssn.at>
pkgbase=melody-git
pkgname=(melody-git melodyd-git melody-agent-git melody-tui-git melody-cli-git
         melody-musiclist-git melody-lrcmatch-git melody-watcher-git melody-rofi-git)
pkgver=r116.gacab9f7
pkgrel=1
pkgdesc='Music server and clients with MPD support (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-music'
license=(GPL-3.0-only)
makedepends=(git go)
checkdepends=(ffmpeg mpv)
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

_install_binary() {
  install -Dm755 "$srcdir/melody/bin/$1" "$pkgdir/usr/bin/$1"
  install -Dm644 "$srcdir/melody/docs/clients.md" "$pkgdir/usr/share/doc/$pkgname/clients.md"
  install -Dm644 "$srcdir/melody/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_melody-git() {
  pkgdesc='All Melody components (metapackage)'
  depends=(melodyd-git melody-agent-git melody-tui-git melody-cli-git
           melody-musiclist-git melody-lrcmatch-git melody-watcher-git melody-rofi-git)
}

package_melodyd-git() {
  pkgdesc='Melody music server with MPD support'
  depends=(glibc ffmpeg mpv)
  optdepends=('flac: embed downloaded lyrics into FLAC files')
  provides=(melodyd)
  conflicts=(melodyd)
  install=melody.install
  _install_binary melodyd
  install -Dm644 "$srcdir/melody/melodyd/melodyd.service" "$pkgdir/usr/lib/systemd/user/melodyd.service"
  install -Dm644 "$srcdir/melody/docs/melodyd.md" "$pkgdir/usr/share/doc/$pkgname/melodyd.md"
}

package_melody-agent-git() {
  pkgdesc='Remote playback agent for Melody'
  depends=(glibc mpv)
  provides=(melody-agent)
  conflicts=(melody-agent)
  _install_binary melody-agent
}

package_melody-tui-git() {
  pkgdesc='Terminal UI for Melody'
  depends=(glibc)
  provides=(melody-tui)
  conflicts=(melody-tui)
  _install_binary melody-tui
}

package_melody-cli-git() {
  pkgdesc='Command-line client for Melody'
  depends=(glibc)
  provides=(melody-cli)
  conflicts=(melody-cli)
  _install_binary melody-cli
}

package_melody-musiclist-git() {
  pkgdesc='Static music list exporter for Melody'
  depends=(glibc openssh)
  provides=(melody-musiclist)
  conflicts=(melody-musiclist)
  _install_binary melody-musiclist
}

package_melody-lrcmatch-git() {
  pkgdesc='Offline lyrics matcher for Melody'
  depends=(glibc)
  provides=(melody-lrcmatch)
  conflicts=(melody-lrcmatch)
  _install_binary melody-lrcmatch
}

package_melody-watcher-git() {
  pkgdesc='Filesystem watcher for a remote Melody library'
  depends=(glibc)
  provides=(melody-watcher)
  conflicts=(melody-watcher)
  _install_binary melody-watcher
}

package_melody-rofi-git() {
  pkgdesc='Menu client for Melody'
  depends=(glibc)
  optdepends=('rofi: default menu launcher (custom launchers can be configured)')
  provides=(melody-rofi)
  conflicts=(melody-rofi)
  _install_binary melody-rofi
}
