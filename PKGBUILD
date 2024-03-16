# Maintainer: Neptune <neptune@b7s.ru>
pkgname=ultimmc-bin
pkgver=1.6
pkgrel=4
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('x86_64')
url="https://github.com/UltimMC/Launcher"
license=('Apache')
depends=('zlib' 'opengl-driver' 'qt5-base' 'qt5-x11extras' 'qt5-svg' 'xorg-xrandr' 'zenity' 'wget' 'unzip')
source=("$pkgname-$pkgver.zip::https://nightly.link/UltimMC/ultimmc-deb/workflows/ci/master/UltimMC.zip"
        "https://raw.githubusercontent.com/UltimMC/ultimmc-deb/master/ultimmc/usr/share/man/man1/ultimmc.1")
sha256sums=('SKIP'
            'ef4957acc5be202049b46039512418df6556e409b816967b4949940bfadc2933')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xf ultimmc.deb -C "$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    bsdtar -xf data.tar.zst -C "$srcdir/$pkgname-$pkgver"
}

package() {
    mkdir -p "$pkgdir/opt/ultimmc"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"

    cp -R "$srcdir/$pkgname-$pkgver/opt/ultimmc/" -T "$pkgdir/opt/ultimmc/"
    cp -R "$srcdir/$pkgname-$pkgver/usr/share/applications/" -T "$pkgdir/usr/share/applications/"

    install -m644 -D "$srcdir/$pkgname-$pkgver/usr/share/applications/ultimmc.desktop" "$pkgdir/usr/share/applications/ultimmc.desktop"
    install -m644 -D "$srcdir/$pkgname-$pkgver/opt/ultimmc/icon.svg" "$pkgdir/opt/ultimmc/icon.svg"
    install -m755 -D "$srcdir/$pkgname-$pkgver/opt/ultimmc/run.sh" "$pkgdir/opt/ultimmc/run.sh"
    install -m755 -D "$srcdir/ultimmc.1" "$pkgdir/usr/share/man/man1/ultimmc.1"
    ln -s "/opt/ultimmc/run.sh" "$pkgdir/usr/bin/ultimmc"
}
