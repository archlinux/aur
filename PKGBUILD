pkgname=soh-bin
pkgver=8.0.6.1
pkgrel=1
scriptver=1.0.0
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('59dabfcc0744b2b727d704d4ec5fb63f68f874d2db3a5600495f7d6f3b75c6d4')
sha256sums_i686=('bf5c20ea43a4ffe78ecab2c6a756a1c4f639092922e920d76be6c471dc6bfe07')
sha256sums_x86_64=('71daed06a4503be1c0fe15582b36b3d93267bf9c547b24f51c62ff17dec33347')
sha256sums_aarch64=('c9c510098758fcfc65a5d369b5d6db419793288edfcb621b4a81a5ac4cdcc247')
source=("https://gitlab.com/linuxbombay/soh/shipwright/-/archive/$scriptver/shipwright-$scriptver.tar.bz2")
source_i686=("soh-$pkgver-linux-i686.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-i686.tar.xz")
source_x86_64=("soh-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("soh-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/games/Shipwright"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "soh" -o -name "*.ini" -o -name "*.json" -o -name "*.otr" \) -exec cp -r {} "$pkgdir/usr/share/games/Shipwright" \;
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

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.sh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
