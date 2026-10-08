# Maintainer: Aneesh Sambu <sambu.aneesh@research.iiit.ac.in>
pkgname=whatsapp-tui-git
_pkgname=whatsapp-tui
pkgver=r57.dbcf006
pkgrel=1
pkgdesc="WhatsApp in the terminal, vim-style: fast, runs in the background, with a VS Code palette, lists, notes and local AI"
arch=('x86_64' 'aarch64')
url="https://sambuaneesh.github.io/whatsapp-tui/"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'kitty: sharp pictures, animations and profile pictures'
  'mpv: voice notes and videos'
  'ffmpeg: GIFs and making stickers'
  'yazi: picking files to attach'
  'wl-clipboard: copy and paste on Wayland'
  'xclip: copy and paste on X11'
  'libnotify: desktop notifications'
  'ollama: search by meaning and the local AI (embeddinggemma, qwen3:4b)'
)
provides=('whatsapp-tui')
conflicts=('whatsapp-tui')
source=("$_pkgname::git+https://github.com/sambuaneesh/whatsapp-tui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # sqlite_fts5: full-text search (the app falls back to slower search without it)
  go build -tags sqlite_fts5 -o "$_pkgname" .
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/whatsapp-tui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/whatsapp-tui.svg"
  install -Dm644 README.md USAGE.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 docs/API.md "$pkgdir/usr/share/doc/$_pkgname/API.md"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/whatsapp-tui.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=WhatsApp TUI
Comment=WhatsApp in the terminal, vim-style
Exec=whatsapp-tui
Icon=whatsapp-tui
Terminal=true
Categories=Network;InstantMessaging;Chat;
Keywords=whatsapp;chat;messaging;terminal;tui;
DESKTOP
}
