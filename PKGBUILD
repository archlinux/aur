# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Pipat Saengow <pay2630@gmail.com>

pkgname=hp15c
pkgver=4.0.0
pkgrel=2
pkgdesc="A simulator for the HP-15C programmable scientific RPN calculator"
url="http://hp-15c.homepage.t-online.de/content_web.htm"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk')
source=(
    "$pkgname-$pkgver.zip::https://drive.google.com/uc?export=download&id=1ewFXi6PPRsiPJESUq5A2Gp83NYSYVYKr"
    "01-package-path.patch"
    "02-executable.patch"
    "hp15c.desktop"
)
md5sums=('c90cc630d9e5bdf70912f8cd754cc2cc'
         'dc2c7e620a146bb718f05060393080ac'
         'd18b93bc1077430fed1e3563042a69ea'
         'bab776009feb1db971b92649c839ff1f')

prepare() {
    # patch
    for file in $srcdir/*.patch; do
        patch -p1 -i $file
    done

    #Extract icons
    unzip icons/HP-15C-logo.zip -d $srcdir/icon_extract
}

package() {

    # docs
    mkdir -p "$pkgdir/usr/share/doc/"
    cp -r doc "$pkgdir/usr/share/doc/$pkgname"
    cp "Read Me & Release Notes.html" "$pkgdir/usr/share/doc/$pkgname/README.html"

    # dependencies of script
    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r css icons lib msgs images -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 HP-15C_Simulator_Font.ttf -t "$pkgdir/usr/share/fonts/"

    # set up launch script
    install -m 755 HP-15C.tcl -t "$pkgdir/usr/lib/$pkgname/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/HP-15C.tcl" "$pkgdir/usr/bin/hp15c"

    # Install Desktop Entry
    install -D hp15c.desktop "$pkgdir/usr/share/applications/hp15c.desktop"

    # Install icon
    for i in 22 32 48 256 512 ; do
        install -D "icon_extract/HP-15C-logo-$i"'x'"$i.png" "$pkgdir/usr/share/icons/hicolor/$i"'x'"$i/apps/hp15c.png"
    done

}

# vim:set ts=4 sw=4 ft=sh et:
