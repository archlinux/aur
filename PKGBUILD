# Maintainer: kwasow <wasowski02@gmail.com>
# Based on PKGBUILD by Maintainer: auipga for DCP353C
pkgname="brother-dcp375cw"
pkgver="1.1.3"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP375CW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=(cups a2ps)
install="$pkgname.install"
source=(
    "http://www.brother.com/pub/bsc/linux/dlf/dcp375cwlpr-1.1.3-1.i386.rpm"
    "http://www.brother.com/pub/bsc/linux/dlf/dcp375cwcupswrapper-1.1.3-1.i386.rpm"
    'cupswrapper-license.txt'
    'lpr-license.txt'
)
md5sums=(
    '60cdd83336cea4e35dc2e425ce164c2a'
    '38761700b844373e833fdc0705a5e89c'
    '97ad0cffd216059e9d1d3121899d8646'
    '5e87a3dc0f3e3438c088eda0f3565f0d'
 )
if test "$CARCH" == x86_64; then
    depends+=('lib32-glibc')
fi
prepare() {
    # do not install in '/usr/local'
    if [ -d $srcdir/usr/local/Brother ]; then
        install -d $srcdir/usr/share
        mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
        rm -rf $srcdir/usr/local
        sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
    fi

    # setup cups-directories
    install -d $srcdir/usr/share/cups/model
    install -d $srcdir/usr/lib/cups/filter
    #  go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
    cd `find . -type d -name 'cupswrapper'`
    if [ -f cupswrapper* ]; then
        _wrapper_source=`ls cupswrapper*`
        sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
        sed -i '/^sleep/d' $_wrapper_source
        sed -i '/^lpadmin/d' $_wrapper_source
        sed -i 's|/usr|$srcdir/usr|g' $_wrapper_source
        sed -i 's|/opt|$srcdir/opt|g' $_wrapper_source
        sed -i 's|/model/Brother|/model|g' $_wrapper_source
        sed -i 's|lpinfo|echo|g' $_wrapper_source
        export srcdir=$srcdir
        ./$_wrapper_source
        sed -i 's|$srcdir||' $srcdir/usr/lib/cups/filter/*lpdwrapper*
        sed -i "s|$srcdir||" $srcdir/usr/lib/cups/filter/*lpdwrapper*
        rm $_wrapper_source
    fi

    #  /etc/printcap is managed by cups
    rm `find $srcdir -type f -name 'setupPrintcap*'`
}
package() {
    cp -R $srcdir/usr $pkgdir
    if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
    install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
    install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}