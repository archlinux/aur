# Maintainer: Alexandros Collie <amcollie at gmail dot com>
pkgname="brother-mfc-j425w"
_model="mfcj425w"
pkgver="3.0.1"
_pkgver="3.0.0"
_pkgrel=1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-j425w"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlf006565/${_model}lpr-$pkgver-$_pkgrel.i386.rpm"
        "http://download.brother.com/welcome/dlf006567/${_model}cupswrapper-$_pkgver-$_pkgrel.i386.rpm")
sha256sums=('303d23f011d2d15b05bc903d41cf510b4c2bb5a8be5f6fc70a7955e88c98b04c'
            'b901153ee685d7677c7a593c6d5df34447934e90ecd83bee5ac7261e4a757c31')

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
        "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_model}"
}
