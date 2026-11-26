# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
# Contributor: Javier Cordero <jneight@gmail.com>
# Contributor: M. Arnout <marnout at free.fr>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_model=dcpj140w
pkgname=brother-$_model
pkgver=1.1.3
pkgrel=4
pkgdesc="Printer (native 64-bit LPR and CUPS) and scanner driver for the Brother DCP-J140W"
arch=('x86_64')
_name=brdcpj140w-lpr64
url="https://github.com/medaminezghal/$_name"
license=('LicenseRef-Brother-LPR' 'GPL-2.0-or-later')
depends=('glibc'
         'cups'
         'ghostscript'
         'a2ps'
         'file'
         'which'
         'brscan4'
         'brscan-skey')
conflicts=("brother-$_model-lpr-bin")
backup=("opt/brother/Printers/$_model/inf/br${_model}rc")
install=$pkgname.install
_brrel=6
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://www.brother.com/pub/bsc/linux/dlf/${_model}lpr-$pkgver-$_brrel.i386.rpm"
        "https://www.brother.com/pub/bsc/linux/dlf/${_model}cupswrapper-gpl-src-$pkgver-$_brrel.tar.gz")
sha256sums=('570608bb1e8d18b3b759077a59695f47ab5456640dce1c51bf86b3c6d9a4bde4'
            '6283cfd7d9f7486bcdafa54c59c472cfcb1b8cad3d92cc22bf314314d6214006'
            '6bc963174e06fb7659f0b743be4da5557b6f5bac246e4a7ac5006d3ea686479f')

prepare() {
  cd "${_model}cupswrapper-gpl-src-$pkgver-$_brrel/cupwrapper"
  # Extract the CUPS filter that Brother's installer writes from a here-document, without running the installer
  sed -n '/^printer_model=/,/^device_model=/p' cupswrapper$_model > gen-filter.sh
  sed -n '/^cat <<!ENDOFWFILTER! >\$tmp_filter$/,/^!ENDOFWFILTER!$/p' cupswrapper$_model | sed '1s/ >\$tmp_filter$//' >> gen-filter.sh
}

build() {
  cd "$_name-$pkgver"
  make ORIG="$srcdir"/opt/brother/Printers/$_model/lpd/br${_model}filter
  cd "$srcdir"/${_model}cupswrapper-gpl-src-$pkgver-$_brrel/brcupsconfig
  ${CC:-gcc} $CPPFLAGS $CFLAGS $LDFLAGS -o brcupsconfpt1 brcupsconfig.c
  cd ../cupwrapper
  sh gen-filter.sh > brlpdwrapper$_model
  grep -q "/opt/brother/Printers/$_model/lpd/filter$_model" brlpdwrapper$_model
}

check() {
  cd "$_name-$pkgver"
  sh test/smoke.sh filter/br${_model}filter "$srcdir"/opt/brother/Printers/$_model/inf
  sh -n "$srcdir"/${_model}cupswrapper-gpl-src-$pkgver-$_brrel/cupwrapper/brlpdwrapper$_model
}

package() {
  cd "$_name-$pkgver"
  install -d "$pkgdir"/opt/brother/Printers/$_model
  cp -a "$srcdir"/opt/brother/Printers/$_model/{inf,lpd} "$pkgdir"/opt/brother/Printers/$_model/
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 NOTICE README.md -t "$pkgdir"/usr/share/doc/$pkgname/
  chmod a+w "$pkgdir"/opt/brother/Printers/$_model/inf "$pkgdir"/opt/brother/Printers/$_model/inf/br${_model}rc
  cd "$srcdir"/${_model}cupswrapper-gpl-src-$pkgver-$_brrel
  install -Dm755 brcupsconfig/brcupsconfpt1 -t "$pkgdir"/opt/brother/Printers/$_model/cupswrapper/
  install -Dm644 ppd/brother_${_model}_printer_en.ppd -t "$pkgdir"/opt/brother/Printers/$_model/cupswrapper/
  install -Dm644 ppd/brother_${_model}_printer_en.ppd -t "$pkgdir"/usr/share/cups/model/Brother/
  install -Dm755 cupwrapper/brlpdwrapper$_model -t "$pkgdir"/usr/lib/cups/filter/
}
