# Maintainer: Michael Wigham <michael@wigham.net>
# Contributor:  Nils Van Zuijlen <nils.van-zuijlen@mailo.com>, Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=xctu
pkgver=6.5.13
pkgrel=1
pkgdesc="Next Generation Configuration Platform for XBee/RF Solutions."
arch=('i686' 'x86_64')
url="http://www.digi.com/products/xbee-rf-solutions/xctu-software/xctu"
license=('custom')
depends=('gtk2' 'java-runtime' 'libxtst' 'alsa-lib' 'gconf' 'nss' 'libglvnd' 'libnet' 'libxt')
options=('!strip')
noextract=()

source_i686=("http://ftp1.digi.com/support/utilities/40002880_AJ.run")
md5sums_i686=('e28c71e26accdcb4d36395e26ba19835')

source_x86_64=("http://ftp1.digi.com/support/utilities/40002881_AJ.run")
md5sums_x86_64=('229ab2d443eded6184ecaef50ff99913')

source=(
    'launcher.sh'
    'xctu.desktop'
    'fix.patch'
)

md5sums=(
    '672a983dc8d23e4f6a496158d4852b99'
    '6612313eaebab9350989f75ca8d5d2ab'
    '92698e7e64cfcfbc8aae271ff904def6'
)

prepare() {
    if [[ $CARCH == 'i686' ]]; then
        _setup_file=40002880_AJ.run
    else
        _setup_file=40002881_AJ.run
    fi

    chmod u+x $_setup_file

    # Do not allow the installer to create a desktop file directly
    # this will be handled by the package() with our own desktop entry file
    mkdir -p $srcdir/Desktop
    HOME=$srcdir

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
