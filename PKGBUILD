# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=xctu
pkgver=6.3.2
pkgrel=2
pkgdesc="Next Generation Configuration Platform for XBee/RF Solutions."
arch=('i686' 'x86_64')
url="http://www.digi.com/products/xbee-rf-solutions/xctu-software/xctu"
license=('custom')
depends=('java-runtime-common')
options=('!strip')
# install=$pkgname.install
if [[ $CARCH == 'i686' ]]; then
    _setup_file=40002880_D.run
    md5sums=('97372b7aabdc3e25897726439373f798')
elif [[ $CARCH == 'x86_64' ]]; then
    _setup_file=40002881_D.run
    md5sums=('47cfcde687bf56196de66476fe8bca27')
fi
source=("http://ftp1.digi.com/support/utilities/$_setup_file"
        'xctu.desktop'
        'fix.patch')
md5sums+=('53dff8062eaad0249252f0bb93ad7404'
          '1e0ebe726f6d5304091d6e10d01de7be')
noextract=()

prepare() {
    chmod u+x $_setup_file
    # ./$_setup_file --prefix $srcdir --mode unattended --unattendedmodeui none
    # prefix option not working:
    printf "\n\n\n\n\ny\n\n$srcdir\n\n\nn\nn\n" | ./$_setup_file --mode text || true
    mv $srcdir/XCTU-NG $srcdir/$pkgname
    # XCTU wants to write a version file in the installation directory at first startup
    echo $pkgver > $srcdir/$pkgname/version.txt
    patch -p1 -N < $srcdir/fix.patch
}

package() {
    install -d $pkgdir/opt
    cp -a $srcdir/$pkgname $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/$pkgname/doc/License_Agreements.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Launcher
    install -Dm755 $srcdir/$pkgname/launcher $pkgdir/usr/bin/$pkgname

    # Desktop file
    install -Dm644 $srcdir/$pkgname/icon.xpm $pkgdir/usr/share/icons/hicolor/256x256/apps/xctu.xpm
    install -Dm644 $srcdir/xctu.desktop $pkgdir/usr/share/applications/xctu.desktop
}
# vim:set ft=sh:
