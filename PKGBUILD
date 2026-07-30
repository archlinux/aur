# Maintainer: Dainis Koknese <gatesby@protonmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.32
pkgrel=2
pkgdesc="Plays & manages your music library. Looks beautiful & juicy. Playlists, visuals, synced lyrics, pitch shift, volume boost & more."
arch=("x86_64" "aarch64")
url="https://github.com/harmonoid/harmonoid"
license=("LicenseRef-PolyForm-Strict-1.0.0")
depends=('glibc' 'gcc-libs' 'mpv' 'gdk-pixbuf2' 'libepoxy' 'gtk3' 'pango' 'fontconfig' 'hicolor-icon-theme' 'zlib' 'glib2' 'harfbuzz' 'cairo' 'at-spi2-core')
provides=(harmonoid)
makedepends=('patchelf')
conflicts=(harmonoid)
optdepends=('playerctl: mpris support')
options=(!strip)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6164c4121f372227bb0020967a0fff5a05e7387f1e4ec998287c3edb4ed54c97')

source_x86_64=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums_x86_64=('2029e08580b6e422dfe64cc1ead502fe870a23e2791c0ef3c8af5d1242ce5961')
source_aarch64=("harmonoid-linux-${pkgver//_/-}-aarch64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-aarch64.tar.gz")
sha256sums_aarch64=("8fd3ef7aaee250b054545ee87211d64bd5729e5265935e26dca2d1c8070d2a20")

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
   install -Dm644 "$srcdir/${pkgname::-4}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LicenseRef-PolyForm-Strict-1.0.0"
}
