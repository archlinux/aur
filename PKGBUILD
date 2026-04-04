# Maintainer: İsmail Yılmaz <iylmz.iylmz@gmail.com>
pkgname=bobcat-terminal-git
pkgver=r319.e4e5f19
pkgrel=4
upprel=2026.1
uppver=18468
pkgdesc="A powerful yet user-friendy cross-platform terminal emulator"
arch=('x86_64')
conflicts=('bobcat-terminal-git' 'bobcat-terminal' 'bobcat-terminal-headless-git' 'bobcat-terminal-headless')
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
    "upp-posix-$uppver.tar.xz::https://github.com/ultimatepp/ultimatepp/releases/download/v$upprel/upp-posix-$uppver.tar.xz"
    "$pkgname::git+$url.git"
)
sha256sums=('701dbb10edf03c77ceff66c89a2ffa23fce2b788cc480b0cae39d0689519b633' 'SKIP')

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
    mkdir -p build
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
