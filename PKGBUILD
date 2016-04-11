# Maintainer: Danny Dutton <duttondj@vt.edu>

pkgname="brother-mfc-j410w"
_model="mfcj410w"
pkgver="1.1.3"
_pkgrel=1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J410W"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlf006557/${_model}lpr-$pkgver-$_pkgrel.i386.rpm"
        "http://download.brother.com/welcome/dlf006559/${_model}cupswrapper-$pkgver-$_pkgrel.i386.rpm")
md5sums=("d6cdd0f1700253d1535215ca702df2f2"
         "9ad51cde1a65d322d44e8dc6b28a88f9")

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
    cd "$srcdir"
    filter_file="$srcdir/filter_file"
    filter_wrapper="$srcdir/filter_wrapper"
    ppd_file="$srcdir/ppd_file"

    # extract filter from cupswrapper
    cupswrapper="$(find $srcdir -iname cupswrapper${_model})"
    limit_string="$(sed -n 's/cat <<\ *\([^\ ]*\)\ *>.*/\1/p' $cupswrapper)"
    sed -n -e '/^printer_model/ p' \
           -e '/^printer_name/ p' \
           -e '/^device_name/ p' \
           -e '/^device_model/ p' \
           -e 's|>\ *\$tmp_filter||' \
           -e '1,3 { /^#\! \/bin\/sh/ p }' \
           -e 's|/model/Brother|/model|g' \
           -e 's|/usr/local/Brother|/usr/share/brother|g' \
           -e '/cat <<\s*'"$limit_string"'/,/'"$limit_string"'/ {
                 s/\(^[\ #]*brother print filter\)\ *>>.*/\1/I
                 p
               }' \
           "$cupswrapper" > "$filter_wrapper"
    chmod 0755 "$filter_wrapper"
    if "$filter_wrapper" > "$filter_file"; then 
        rm "$filter_wrapper"
        rm "$cupswrapper"
    fi

    # move ppd file
    mv "$(find -iname '*'$_model'*.ppd' -print -quit)" "$ppd_file"

    # delete setupPrintcap
    find "$srcdir" -type f -name 'setupPrintcap*' -delete 
}

package() {
    # install files in $pkgdir
    cp -R $srcdir/usr $pkgdir
    if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
    install -m 644 -D "$srcdir/ppd_file" \
        "${pkgdir}/usr/share/cups/model/brother_${_model}_printer_en.ppd"
    install -m 755 -D "$srcdir/filter_file" \
        "${pkgdir}/usr/lib/cups/filter/brlpdwrapper${_model}"
}
