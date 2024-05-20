# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=saturn
pkgver=1.1.0
pkgrel=3
pkgdesc="A cross-platform, all-in-one machinima studio for Super Mario 64."
arch=('x86_64')
depends=('sdl2' 'glew')
makedepends=('gcc' 'make' 'git' 'python3')
source=('https://github.com/Llennpie/Saturn/archive/legacy.tar.gz' 'makepkg.patch')
sha256sums=(
  '5b2814e8be29504fa44019d1629811d569994a3baa5ceb5f24708975518a04c3'
  '5d72db241ffe95389c0024c680cfe340906a4abd58778a1589b6c9d523c59f81'
)

build() {
    cd "$srcdir/Saturn-legacy"
    if [ ! -f "$srcdir/Saturn-legacy/.patched" ]; then
        patch -p1 <"$srcdir/makepkg.patch"
    fi
    make -j$(nproc)
}

package() {
    V64SATURN=$HOME/.local/share/v64saturn
    DESKTOP_ENTRY="$pkgdir/usr/share/applications/saturn.desktop"
    mkdir -p "$V64SATURN/res"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/Saturn-legacy/build/us_pc/saturn.us.f3dex2e" "$pkgdir/usr/bin/sm64-saturn"
    cp "$srcdir/Saturn-legacy/build/us_pc/libdiscord_game_sdk.so" "$pkgdir/usr/lib"
    cp "$srcdir/Saturn-legacy/res/saturn-linuxicon.png" "$pkgdir/usr/share/icons/sm64-saturn.png"
    cp -r "$srcdir/Saturn-legacy/dynos" $V64SATURN
    cp -r "$srcdir/Saturn-legacy/fonts" $V64SATURN
    chmod +x "$pkgdir/usr/bin/sm64-saturn"
    echo "[Desktop Entry]" >> $DESKTOP_ENTRY
    echo "Name=Saturn" >> $DESKTOP_ENTRY
    echo "Comment=A cross-platform, all-in-one machinima studio for Super Mario 64." >> $DESKTOP_ENTRY
    echo "Exec=sm64-saturn" >> $DESKTOP_ENTRY
    echo "Icon=sm64-saturn" >> $DESKTOP_ENTRY
    echo "Terminal=false" >> $DESKTOP_ENTRY
    echo "Categories=Game" >> $DESKTOP_ENTRY
}
