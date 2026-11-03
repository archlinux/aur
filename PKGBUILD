# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Martin Lukes <martin.meridius@gmail.com>
# Contributor: Samuel Littley <samuel.littley@toastwaffle.com>
# Contributor: William Giokas <1007380@gmail.com>

_longname="Mini Metro"
pkgname="${_longname,,}"
pkgname="${pkgname/ }"
pkgver=56
pkgrel=1
pkgdesc='minimalistic subway layout game'
url="https://dinopoloclub.com/games/mini-metro/"
license=('LicenseRef-Proprietary')
arch=('x86_64')
depends=('libgl' 'libx11' 'libxext' 'glu' 'hicolor-icon-theme')
makedepends=('imagemagick')
# Prebuilt Unity binaries: nothing to strip or debug.
options=('!strip' '!debug')
# Download the Linux tarball from your Humble Bundle library and put it next to
# this PKGBUILD (some browsers save it as .tar; rename it back to .tar.gz).
DLAGENTS+=("hib::/usr/bin/echo ==> ERROR: %u is missing; download it from your Humble library and place it next to the PKGBUILD.")
source=("hib://${_longname/ }-release-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "starter.sh"
        "${pkgname}.png::https://dinopoloclub.com/wp-content/uploads/2019/08/${_longname/ /-}-Icon.png")
sha256sums=('6f5c8526f2a1c2cf86030ad0e298f7f0bb3933b8af7ea5c6a579db6820e74b0c'
            'b6353b9b373bd4ff23b11509c41b72cd28d5a8046546cd512a2dd7a62ef16dd3'
            '5bef1047ade8fded513686f30fa378a22c4f8376325eb76e123c355a05ed059b'
            '2498480f8ddfcb8a990431e01d98704aac9f88c5b733e2dc485e613e84de045b')

package() {
  # Prepare variables.
  destdir="$pkgdir/opt/$pkgname"
  install -d "$destdir" "$pkgdir"/usr/{bin,share/applications}

  # Install the game and data files.
  cp -r --no-preserve=mode,ownership "${_longname}_Data" "$destdir"
  install "$_longname" "$destdir"
  install "UnityPlayer.so" "$destdir"
  chmod -R a+rX "$destdir"

  # Care for the icon.
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
    size=${size}x${size}
    install -d "$pkgdir/usr/share/icons/hicolor/$size/apps"
    magick $pkgname.png -resize $size "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
  done

  # Compose the desktop entry and starter.
  export longname="$_longname" pkgname pkgdesc
  envsubst < "$pkgname.desktop" > "$pkgdir/usr/share/applications/$pkgname.desktop"
  envsubst < starter.sh > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
