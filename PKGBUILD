# Maintainer: Dainis Koknese <gatesby@protonmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.22
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
sha256sums=('eca5bcf1e522c80d21c31dec357ba53d282f30831f05560beeae2d1195255a88')

source_x86_64=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums_x86_64=('f9f131df4baed2b662391aed134d311b6a62273a456dfc52670dce8eb84b2728')
source_aarch64=("harmonoid-linux-${pkgver//_/-}-aarch64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-aarch64.tar.gz")
sha256sums_aarch64=("8d73798be2ee76c3833595336f94970a5aa04316336a7adb642a81f17d292514")

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
