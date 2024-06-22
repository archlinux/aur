# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=saturn-studio
pkgver=1.4.0.1
pkgrel=1
pkgdesc="A cross-platform SFM-like video editor for Super Mario 64. Fork of Saturn by sm64rise."
arch=('x86_64')
depends=('sdl2' 'glew')
makedepends=('gcc' 'make' 'git' 'python3')
source=('https://github.com/Dominicentek/saturn-studio/archive/studio.tar.gz' 'makepkg.patch')
sha256sums=(
  'SKIP'
  'SKIP'
)

build() {
    cd "$srcdir/saturn-studio-studio"
    if [ ! -f "$srcdir/saturn-studio-studio/.patched" ]; then
        patch -p1 <"$srcdir/makepkg.patch"
    fi
    make -j$(nproc)
}

package() {
    V64SATURN=$HOME/.local/share/v64saturn
    DESKTOP_ENTRY="$pkgdir/usr/share/applications/saturn-studio.desktop"
    mkdir -p "$V64SATURN/res"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/saturn-studio-studio/build/us_pc/saturn.us.f3dex2e" "$pkgdir/usr/bin/saturn-studio"
    cp "$srcdir/saturn-studio-studio/build/us_pc/libdiscord_game_sdk.so" "$pkgdir/usr/lib"
    cp "$srcdir/saturn-studio-studio/res/saturn-linuxicon.png" "$pkgdir/usr/share/icons/sm64-saturn.png"
    cp -r "$srcdir/saturn-studio-studio/dynos" $V64SATURN
    cp -r "$srcdir/saturn-studio-studio/fonts" $V64SATURN
    chmod +x "$pkgdir/usr/bin/saturn-studio"
    echo "[Desktop Entry]" >> $DESKTOP_ENTRY
    echo "Name=Saturn Studio" >> $DESKTOP_ENTRY
    echo "Comment=A cross-platform SFM-like video editor for Super Mario 64. Fork of Saturn by sm64rise." >> $DESKTOP_ENTRY
    echo "Exec=saturn-studio" >> $DESKTOP_ENTRY
    echo "Icon=sm64-saturn" >> $DESKTOP_ENTRY
    echo "Path=$V64SATURN" >> $DESKTOP_ENTRY
    echo "Terminal=false" >> $DESKTOP_ENTRY
    echo "Categories=Game" >> $DESKTOP_ENTRY
}
