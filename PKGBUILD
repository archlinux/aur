# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: aur2ccr (http://ddg.gg/?q=!ccr+aur2ccr&t=chakra)
# Maintainer : Marcos Heredia <chelqo@gmail.com>

_pkgname=linux_logo
pkgname=${_pkgname}_archcustom
pkgver=5.11
pkgrel=2
pkgdesc="Text-based logo and system information program"
arch=('i686' 'x86_64') 
url="http://www.deater.net/weave/vmwprod/linux_logo"
license=('GPL')
depends=('glibc' 'lsb-release')
conflicts=('linux_logo')
install=linux_logo.install
source=("http://www.deater.net/weave/vmwprod/linux_logo/${_pkgname}-${pkgver}.tar.gz"
        "arch.logo"
        "linux_logo.conf"
        "linux_logo.init")
sha1sums=('bd22808f165574cb3bc98c579aa48c0acab65f39'
          'e88f2076f8682676a3b28ee1d4c4d3fec0bc2a94'
          '438bbdf26804bdec1f2ac501b966944b13335065'
          'a79dbbd397c92aea302187348e27e1e3fb54e450')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  cp ${startdir}/arch.logo logos/distributions/
  echo "./logos/distributions/arch.logo" >logo_config
  echo "./logos/distributions/gnu-linux.logo" >>logo_config
  echo "./logos/banner.logo" >>logo_config
  echo "./logos/classic.logo" >>logo_config
  ./configure --prefix=/usr
  make
  #make logos-all
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install

  install -dm755 "${pkgdir}/etc/rc.d"
  install -Dpm644 ${startdir}/linux_logo.conf "${pkgdir}/etc/"
  install -Dpm755 ${startdir}/linux_logo.init "${pkgdir}/etc/rc.d/linux_logo"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/logos"
  install -Dpm644 ANNOUNCE.logo CHANGES* LINUX_LOGO.FAQ README* TODO USAGE "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 {logos,logos/distributions,logos/alternate_oses}/*.logo "${pkgdir}/usr/share/doc/${pkgname}/logos"
}
