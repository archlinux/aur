# Maintainer: Stephen Checkley <scheckley at gmail dot com>
pkgname=copasi-bin
pkgver=4.31.243
_pkgver=${pkgver##*.}
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=('i686' 'x86_64')
url="http://www.copasi.org/"
license=('Artistic 2.0')
depends=('shared-mime-info' 'freetype2')
source=('copasi-desktop.tar.gz')
install=copasi.install
noextract=($pkgname-$pkgver.tar.gz)
_source=https://github.com/copasi/COPASI/releases/download/Build-$_pkgver
source_i686=($pkgname-$pkgver.sh::$_source/COPASI-$pkgver-Linux-32bit.sh)
source_x86_64=($pkgname-$pkgver.sh::$_source/COPASI-$pkgver-Linux-64bit.sh)
sha256sums=('9576e4a9b2c7e74c91d0e1c0b39fcb20531e8fb4f21c5e8ac95b048609702923')
sha256sums_i686=('d9d08cf72b577b89179a90eaf9604c3c4ede550d2a729bc602f2523b0935be49')
sha256sums_x86_64=('d9d08cf72b577b89179a90eaf9604c3c4ede550d2a729bc602f2523b0935be49')

package() {

    MACHINE_TYPE=`uname -m`
    if [ ${MACHINE_TYPE} == 'x86_64' ]; then
        arch_flag=64bit
    else
        arch_flag=32bit
    fi

    cd "$srcdir"
    sh $pkgname-$pkgver.sh -e ~/

    rm ~/COPASI-$pkgver-Linux-$arch_flag/share/copasi/lib/libfreetype.so.6
    ln -s /usr/lib/libfreetype.so ~/COPASI-$pkgver-Linux-$arch_flag/share/copasi/lib/
    ln -s /usr/lib/libfreetype.so.6 ~/COPASI-$pkgver-Linux-$arch_flag/share/copasi/lib/

    # install program files
    install -m755 bin/* /usr/bin/
    cp -R ~/COPASI-$pkgver-Linux-$arch_flag/share/copasi /usr/share/

    # desktop integration...
    cd "$srcdir"/copasi-desktop
    install -Dm755 copasi.sh "$pkgdir/etc/profile.d/copasi.sh"
    install -Dm644 copasi.desktop "$pkgdir/usr/share/applications/copasi.desktop"
    install -Dm644 copasi.xml "$pkgdir/usr/share/mime/packages/copasi.xml"
    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -R icons/* "$pkgdir/usr/share/icons/hicolor/"
    # copasi starts CopasiUI after setting COPASIDIR environment variable
    # useful for launching COPASI using the menu entry
    install -Dm755 copasi "$pkgdir/usr/bin/copasi"

}
