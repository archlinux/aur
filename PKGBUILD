# Maintainer: xero <xero@xeron.cc>
pkgname=xerotty-git
_pkgname=xerotty
pkgver=r521.62baf4c
pkgrel=1
pkgdesc="Customizable terminal emulator in Go (SDL3 + Dear ImGui): multi-window, headless daemon mode, SSH-backed remote sessions, MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/LXXero/xerotty"
license=('GPL-3.0-or-later')
depends=('sdl3' 'fontconfig' 'freetype2' 'libglvnd' 'gcc-libs' 'glibc')
makedepends=('go' 'git')
provides=('xerotty')
conflicts=('xerotty')
# cimgui-go's C wrapper redeclares the Dear ImGui structs, which LTO
# reports as One Definition Rule violations (-Wodr); build without LTO.
options=('!lto')
source=("git+https://github.com/LXXero/xerotty.git"
        'xerotty.desktop')
sha256sums=('SKIP'
            '25bfb5491cbe34f7a1ab466be75caa80238b6e91f17eeba1f9de76c6c8c948df')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  # build.sh runs `go generate` (tinylib/msgp codegen) before linking and
  # installs the msgp binary into $GOPATH/bin on first use, so keep GOPATH
  # inside srcdir and put its bin on PATH. -modcacherw lets makepkg delete
  # the module cache afterwards.
  export GOPATH="$srcdir/go"
  export PATH="$GOPATH/bin:$PATH"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$_pkgname"
  install -Dm755 xerotty "$pkgdir/usr/bin/xerotty"
  # The binary finds these through $XDG_DATA_DIRS/xerotty/themes
  # (internal/themes.SearchDirs); ~/.config/xerotty/themes still wins.
  install -d "$pkgdir/usr/share/xerotty"
  cp -r themes "$pkgdir/usr/share/xerotty/themes"
  install -Dm644 icon/xerotty.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/xerotty.svg"
  install -Dm644 icon/xerotty-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/xerotty.png"
  install -Dm644 "$srcdir/xerotty.desktop" "$pkgdir/usr/share/applications/xerotty.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
