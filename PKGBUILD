# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jens Ott <jo at opteamax dot de>
pkgname=brother-mfc-l8650cdw
pkgver=1.1.3
pkgrel=1
_lpr_ver=1.1.2
_model=mfcl8650
pkgdesc="LPR and CUPS driver for the Brother MFC-L8850CDW"
url="http://www.brother.com/"
arch=('i686' 'x86_64')
license=('unknown')
install="$pkgname.install"
depends=('tcsh' 'a2ps' 'lib32-libcups')
makedepends=('perl')
source=("https://download.brother.com/welcome/dlf101088/${_model}cdwlpr-${_lpr_ver}-1.i386.deb"
        "https://download.brother.com/welcome/dlf101089/${_model}cdwcupswrapper-${pkgver}-1.i386.deb")
noextract=("${_model}cdwlpr-${_lpr_ver}-1.i386.deb"
           "${_model}cdwcupswrapper-${pkgver}-1.i386.deb")
sha256sums=('3c9367b144c067f1c9e51b974f8c1e23a1294aa6fd572d4aa229af15ca066e10'
            'c4bebc2939593ef155c74ad54f82329e7f6151bf9a208a012963b20d380de48a')

prepare() {
  mkdir -p "${_model}cdwlpr-${_lpr_ver}-1"
  ar x "${_model}cdwlpr-${_lpr_ver}-1.i386.deb" --output="${_model}cdwlpr-${_lpr_ver}-1"
  pushd "${_model}cdwlpr-${_lpr_ver}-1"
  bsdtar xf data.tar.gz
  perl -i -pe 's#printcap\.local#printcap#g' "opt/brother/Printers/${_model}cdw/inf/setupPrintcapij"
  popd

  mkdir -p "${_model}cdwcupswrapper-${pkgver}-1"
  ar x "${_model}cdwcupswrapper-${pkgver}-1.i386.deb" --output="${_model}cdwcupswrapper-${pkgver}-1"
  pushd "$srcdir/${_model}cdwcupswrapper-${pkgver}-1"
  bsdtar xf data.tar.gz
  perl -i -pe 's#/etc/init.d#/etc/rc.d#g' "opt/brother/Printers/${_model}cdw/cupswrapper/cupswrapper${_model}cdw"
  popd
}

package() {
  cp -r "${_model}cdwlpr-${_lpr_ver}-1"/{opt,usr} "$pkgdir/"
  cp -r "${_model}cdwcupswrapper-${pkgver}-1/opt" "$pkgdir/"
}
