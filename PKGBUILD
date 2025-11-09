# Maintainer: İsmail Yılmaz <iylmz.iylmz@gmail.com>
pkgname=bobcat-terminal-headless-git
pkgver=r348.9544257
pkgrel=2
upprel=2025.1.1
uppver=17810
pkgdesc="A powerful yet user-friendy cross-platform terminal emulator (headless version)"
arch=('x86_64')
conflicts=('bobcat-terminal-git' 'bobcat-terminal' 'bobcat-terminal-headless' 'bobcat-terminal-headless-git')
url="https://github.com/ismail-yilmaz/Bobcat"
license=('GPL3')
depends=(
    'sdl2'           # libSDL2-2.0.so.0
    'sdl2-compat'
    'freetype2'      # libfreetype.so.6
    'fontconfig'     # libfontconfig.so.1
    'libpng'         # libpng16.so.16
    'mesa'           # libGL.so.1
    'zlib'           # libz.so.1
    'gcc-libs'       # libstdc++.so.6, libgcc_s.so.1
    'glibc'          # libm.so.6, libc.so.6
    'expat'
    'libglvnd'
)

makedepends=('git' 'pkg-config')
source=(
    "upp-posix-$uppver.tar.xz::https://github.com/ultimatepp/ultimatepp/releases/download/v$upprel/upp-posix-$uppver.tar.xz"
    "$pkgname::git+$url.git"
)
sha256sums=('3c7415f2ba4398b371be063ba9071b1983d961a465d4d665a8367e62909d661e' 'SKIP')

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
    upp/umk upp/uppsrc,$pkgname Bobcat GCC -brh +SDLGUI,VIRTUALGUI,SHARED ./build/bobcat
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
