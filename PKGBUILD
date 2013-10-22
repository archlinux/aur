# Maintainer: Philipp Schmitt <philipp at schmitt dot co> 

pkgname=dialogblocks
_pkgname=DialogBlocks
pkgver=5.03
pkgrel=3
pkgdesc='Cross-plattform GUI programming assistant - wxwidget'
arch=('i686' 'x86_64')
url='http://www.anthemion.co.uk/dialogblocks/'
license=('unknown')
depends=('libpng12')
source=("http://www.anthemion.co.uk/dialogblocks/DialogBlocks-$pkgver-$CARCH.tar.gz")
[[ $CARCH == "x86_64" ]] && sha256sums=('a52c9d4440300f3b438a591e9ba8cef62e4cef8532d22fdcbd9f0a22f0f5fb73') || sha256sums=('7db332d9314499ba2543b8b066f04789fc3354b44c249b4cf7a55e36e2b17197')

build() {
    # Extract archive
    tar xvzf "$_pkgname-$pkgver-$CARCH.tar.gz"
    
    # Remove interaction
    sed -i 's/read inp/#read inp/g' installdb
    sed -i 's/read ans/ans=y #read ans/g' installdb
    sed -i "s/useroption='none'/useroption='0'/" installdb

    # Set correct installdir
    sed -i 's|DBBINDIR="$DBDIR/scripts"|DBBINDIR="'$pkgdir'/usr/bin"|' installdb
    sed -i 's|DBBINDIR="/usr/bin"|DBBINDIR="'$pkgdir'/usr/bin"|' installdb
    sed -i 's/INSTALLSYSTEMWIDE=0/INSTALLSYSTEMWIDE=1/' installdb 
    sed -i 's|DBDIR="/usr/share/DialogBlocks-5.03"|DBDIR="'$pkgdir'/opt/DialogBlocks"|' installdb
    
    # Do not clear screen
    sed -i 's/clear/#clear/g' installdb
}

package() {
     # Install
    chmod +x installdb
    ./installdb "${pkgdir}/opt/DialogBlocks"
    sed -i "s|$pkgdir||g" $pkgdir/usr/bin/dialogblocks
    rm $pkgdir/usr/bin/uninstalldialogblocks-$pkgver
}
