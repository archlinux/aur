# Maintainer: <aur@rot13.io>
# Contributor: sven-to <aur@sven.to>
# Based on AUR Package brother-dcp7055 by ewolnux <thinux@gmx.fr>

_brother_model="dcp9017cdw"
_cupswrapper_ver="1.1.4"

pkgname="brother-$_brother_model"
pkgver="1.1.3"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother DCP-9017CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: sane scanning support')
install="$pkgname.install"
# Package Info: wget http://www.brother.com/pub/bsc/linux/infs/DCP9017CDW
source=(
    "http://download.brother.com/welcome/dlf102666/${_brother_model}cupswrapper-$_cupswrapper_ver-0.i386.rpm"
    "http://download.brother.com/welcome/dlf102665/${_brother_model}lpr-$pkgver-0.i386.rpm"
    'cupswrapper-license.txt'
    'lpr-license.txt'
)
sha256sums=('c12874970464291f247561b5c7513486a7635c24d9e5a6d75b7b5d96ab24936e'
            'cb50a840940d41cbca94e715baf0df0513be986827d2e5fec61cf645636b117b'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

prepare() {
  #  do not install in '/usr/local'
  if [ -d "$srcdir/usr/local/Brother" ]; then
    install -d "$srcdir"/usr/share
    mv "$srcdir"/usr/local/Brother/ "$srcdir"/usr/share/brother
    rm -rf "$srcdir"/usr/local
    sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
  fi
  # setup cups-directories
  install -d "$srcdir"/usr/share/cups/model
  install -d "$srcdir"/usr/lib/cups/filter
  #  go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
  cd `find . -type d -name 'cupswrapper'`
  if [ -f cupswrapper* ]; then
    local _wrapper_source="$(echo cupswrapper*)"
    sed -i '/^\/etc\/init.d\/cups/d' "$_wrapper_source"
    sed -i '/^sleep/d' "$_wrapper_source"
    sed -i '/^lpadmin/d' "$_wrapper_source"
    sed -i 's|/usr|$srcdir/usr|g' "$_wrapper_source"
    sed -i 's|/opt|$srcdir/opt|g' "$_wrapper_source"
    sed -i 's|/model/Brother|/model|g' "$_wrapper_source"
    sed -i 's|lpinfo|echo|g' "$_wrapper_source"
    export srcdir="$srcdir"
    ./$_wrapper_source
    sed -i 's|$srcdir||' "$srcdir"/usr/lib/cups/filter/*lpdwrapper*
    sed -i "s|$srcdir||" "$srcdir"/usr/lib/cups/filter/*lpdwrapper*
    rm -- "$_wrapper_source"
  fi
  #  /etc/printcap is managed by cups
  find "$srcdir" -type f -name 'setupPrintcap*' -delete
}

package() {
  cp -R "$srcdir"/usr "$pkgdir"
  if [ -d "$srcdir"/opt ]; then cp -R "$srcdir"/opt "$pkgdir"; fi
  install -m 644 -D cupswrapper-license.txt "$pkgdir"/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt "$pkgdir"/usr/share/licenses/${pkgname}/lpr-licence.txt
}
