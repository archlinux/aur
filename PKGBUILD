# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=darkplaces
pkgver=20110628
pkgrel=2
pkgdesc="An advanced Quake 1 game engine"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('alsa-lib' 'libjpeg6' 'libxpm' 'libxxf86vm' 'libxxf86dga' 'sdl')
makedepends=('xextproto' 'xf86dgaproto' 'xf86vidmodeproto' 'xproto')
install=$pkgname.install
source=(http://icculus.org/twilight/$pkgname/files/darkplacesengine$pkgver.zip
        $pkgname.desktop)
md5sums=('c42103732cedfcf385ee959db9db6cb4'
         '31dd47a4969ad5d9d0e1c59db1d0e1e2')

build() {
    # Extract the package
    cd $srcdir
    bsdtar -xf darkplacesenginesource$pkgver.zip || return 1

    # Make sure Darkplaces is not compiled with -j > 1.
    MAKEFLAGS="${MAKEFLAGS} -j1"

    # Compile
    cd $pkgname
    sed -i -e '1i DP_LINK_TO_LIBJPEG=1' makefile
    make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake release || return 1

    # Install binary, icon and desktop files
    install -d $pkgdir/usr/{bin,share/quake}
    install -m 755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin/

    for i in 16 24 32 48 64 72 ; do
        install -Dm 644 darkplaces${i}x$i.png $pkgdir/usr/share/icons/hicolor/${i}x$i/apps/darkplaces.png
    done

    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
