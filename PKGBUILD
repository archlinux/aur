# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
# Contributor: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=xctu
pkgver=6.5.5
pkgrel=0
pkgdesc="Next Generation Configuration Platform for XBee/RF Solutions."
arch=('i686' 'x86_64')
url="http://www.digi.com/products/xbee-rf-solutions/xctu-software/xctu"
license=('custom')
depends=('gtk2' 'java-runtime' 'libxtst' 'alsa-lib' 'gconf' 'nss' 'libglvnd' 'libnet' 'libxt')
options=('!strip')
# install=$pkgname.install
if [[ $CARCH == 'i686' ]]; then
    _setup_file=40002880_AB.run
    md5sums=('b81d444a279d37392a8578c8bbf5ea1a')
elif [[ $CARCH == 'x86_64' ]]; then
    _setup_file=40002881_AB.run
    md5sums=('379afc4b4da77f410615bf834ff9cdfa')
fi
source=("http://ftp1.digi.com/support/utilities/$_setup_file"
        'launcher.sh'
        'xctu.desktop'
        'fix.patch')
md5sums+=('9ebb584444f6e9417bb74c1f4c5792cd'
         '8268deecea042c3d4d557d6a47f1f004'
         '1e0ebe726f6d5304091d6e10d01de7be')
noextract=()

prepare() {
    chmod u+x $_setup_file
    # ./$_setup_file --prefix $srcdir --mode unattended --unattendedmodeui none
    # prefix option not working:
    printf "\n\n\n\n\ny\n\n$srcdir\n\n\nn\nn\n" | ./$_setup_file --mode text || true
    mv $srcdir/XCTU-NG $srcdir/$pkgname
    echo $pkgver > $srcdir/$pkgname/version.txt
    # change XCTU's config folder to ~/.config/xctu:
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
    install -Dm644 $srcdir/xctu.desktop $pkgdir/usr/share/applications/xctu.desktop
}
# vim:set ft=sh:
