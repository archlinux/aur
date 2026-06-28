# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="kanji-dojo"
pkgname="$_pkgname-appimage"

pkgver=2.2.1
pkgrel=1
pkgdesc="Practice writing Japanese letters, learn their meanings and related words (AppImage version)"
url="https://github.com/syt0r/Kanji-Dojo"
license=("GPL3")
arch=("x86_64")
provides=("$_pkgname")
conflicts=("$_pkgname"
	   "$_pkgname-git")
replaces=()

_source_main() {
  _raw_appimage="Kanji_Dojo-x86_64"
  _appimage="$_raw_appimage"_"$pkgver.AppImage"
  source=($_appimage::"https://github.com/syt0r/Kanji-Dojo/releases/download/v$pkgver/$_raw_appimage.AppImage")
  sha256sums=('49432c176071c1d92485d918df17dd22591d3d574b95d7bc53584cb1b93bc858')
}

options=("!strip")
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.png; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.png" && break
  done

  # desktop file
  for i in squashfs-root/*.desktop; do
    if [ -f "$i" ]; then
      install -Dm755 "$i" "$_pkgname.desktop"
      sed -i 's/^Icon=.*/Icon=kanji-dojo/' "$_pkgname.desktop"
      break
    fi
  done
}

package() {
  # appimage
  install -Dm755 "$_appimage" "$pkgdir/usr/bin/kanji-dojo"

  # icon
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  # launcher
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  
  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_source_main
