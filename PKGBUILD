# Maintainer: zan <zan@420blaze.it>

pkgname=ajour-git
_name=${pkgname%-git}
pkgver=0.5.4
pkgrel=1
pkgdesc='World of Warcraft addon manager written in Rust'
url='https://www.getajour.com'
license=(MIT)
arch=(x86_64)
depends=(fontconfig freetype2 hicolor-icon-theme libxcb openssl)
makedepends=(cargo rust icoutils git)
conflicts=(ajour)
provides=(ajour)
source=("git+https://github.com/casperstorm/$_name.git"
        "$_name.desktop")
sha256sums=('SKIP'
            'd356c0f7ab3087a087e2ff261bf6348e62e87190805fa166fcbe9e3f8b64fb0d')

pkgver() {
    cd "$_name"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_name"
  cargo build --release
  icotool "resources/windows/ajour.ico" -x
}

package() {
  install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  cd "$_name"
  install -Dm755 "target/release/$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for i in "1 16" "2 24" "3 32" "4 48" "5 64" "6 96" "7 128" "8 192" "9 256"
  do
    set -- $i
    install -Dm644 "${_name}_$1_$2x$2x32.png" "$pkgdir/usr/share/icons/hicolor/$2x$2/apps/$_name.png"
  done
}
