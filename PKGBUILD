# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r271.3a288ff
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
depends=('lib32-freetype2' 'lib32-fontconfig' 'lib32-sdl2' 'lib32-vgui' 'xash3d-hlsdk')
makedepends=('make' 'binutils' 'cmake')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
backup=('etc/conf.d/xash3d')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs.git"
    ${pkgname%%-git}
    ${pkgname%%-git}.conf.d
    ${pkgname%%-git}.dedicated
    ${pkgname%%-git}.desktop
    https://github.com/FWGS/xash-extras/releases/download/v0.19.2/extras.pak
)

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule init && git submodule update
}

package() {
    cd $srcdir/$pkgname/
    ./waf configure --prefix=/usr \
        --dedicated \
        --build-type=release \
        --vgui https://github.com/FWGS/vgui-dev \
        --enable-stbtt
    ./waf --dedicated build
    ./waf --destdir="$pkgdir" --dedicated install

    ./waf clean

    ./waf configure --prefix=/usr \
        --build-type=release \
        --vgui https://github.com/FWGS/vgui-dev \
        --enable-stbtt
    ./waf build
    ./waf --destdir="$pkgdir" install
    mv $pkgdir/usr/lib $pkgdir/usr/lib32
    install -Dm644 ../${pkgname%%-git}.conf.d $pkgdir/etc/conf.d/${pkgname%%-git}
    install -Dm755 ../${pkgname%%-git} $pkgdir/usr/bin/${pkgname%%-git}
    install -Dm755 ../${pkgname%%-git}.dedicated $pkgdir/usr/bin/${pkgname%%-git}-dedicated
    install -Dm644 ../${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop
    install -Dm644 game_launch/icon-xash-material.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}.png
    install -Dm644 ../extras.pak "$pkgdir"/usr/share/xash3d/extras.pak
}

md5sums=('SKIP'
         '107bb1fdd50f9044b14761eab3f21bfa'
         'd82f1f869074b46ee8c5ac8053dcb275'
         'c44e1cb53d58f7691cec9a82a8e29289'
         '60d714544048b0383a7e79cfaed96d78'
         '409462da6be03f004e84452cfcb93d6b')
