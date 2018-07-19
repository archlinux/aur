# Mantainer: Matteo Bonora <bonora.matteo at gmail dot com>
_model=HLL2370DN
pkgname=brother-${_model,,}
pkgver=4.0.0
pkgrel=1
pkgdesc="Brother ${_model} CUPS driver"
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('GPL')
depends=('cups' 'perl')
source=(http://download.brother.com/welcome/dlf103580/${_model,,}pdrv-$pkgver-1.i386.rpm)
sha256sums=('7123c153a59d447d6ccd0ba4f73ef480f4f497a38d4340822ab4c04437bec8e7')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother-${_model}-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
  ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/${_model}/inf" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
}

