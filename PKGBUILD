# Maintainer: Vyrnexis <315210836+Vyrnexis@users.noreply.github.com>
pkgname=inkpane-git
pkgver=r42.97f641b
pkgrel=1
pkgdesc="Draw on your screen through a transparent Wayland overlay (layer-shell)"
arch=('x86_64' 'aarch64')
url="https://github.com/Vyrnexis/Inkpane"
license=('GPL-3.0-or-later')
depends=('sdl3' 'wayland' 'glib2' 'hicolor-icon-theme')
makedepends=('git' 'nim')
optdepends=('sdl3_ttf: text, step markers, toolbar tooltips and the F1 help'
            'fontconfig: finds the default font for text'
            'wl-clipboard: copies screenshots to the clipboard more reliably')
provides=('inkpane')
conflicts=('inkpane')
# The official SDL3 wrapper is not packaged for Arch; pinned to the commit Inkpane is built with.
source=("Inkpane::git+$url.git"
        "sdl3-nim::git+https://github.com/nim-lang/sdl3.git#commit=533d22196dab2ea637ea0131171ed3f8db61fe90")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Inkpane
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd Inkpane
  local flags=(-d:release --opt:size --passC:-flto --passL:-flto
    --noNimblePath --path:"$srcdir/sdl3-nim/src")
  nim c "${flags[@]}" --nimcache:"$srcdir/nimcache" --out:inkpane src/inkpane.nim
  nim c "${flags[@]}" --nimcache:"$srcdir/nimcache-mcp" --out:inkpane-mcp src/inkpane_mcp.nim
}

package() {
  cd Inkpane
  install -Dm755 inkpane "$pkgdir/usr/bin/inkpane"
  install -Dm755 inkpane-mcp "$pkgdir/usr/bin/inkpane-mcp"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" \
    data/icons/hicolor/scalable/apps/*.svg
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|@APP_BIN@|/usr/bin/inkpane|g' data/org.vyrnexis.Inkpane.desktop \
    > "$pkgdir/usr/share/applications/org.vyrnexis.Inkpane.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
