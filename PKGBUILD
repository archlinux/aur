# Maintainer: Michiru Saito <urihcim at gmail dot com>
pkgname=brother-mfc-930cdn
pkgver='1.1.2_2'
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-930CDN / MFC-930CDWN"
arch=('i686' 'x86_64')
url='http://support.brother.co.jp/j/b/downloadlist.aspx?c=jp&lang=ja&prod=mfc930cdn&os=127'
license=('custom')
depends=('cups')
depends_x86_64=('lib32-glibc') 
source=("http://download.brother.com/welcome/dlf100725/mfc930cdnlpr-${pkgver//_/-}.i386.rpm"
        "http://download.brother.com/welcome/dlf100727/mfc930cdncupswrapper-${pkgver//_/-}.i386.rpm"
        'agree_lpr.html'
        'agree_gpl.html')
md5sums=('ba35077822b44dddd963db42d1c4edc9'
         'a3a9a6dbc167c183184a2e8c3a4a4789'
         '54e299b76523231f07df19370317be2a'
         'b9af5e17c14a943e53edb003900ef0d8')

prepare() {
  mkdir -p ./usr/share/cups/model
  mkdir -p ./usr/lib/cups/filter
  _wrapper=./usr/local/Brother/Printer/*/cupswrapper/cupswrapper*
  sed -i \
    -e '/stop\|restart\|sleep\|lpadmin/s/^/: /' \
    -e 's@/usr@./usr@g' \
    -e 's@/model/Brother@/model@g' \
    -e 's/lpinfo/echo/g' \
    $_wrapper
  $_wrapper
  rm $_wrapper
  find . -type f -name 'setupPrintcap*' -delete
  sed -i 's@\./@/@' ./usr/lib/cups/filter/*lpdwrapper*
  sed -i 's@/usr/local/Brother@/usr/share/brother@g' $(grep -lr '/usr/local/Brother' ./)
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  cp -R "$srcdir/usr/lib" "$pkgdir/usr"
  cp -R "$srcdir/usr/share/cups" "$pkgdir/usr/share"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"
  install -m 644 agree_*.html "$pkgdir/usr/share/licenses/$pkgname"
}
