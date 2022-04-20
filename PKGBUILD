# Maintainer: Michael Wigham <michael@wigham.net>
# Contributor:  Nils Van Zuijlen <nils.van-zuijlen@mailo.com>, Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=xctu
pkgver=6.5.8
pkgrel=0
pkgdesc="Next Generation Configuration Platform for XBee/RF Solutions."
arch=('i686' 'x86_64')
url="http://www.digi.com/products/xbee-rf-solutions/xctu-software/xctu"
license=('custom')
depends=('gtk2' 'java-runtime' 'libxtst' 'alsa-lib' 'gconf' 'nss' 'libglvnd' 'libnet' 'libxt')
options=('!strip')

if [[ $CARCH == 'i686' ]]; then
    _setup_file=40002880_AD.run
    md5sums=('a256f85f694557cecc5de2679e7027bf')
elif [[ $CARCH == 'x86_64' ]]; then
    _setup_file=40002881_AD.run
    md5sums=('35e4352fac134e356f82e7ecc89894d3')
fi
source=("http://ftp1.digi.com/support/utilities/$_setup_file"
        'launcher.sh'
        'xctu.desktop'
        'fix.patch')
md5sums+=('9ebb584444f6e9417bb74c1f4c5792cd'
         '0b28e4ea6952a74a4fb06403a4ea7dde'
         '92698e7e64cfcfbc8aae271ff904def6')
noextract=()

prepare() {
    chmod u+x $_setup_file
    ./$_setup_file --installdir $srcdir --mode unattended --unattendedmodeui none
    mv $srcdir/XCTU-NG $srcdir/$pkgname
    echo $pkgver > $srcdir/$pkgname/version.txt
    patch -p1 -N < $srcdir/fix.patch
}

package() {
    install -d $pkgdir/opt
    cp -a $srcdir/$pkgname $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/$pkgname/doc/License_Agreements.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Launcher
    install -Dm755 $srcdir/launcher.sh $pkgdir/usr/bin/$pkgname

    # CLI
    ln -s /opt/xctu/XCTUcmd $pkgdir/usr/bin/XCTUcmd

    # Desktop file
    install -Dm644 $srcdir/$pkgname/icon.xpm $pkgdir/usr/share/icons/hicolor/256x256/apps/xctu.xpm
    install -Dm755 $srcdir/xctu.desktop $pkgdir/usr/share/applications/xctu.desktop
    install -Dm755 $srcdir/xctu.desktop $pkgdir/opt/$pkgname/XCTU.desktop
}
# vim:set ft=sh:
