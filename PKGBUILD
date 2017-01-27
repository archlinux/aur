# Maintainer: auipga
# Based on PKGBUILD by Maintainer: Libernux <dutchman55@gmx.com> for DCP135C
pkgname="brother-dcp353c"
pkgver="1.0.1"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP353C/357C"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=(cups a2ps)
install="$pkgname.install"
source=(
    "http://www.brother.com/pub/bsc/linux/dlf/dcp353clpr-$pkgver-$pkgrel.i386.rpm"
    "http://www.brother.com/pub/bsc/linux/dlf/dcp353ccupswrapper-$pkgver-$pkgrel.i386.rpm"
    'cupswrapper-license.txt'
    'lpr-license.txt'
    'filterdcp353c.patch'
)
md5sums=(
    'e112ac9bc3f420f082625eb9df0b5b11'
    'a309a9c06646789ded489b3b5fc63435'
    '97ad0cffd216059e9d1d3121899d8646'
    '5e87a3dc0f3e3438c088eda0f3565f0d'
    'b33e08c23cd4071210c2f342fc6aea8e'
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

    # patch
    # see https://bbs.archlinux.org/viewtopic.php?pid=940524#p940524
    patch -Np1 -i "${srcdir}/filterdcp353c.patch"

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