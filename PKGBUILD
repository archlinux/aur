# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>

pkgname=brother-brgenml1
pkgver=3.1.0_1
pkgrel=2
_brotherpkgver=${pkgver:0:$((${#pkgver}-2))}
_brotherrelease=${pkgver:$((${#pkgver}-1))}
_brotherdrivername=BrGenML1
pkgdesc="LPR and CUPS driver for various Brother DCP, HL and MFC models. Complete list in package."
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('GPL')
depends=('cups')
source=("http://download.brother.com/welcome/dlf101124/brgenml1lpr-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "http://download.brother.com/welcome/dlf101126/brgenml1cupswrapper-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "brother_lpdwrapper_${_brotherdrivername}.patch")

md5sums=('9ab1b4096a3258ef3498377ce0a76d82'
         'cdba9c13be7a39ad75daa575f7cdf76e'
         '2ada870167986ea8e55b61c6be0d5201') 

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

prepare() {

patch "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}" < "$srcdir/brother_lpdwrapper_${_brotherdrivername}.patch"

}

package() {

cp -a "$srcdir/var" "$pkgdir"

install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother-${_brotherdrivername}-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-${_brotherdrivername}-cups-en.ppd"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_brotherdrivername}"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/paperconfigml1" "$pkgdir/usr/share/Brother/Printer/$_brotherdrivername/cupswrapper/paperconfigml1"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/braddprinter" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/braddprinter"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}func" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}func"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}rc" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}rc"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/setupPrintcap" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/setupPrintcap"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/brprintconflsr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/brprintconflsr3"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/filter_${_brotherdrivername}" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/filter_${_brotherdrivername}"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/rawtobr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/rawtobr3"

mkdir -p "$pkgdir/usr/share/doc/$pkgname"

echo "Compatible Model" > "$pkgdir/usr/share/doc/$pkgname/README"
echo "DCP-7055, DCP-7055W, DCP-7060D, DCP-7065DN, DCP-7070DW, DCP-8070D, DCP-8085DN, DCP-8110DN, DCP-8250DN, HL-2130, HL-2132, HL-2135W, HL-2240, HL-2240D, HL-2250DN, HL-2270DW, HL-5340D, HL-5350DN, HL-5350DNLT, HL-5370DW, HL-5440D, HL-5450DN, HL-5450DNT, HL-5470DW, HL-6180DW, HL-6180DWT, MFC-7360N, MFC-7460DN, MFC-7860DW, MFC-8370DN, MFC-8510DN, MFC-8520DN, MFC-8880DN, MFC-8890DW, MFC-8950DW, MFC-8950DWT" >> "$pkgdir/usr/share/doc/$pkgname/README"

chmod 0644 "$pkgdir/usr/share/doc/$pkgname/README"

}
