# Maintainer: Dainis Koknese <gatesby@protonmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.17
pkgrel=1
pkgdesc="Plays & manages your music library. Looks beautiful & juicy. Playlists, visuals, synced lyrics, pitch shift, volume boost & more."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("LicenseRef-PolyForm-Strict-1.0.0")
depends=('glibc' 'gcc-libs' 'mpv' 'gdk-pixbuf2' 'libepoxy' 'gtk3' 'pango' 'fontconfig' 'hicolor-icon-theme' 'zlib-ng-compat' 'glib2' 'harfbuzz' 'cairo' 'at-spi2-core')
provides=(harmonoid)
makedepends=('patchelf')
conflicts=(harmonoid)
optdepends=('playerctl: mpris support')
options=(!strip)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
"harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('44cc138d49144b54b8f9a1fc2aa34a7fcdf1be2ee47ceecdf9351a794c55c3d3'
  '8c49d9c839ddb7b364f4ad8328a2b6d01dc039fd086e9ffbc16a6c2045c03ec1')

package() {
   cp -dr "$srcdir"/usr "$pkgdir"/usr
   install -Dm644 "$srcdir/usr/share/applications/${pkgname::-4}.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
   for size in {128,256};
   do
       install -Dm644 "$srcdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname::-4}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname::-4}.png"
   done
   install -Dm644 "$srcdir/usr/share/metainfo/${pkgname::-4}.appdata.xml" "$pkgdir/usr/share/metainfo/${pkgname::-4}.appdata.xml"
   install -Dm755 "$srcdir/usr/share/${pkgname::-4}/${pkgname::-4}" "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
   pushd "$srcdir/usr/share/${pkgname::-4}/lib"
   for file in *;
   do
       install -Dm644 $file "$pkgdir/usr/lib/${pkgname::-4}/lib/$file"
       [[ $file != libflutter_linux_gtk.so ]] && patchelf --remove-rpath "$pkgdir/usr/lib/${pkgname::-4}/lib/$file"
   done
   popd
   cp -r "$srcdir/usr/share/${pkgname::-4}/data" "$pkgdir/usr/lib/${pkgname::-4}/"
   install -dm755 "$pkgdir/usr/bin" && \
   ln -sf /usr/lib/${pkgname::-4}/${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
   install -Dm644 "$srcdir/${pkgname::-4}-${pkgver}/LICENSE" "$pkgdir/usr/share/licneses/${pkgname}/LicenseRef-PolyForm-Strict-1.0.0"
}
