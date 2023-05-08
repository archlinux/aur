# Maintainer: Marcel Hasler <mahasler at gmail dot com>

pkgname=brother-pt9800pcn
pkgver=1.0.1
pkgrel=1
pkgdesc="Driver and CUPS wrapper for Brother PT-9800PCN label printer"
arch=("x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=9800neus"
license=("EULA")
source=(
  "https://download.brother.com/welcome/dlfp100028/pt9800pcnlpr-1.0.1-1.i386.rpm"
  "https://download.brother.com/welcome/dlfp100030/pt9800pcncupswrapper-1.0.1-1.i386.rpm"
  "brother-pt9800pcn.patch"
)

sha256sums=(
  "bab011139b20fec467869110a0fc3621ce37f9b94a97f51f50ec692f75d1efea"
  "68d4cbb72b0ef835837b05e77ef4fc5c487a105a75029625929282b19031098e"
  "a66d72fe5cdb5aa87b194912657c41a9efd96c238eb66fc60556215298633e8c"
  )

prepare() {
  cd "$srcdir/opt/brother/PTouch/pt9800pcn/cupswrapper"
  patch < $srcdir/../brother-pt9800pcn.patch

  cd "$srcdir"
  sh opt/brother/PTouch/pt9800pcn/cupswrapper/cupswrapperpt9800pcn
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share"

  cp -R "$srcdir/opt/brother" "$pkgdir/opt"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"

  rm "$pkgdir/opt/brother/PTouch/pt9800pcn/cupswrapper/cupswrapperpt9800pcn"
  rm "$pkgdir/opt/brother/PTouch/pt9800pcn/inf/setupPrintcappt1"

  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_pt9800pcn"
  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/PT9800PCN.ppd"
}
