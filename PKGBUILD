# Contributor: Andreas Amereller <andreas.amereller.dev@googlemail.com>
pkgname=brother-hl2240d
pkgver=2.0.4
pkgrel=3
pkgdesc="Brother HL-2240D CUPS driver"
arch=('i686' 'x86_64')
url="http://www.brother.com"
license=('custom:Brother Industries')
groups=()
depends=('glibc' 'cups')
makedepends=('rpmextract')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('hl2240d.patch'
	'http://download.brother.com/welcome/dlf005880/hl2240dlpr-2.1.1-1.i386.rpm'
	'http://download.brother.com/welcome/dlf005882/cupswrapperHL2240D-2.0.4-2.i386.rpm')
noextract=()
md5sums=('9d4aa68d8b016adcbcc3da2baa0c6ea6'
	 'c8549858d0e6a59fbacf7087bfdacfcb'
         '34d8b6a318bd8159bff55d4ba17206fd')

if [[ -z "$CARCH" ]]; then
  echo ":: PKGBUILD could not detect your architecture. Some dependencies may be missing"
else
  if [[ "$CARCH" == "x86_64" ]]; then
    depends=("${depends[@]}" 'lib32-glibc')
  fi
fi

build() {
  cd $srcdir 
  for n in *.rpm; do
    rpmextract.sh $n 
  done;
  patch -p0 < ../hl2240d.patch
  $srcdir/usr/local/Brother/Printer/HL2240D/cupswrapper/cupswrapperHL2240D-2.0.4
}

package() {
  mkdir -p $pkgdir/usr/share
  cp -R $srcdir/usr/local/Brother/Printer/HL2240D $pkgdir/usr/share/brother
  rm $pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2240D-2.0.4
  rm $pkgdir/usr/share/brother/inf/setupPrintcap2
  install -m 644 -D ppd_file $pkgdir/usr/share/cups/model/HL2240D.ppd
  install -m 755 -D wrapper $pkgdir/usr/lib/cups/filter/brlpdwrapperHL2240D
}

# vim:set ts=2 sw=2 et:
