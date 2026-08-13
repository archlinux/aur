# Maintainer: Ahmad bin Marakkar <ahmadshabeerk786@gmail.com>

pkgname=quran-reader-bin
_pkgname=quran-reader
pkgver=0.1.7
pkgrel=1
pkgdesc='A beautiful, fast, offline-first Quran reader'
arch=('x86_64')
url='https://github.com/ask-786/quran-reader'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
optdepends=('xdg-utils: open external links in a browser')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Prebuilt and already stripped upstream; nothing for makepkg to do to it.
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Quran.Reader_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/ask-786/$_pkgname/v$pkgver/LICENSE"
        "$_pkgname.desktop")
sha256sums=('5a8fc86acc83b9a9f1fa106fc797a048442d8c29e3c9709562a44d5a3d918f66'
            '7ac4a8c2a9f051e95d1b4aaf77fab3c616837769b82871d37f94a91345df1e34'
            '3117e16cd8e62a5eb824deb896fc2af63a4703b1af81974435504b40b0908ad5')

package() {
  # The .deb carries only the binary, a .desktop and three icons — no libraries.
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # Tauri emits its own .desktop with a space in the filename and an empty
  # Categories= line — replace it rather than ship it.
  rm -f "$pkgdir/usr/share/applications/Quran Reader.desktop"

  # Tauri writes the largest icon to "256x256@2", which is not a hicolor size,
  # so nothing ever reads it. The image itself is 256px; file it as such.
  local _icons="$pkgdir/usr/share/icons/hicolor"
  install -dm755 "$_icons/256x256/apps"
  mv "$_icons/256x256@2/apps/quran-reader.png" "$_icons/256x256/apps/quran-reader.png"
  rm -rf "$_icons/256x256@2"

  install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 755 "$pkgdir/usr/bin/quran-reader"
}
