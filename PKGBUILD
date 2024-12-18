# Contributor: Andre Klitzing <andre () incubo () de>

_pkgname_filter=epson-inkjet-printer-filter
pkgrel=1
pkgdesc="Epson printer driver (XP-211, XP-214, XP-216)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
makedepends=('rpmextract' 'libtool')
#before 2023q4: source=(http://download.ebz.epson.net/dsc/op/stable/SRPMS/${pkgname}-${pkgver}-${_suffix} fixbuild.patch)

# after 2024q4, no more tgz option :( Keeping the url above commented in case anyone can find the new url pattern.

# ### ESC/P-R (wtf that means?)
#pkgname=epson-inkjet-printer-escpr
#pkgver=1.8.6_1
#
# option 0: rpm x86
#source=(https://download3.ebz.epson.net/dsc/f/03/00/16/21/78/068524457859755fc01cd53db5b57889f9972d22/${pkgname}-${pkgver//_/-}.x86_64.rpm)
#sha256sums=('9181f44577296c3c0e441642be9e6ea05827d545b1a654cd0a1d659c30d57162')
# option 1: deb (file says amd64 but the download page says x86)
#source=(https://download3.ebz.epson.net/dsc/f/03/00/16/21/77/211c32cd14db04ed7838001a6ec0276e5ffd7190/${pkgname}-${pkgver//_/-}_amd64.deb)
# option 3: src.rpm
#source=(https://download3.ebz.epson.net/dsc/f/03/00/16/21/79/6d53e6ec3f8c1e55733eb7860e992a425883bf88/${pkgname}-${pkgver//_/-}.src.rpm)
#sha256sums=('b38d7dd7ad859998ed942b4040f47e00e5f622abccb825fe221786c9f788d0b9')


# ### ESC/P (wtf that means?) (will install things in /opt)
pkgname=epson-inkjet-printer-201304w
pkgver=1.0.1_1
#
# option 0: rpm x86
#source=(https://download3.ebz.epson.net/dsc/f/03/00/15/64/70/e1a5b198d9ec3022460555a86fe0b229b34780f6/${pkgname}-${pkgver//_/-}.x86_64.rpm) # fixbuild.patch)
# option 1: deb amd64
#source=(https://download3.ebz.epson.net/dsc/f/03/00/15/64/70/4b221b9ca4675199c6aaaed410496581681ccfe6/${pkgname}_${pkgver//_/-}_amd64.deb fixbuild.patch)
# option 2: src.rpm <<<< THIS SEEMS TO BE WHAT WAS USED BEFORE. ASSUMING AS IT IS THE ONLY ONE WITH THE FILE MENTIONED IN THE PATCH.
source=(https://download3.ebz.epson.net/dsc/f/03/00/15/64/70/02fc7f8069df2901526663a791f564a9e310a6b9/${pkgname}-${pkgver//_/-}.src.rpm) # fixbuild.patch)
sha256sums=('5973652e1f96dbd1f3a2bfeb7ab579754313c7a67748461e22c6383a857d2026')

build() {
$(
    set -xeou pipefail

    cd "$srcdir"
    /usr/bin/rpmextract.sh "${pkgname}-${pkgver//_/-}.src.rpm"
    # the bellow file MIGHT change when the pkver change.
    #tar xzf epson-inkjet-printer-filter-1.0.2.tar.gz
    FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
    tar xzf ${FILTER_FILE}

    cd "${FILTER_FILE%.tar.gz}"
    #patch -p1 -i "$srcdir"/fixbuild.patch
    autoreconf -f -i
    # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
    ./configure LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/$pkgname

    # remove old helper script
    rm ./libtool
    # but we must link the good one there as it will use the full path to call it
    ln -s /usr/bin/libtool ./libtool
    # add missing
    ln -s /usr/bin/libtoolize ./libtoolize
    make
    # TODO: make, above, fails with PKGBUILD: line 64: libtoolize:: command not found
)
}

package() {
$(
    set -xeou pipefail
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    install -d "$pkgdir/opt/$pkgname/"
    if [ "$CARCH" = "x86_64" ]; then
        cp -a --no-preserve=mode lib64 "$pkgdir/opt/$pkgname/"
    else
        cp -a --no-preserve=mode lib "$pkgdir/opt/$pkgname/"
    fi
    cp -a --no-preserve=mode resource "$pkgdir/opt/$pkgname/"

    if [ -e "watermark" ]; then
        cp -a --no-preserve=mode watermark "$pkgdir/opt/$pkgname/"
    fi
    install -d "$pkgdir/usr/share/cups/model/$pkgname"
    install -m 644 ppds/* "$pkgdir/usr/share/cups/model/$pkgname"

    cd "$srcdir" || exit
    FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
    cd "${FILTER_FILE%.tar.gz}" || exit
    install -d "$pkgdir/opt/$pkgname/cups/lib/filter/"
    install -m 755 src/epson_inkjet_printer_filter "$pkgdir/opt/$pkgname/cups/lib/filter/epson_inkjet_printer_filter"
)
}
