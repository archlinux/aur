# Maintainer: İsmail Yılmaz <iylmz.iylmz@gmail.com>
pkgname=bobcat-terminal-git
pkgver=r268.96c11be
pkgrel=1
upprel=2024.1.1
uppver=17490
pkgdesc="A powerful yet user-friendy cross-platform terminal emulator"
arch=('x86_64')
conflicts=('bobcat-terminal-git' 'bobcat-terminal')
url="https://github.com/ismail-yilmaz/Bobcat"
license=('GPL3')
depends=(
    'gtk3' 'libnotify' 'openssl' 'freetype2' 'libx11' 'libxinerama'
    'libxrender' 'libxft' 'libxdmcp' 'fontconfig' 'libxcb' 'libxext'
    'gdk-pixbuf2' 'zlib' 'harfbuzz' 'pango' 'atk' 'cairo' 'glib2'
    'libpng' 'gcc-libs' 'expat'
)

makedepends=('git' 'pkg-config')
source=(
    "upp-posix-$uppver.tar.xz::https://github.com/ultimatepp/ultimatepp/releases/download/$upprel/upp-posix-$uppver.tar.xz"
    "$pkgname::git+$url.git"
)
sha256sums=('9c88c384d42d88c5ac09095851fa48dd3ac6dcde9000e4095cdc86d7bc2e2073' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    tar xf upp-posix-$uppver.tar.xz
}

build() {
    cd "$srcdir"
    
    cd ./upp
    ./configure
    make -f ./umkMakefile -j$(nproc) 
 
    cd ..
    mkdir build
    upp/umk upp/uppsrc,$pkgname Bobcat GCC -brh +GUI,SHARED ./build/bobcat
}

package() {
    # Install desktop file and icon
    install -Dm644 "$srcdir/$pkgname/Bobcat/data/bobcat.desktop" "$pkgdir/usr/share/applications/bobcat.desktop"
    install -Dm644 "$srcdir/$pkgname/Bobcat/data/bobcat128x128.png" "$pkgdir/usr/share/pixmaps/bobcat.png"
    
    # Install license
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install executable
    install -Dm755 "$srcdir/build/bobcat" "$pkgdir/usr/bin/bobcat"
}
