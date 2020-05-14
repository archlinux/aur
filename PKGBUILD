# Maintainer:Caleb McKay <caleb@candj.us>
# Contributor: Harvey <harv@gmx.de>
license=('GPL' 'custom:Brother')
arch=('i686' 'x86_64')
pkgname=brscanads2200ads2700w
pkgver=0.1.15_1
pkgrel=1
pkgdesc="SANE drivers from Brother for ads-2200 and ads-2700w"
url="http://support.brother.com"
depends=('sane')

[ "$CARCH" = "x86_64" ] && pkg="dlf103483/${pkgname}-${pkgver/_/-}.x86_64.rpm" || pkg="dlf103483/${pkgname}-${pkgver/_/-}.i386.rpm"
[ "$CARCH" = "x86_64" ] && pkg_md5sum="23b8a721dacbe6356594d197d2972816" || pkg_md5sum="4c7a4a874ebf7769237755e492eb1f74"

source=("https://download.brother.com/welcome/$pkg"
	"https://support.brother.com/g/s/agreement/English_lpr/agree.html")
md5sums=($pkg_md5sum
	 '5a4a3172f6278922062aa6e1f43b0d92')
build() {
    echo $'BrotherADS2200\nBrotherADS2700' > $srcdir/brscanads2200ads2700w.conf
    udev_rule='ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="04f9", ATTR{idProduct}=="03fb", MODE="0664", ENV{libsane_matched}="yes"'
    echo $udev_rule > $srcdir/40-brscanads2200ads2700w.rules
}
package() {
    depends=('libjpeg6-turbo')
    mkdir $pkgdir/opt
    cp -r $srcdir/opt/brother/scanner/$pkgname $pkgdir/opt
    cp -r $srcdir/usr $pkgdir
    install -D -m644 $srcdir/agree.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
    [ "$CARCH" = "x86_64" ] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
    
    #install sane-dll config file, so that the backend gets loaded.
    install -D -m644 $srcdir/brscanads2200ads2700w.conf $pkgdir/etc/sane.d/dll.d/brscanads2200ads2700w.conf
    
    #install the udev-rule
    install -D -m644 $srcdir/40-brscanads2200ads2700w.rules $pkgdir/etc/udev/rules.d/40-brscanads2200ads2700w.rules
    
    # move the links to the right direction
    cd $pkgdir/usr/lib/sane
    ln -sf libsane-BrotherADS2200.so.1.0.25 $pkgdir/usr/lib/sane/libsane-BrotherADS2200.so.1
    ln -sf libsane-BrotherADS2200.so.1 $pkgdir/usr/lib/sane/libsane-BrotherADS2200.so
    
    ln -sf libsane-BrotherADS2700.so.1.0.25 $pkgdir/usr/lib/sane/libsane-BrotherADS2700.so.1
    ln -sf libsane-BrotherADS2700.so.1 $pkgdir/usr/lib/sane/libsane-BrotherADS2700.so
}
