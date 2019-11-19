# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r976.09203dc
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
depends=('xash3d-hlsdk')
depends_i686=('freetype2' 'fontconfig' 'libpulse' 'sdl2')
depends_x86_64=('lib32-freetype2' 'lib32-fontconfig' 'lib32-libpulse' 'lib32-sdl2')
makedepends=('make' 'binutils' 'cmake')
makedepends_i686=('gcc' 'gcc-libs')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
backup=('etc/conf.d/xash3d')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs"
    ${pkgname%%-git}
    ${pkgname%%-git}.conf.d
    ${pkgname%%-git}.dedicated
    ${pkgname%%-git}.desktop
    https://github.com/FWGS/xash-extras/releases/download/v0.19.2/extras.pak
)
_args="--prefix=/usr \
--build-type=release \
--disable-vgui \
--enable-stbtt"

if [ $CARCH == "x86_64" ]; then
    _args+=" --libdir=/usr/lib32"
else
    _args+=" --libdir=/usr/lib"
fi

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive
}

prepare_xash3d() {
    cd $srcdir/$pkgname
    ./waf configure ${_args}
}

prepare_xash3ds() {
    cd $srcdir/$pkgname
    ./waf clean
    ./waf configure ${_args} --dedicated
}

build_both() {
    cd $srcdir/$pkgname
    ./waf build
}

install_both() {
    cd $srcdir/$pkgname
    ./waf install --destdir="$pkgdir"
}

package() {
    msg2 "Preparing xash3d compilation..."
    prepare_xash3d
    build_both
    install_both
    msg2 "Preparing xash3d dedicated compilation..."
    prepare_xash3ds
    build_both
    install_both
    
    cd $srcdir
    install -Dm644 ${pkgname%%-git}.conf.d $pkgdir/etc/conf.d/${pkgname%%-git}
    install -Dm755 ${pkgname%%-git} $pkgdir/usr/bin/${pkgname%%-git}
    install -Dm755 ${pkgname%%-git}.dedicated $pkgdir/usr/bin/${pkgname%%-git}-dedicated
    install -Dm644 ${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop
    install -Dm644 $pkgname/game_launch/icon-xash-material.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}.png
    install -Dm644 ../extras.pak $pkgdir/usr/share/xash3d/extras.pak
}

md5sums=('SKIP'
         '71f6125d9270685a05067e597e527747'
         '2f9f7b77e05177961fdcecc4660a2010'
         'c1f2f0000496b1a6e6763ac8fb25fed9'
         '60d714544048b0383a7e79cfaed96d78'
         '409462da6be03f004e84452cfcb93d6b')
