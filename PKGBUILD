# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>

pkgname=brother-brgenml1
pkgver=3.1.0_1
pkgrel=3
_brotherpkgver=${pkgver:0:$((${#pkgver}-2))}
_brotherrelease=${pkgver:$((${#pkgver}-1))}
_brotherdrivername=BrGenML1
pkgdesc="LPR and CUPS driver for various Brother DCP, HL and MFC models."
arch=('i686' 'x86_64')
url='https://support.brother.com/g/s/id/linux/en'
license=('GPL version 2 for CUPS driver, custom:brother commercial license for LPR driver.')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf101124/brgenml1lpr-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "https://download.brother.com/welcome/dlf101126/brgenml1cupswrapper-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "lpr-license.txt")

md5sums=('9ab1b4096a3258ef3498377ce0a76d82'
         'cdba9c13be7a39ad75daa575f7cdf76e'
         'dbf216d89fbc0c287c569d819a1bca51')

prepare() {

sed -i 's/\$basedir =~ s\/$PRINTER\\\/cupswrapper\\\/.\*\$\/$PRINTER\\\/\/g;/my \$PRINTER = \"BrGenML1\";\nmy \$basedir = \"\/usr\/share\/Brother\/Printer\/\$PRINTER\";/' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"

sed -i '/my \$PRINTER=\$basedir;/d' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"

sed -i '/\$PRINTER =\~ s\/\^\\\/opt\\\/.\*\\\/Printers\\\/\/\/g;/d' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"
sed -i '/\$PRINTER =\~ s\/\\\/cupswrapper\/\/g;/d' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"
sed -i '/\$PRINTER =\~ s\/\\\/\/\/g;/d' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"

sed -i 's/\$lpddir = \$basedir.\"\/lpd\/";/\$lpddir = \$basedir.\"\/lpd\";/' "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}"

}

package() {

cp -a "$srcdir/var" "$pkgdir"

install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother-${_brotherdrivername}-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-${_brotherdrivername}-cups-en.ppd"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_brotherdrivername}"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/paperconfigml1" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/cupswrapper/paperconfigml1"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/braddprinter" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/braddprinter"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}func" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}func"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}rc" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}rc"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/setupPrintcap" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/setupPrintcap"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/brprintconflsr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/brprintconflsr3"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/filter_${_brotherdrivername}" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/filter_${_brotherdrivername}"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/rawtobr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/rawtobr3"

install -Dm644 lpr-license.txt "$pkgdir/usr/share/licenses/$pkgname/lpr-licence.txt"

}
