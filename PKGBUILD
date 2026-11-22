# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=gameviber-git
_pkgname=gameviber
pkgver=r218.11f8e67
pkgrel=1
pkgdesc="A GameMaker-style 2D game engine and editor in Go, made for people and coding agents alike"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/gameviber"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi'
         'libxxf86vm' 'libglvnd' 'alsa-lib')
makedepends=('git' 'go')
optdepends=('chromium: the app in a window of its own (or google-chrome, brave, vivaldi, edge)'
            'go: web and desktop export of your games'
            'claude-code: Claude Code in the editor'"'"'s terminal'
            'zenity: a folder picker on the start page (or kdialog)')
provides=('gameviber')
conflicts=('gameviber')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  mkdir -p build
  go build -ldflags "-linkmode=external" -o build/ ./cmd/gameviber ./cmd/gameviber-run
  for s in 48 64 128 256 512; do
    ./build/gameviber icon $s build/icon-$s.png
  done
}

check() {
  cd "$_pkgname"
  rm -rf build/check-game  # a rebuild (makepkg -f) keeps build/ from the last run
  ./build/gameviber new build/check-game >/dev/null
  ./build/gameviber check build/check-game
}

package() {
  cd "$_pkgname"
  install -Dm755 build/gameviber build/gameviber-run -t "$pkgdir/usr/bin"
  install -Dm644 packaging/gameviber.desktop "$pkgdir/usr/share/applications/gameviber.desktop"
  for s in 48 64 128 256 512; do
    install -Dm644 build/icon-$s.png "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/gameviber.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  # The source, for gameviber web / export (they build the game's player with go): app.go sets GAMEVIBER_SRC.
  install -d "$pkgdir/usr/share/gameviber/src"
  git archive HEAD | tar -x --no-same-owner -C "$pkgdir/usr/share/gameviber/src"
}
