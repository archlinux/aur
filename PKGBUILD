# Maintainer: doakey3 <doakey3@gmail.com>

pkgname="brother-pj723"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="CUPS driver for Brother Pocket Jet 723 printer"
url="http://www.brother.com"
license=('GPL')
install="brother-pj723.install"
arch=('x86_64')
depends=('lib32-glibc')
md5sums=(
    'e63370dea8692176e7d257d810145e76'
    'f976c06d770c74b94d8d480d463260e0'
)

source=(
    http://download.brother.com/welcome/dlfp100218/pj723cupswrapper-1.2.0-0.i386.rpm
    http://download.brother.com/welcome/dlfp100217/pj723lpr-1.2.0-0.i386.rpm
)

prepare() {
    # The point is to make all the needed edits to the files and place
    # them into correct folders in the src folder. Pretend $srcdir is
    # the root of the system.

    # .ppd
    mkdir -p "$srcdir/usr/share/ppd/Brother"
    _ppd="$srcdir/opt/brother/PTouch/pj723/cupswrapper/brother_pj723_printer_en.ppd"
    _out_ppd="$srcdir/usr/share/ppd/Brother/brother_pj723_printer_en.ppd"
    _out_wrapper="/usr/Brother/Printer/pj723/cupswrapper/brother_lpdwrapper_pj723"
    sed "s|brother_lpdwrapper_pj723|${_out_wrapper}|g" "$_ppd" > "$_out_ppd"

    # brcupsconfpt1
    mkdir -p "$srcdir/usr/Brother/Printer/pj723/cupswrapper"
    _driver="$srcdir/usr/bin/brprintconfpt1_pj723"
    _out_driver="$srcdir/usr/Brother/Printer/pj723/cupswrapper/brcupsconfpt1"
    cp "$_driver" "$_out_driver"

    rm -r "$srcdir/usr/bin"

    cp -R "$srcdir/opt/brother/PTouch/pj723/inf" "$srcdir/usr/Brother/Printer/pj723"
    cp -R "$srcdir/opt/brother/PTouch/pj723/lpd" "$srcdir/usr/Brother/Printer/pj723"

    _setupPrintcappt1="$srcdir/opt/brother/PTouch/pj723/inf/setupPrintcappt1"
    _out_setupPrintcappt1="$srcdir/usr/Brother/Printer/pj723/inf/setupPrintcappt1"

    _filterpj723="$srcdir/opt/brother/PTouch/pj723/lpd/filterpj723"
    _out_filterpj723="$srcdir/usr/Brother/Printer/pj723/lpd/filterpj723"

    # setupPrintcappt1 & filterpj723
    sed "s|/opt/brother/PTouch|/usr/Brother/Printer|g" "$_setupPrintcappt1" > "$_out_setupPrintcappt1"
    sed "s|/opt/brother/PTouch|/usr/Brother/Printer|g" "$_filterpj723" > "$_out_filterpj723"

    # lpdwrapper
    wrapper=$(sed -n '/<<!ENDOFWFILTER!/,$p' $srcdir/opt/brother/PTouch/pj723/cupswrapper/cupswrapperpj723)
    wrapper=$(sed "1d" <<< $wrapper)
    wrapper=$(sed -n "/!ENDOFWFILTER!/q;p" <<< $wrapper)
    wrapper=$(sed 's|${printer_model}|pj723|g' <<< $wrapper)
    wrapper=$(sed 's|\\||g' <<< $wrapper)
    wrapper=$(sed 's|/usr/share/cups/model/Brother/brother_pj723_printer_en.ppd|/usr/share/ppd/Brother/brother_pj723_printer_en.ppd|g' <<< $wrapper)
    wrapper=$(sed 's|/opt/brother/${device_model}/|/usr/Brother/Printer/|g' <<< $wrapper)

    echo "$wrapper" > "$srcdir/usr/Brother/Printer/pj723/cupswrapper/brother_lpdwrapper_pj723"
    chmod 755 "$srcdir/usr/Brother/Printer/pj723/cupswrapper/brother_lpdwrapper_pj723"
}

package() {
    cp -R "$srcdir/usr" "$pkgdir"
}
