pkgname=2s2h-bin
pkgver=1.1.2.1
pkgrel=1
scriptver=1.0.4
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('tinyxml2' 'sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('097756d12a430c7dfb1a00037bb82de4f7b346fdfa6138c298223cb3b134e4e2')
sha256sums_x86_64=('227f613b7c9157d0456f410e1dbc73faf0e91a44d49b653f7f42923173217337')
sha256sums_aarch64=('fcab0705498951db8e3d525030773492b1cb017cb3f0d928dea697636c41acc1')
sha256sums_i686=('18f56815a213ecf8f486ca77c760ab46c4a6e73ec9a77cc0648d104e52263c67')
source=("https://gitlab.com/linuxbombay/2s2h/2s2h/-/archive/$scriptver/2s2h-$scriptver.tar.bz2")                 
source_x86_64=("2s2h-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("2s2h-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")
source_i686=("2s2h-$pkgver-linux-i686.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name "*.o2r" \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    #Lib fix
    libdir="/usr/lib"

    all_exist=true
    for src_file in "$srcdir/usr/lib"/*.so.*; do
    base_file=$(basename "$src_file")
    if [ ! -f "$libdir/$base_file" ]; then
    all_exist=false
    cp "$src_file" "$pkgdir"
  fi
done
if ! $all_exist; then
  :
fi

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.sh" "$pkgdir/usr/bin/2s2h"
    install -Dm644 "$srcdir/2s2h-$scriptver/2s2h.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.desktop" "$pkgdir/usr/share/applications"
}
