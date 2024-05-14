# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=saturn
pkgver=1.1.0
pkgrel=2
pkgdesc="A cross-platform, all-in-one machinima studio for Super Mario 64."
arch=('x86_64')
depends=('sdl2' 'glew')
makedepends=('gcc' 'make' 'git' 'python3')
source=('https://github.com/Llennpie/Saturn/archive/legacy.tar.gz' 'makepkg.patch')
sha256sums=(
  'f9d526ceeac9f7805e06115624f0b09c7d14ec1e8bf70727d8d84c661607045d'
  '801329b27ed096584ec1d4ab3b9afba063318de1993c13990685c74e3b2cb6ee'
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
