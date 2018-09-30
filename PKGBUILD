# Maintainer: Ivan Puntiy <ivan.puntiy at gmail>
# Contributor: <francois.archlinux.org>

pkgname=culmus
pkgver=0.133
pkgrel=1
pkgdesc="A collection of Type1 and TrueType Hebrew fonts"
arch=('any')
url="http://culmus.sourceforge.net"
license=('GPL2')
depends=('fontconfig' 'xorg-fonts-alias' 'xorg-font-utils' 'xorg-fonts-encodings')
source=(
  "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}-0.121-fontconfig_fix.patch"
)
sha256sums=('c0c6873742d07544f6bacf2ad52eb9cb392974d56427938dc1dfbc8399c64d05'
            '6ba13854700bd9cdf6b8facd920082aed367bedabe10e93bd39cfe6bf8eb76fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix due to fontconfig 2.10.1 update - patch mailed to upstream
  patch culmus.conf "${srcdir}/${pkgname}-0.121-fontconfig_fix.patch"
}

package() {
  # install Type1 fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/Type1"
  install -m644 "${srcdir}/culmus-${pkgver}/"*.{afm,pfa} \
    "${pkgdir}/usr/share/fonts/Type1"

  # install ttf fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/culmus-${pkgver}/"*.ttf \
    "${pkgdir}/usr/share/fonts/TTF"

  # install otf fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/culmus-${pkgver}/"*.otf \
    "${pkgdir}/usr/share/fonts/OTF"

  # install provided config file with priority 61
  install -m755 -d "${pkgdir}/etc/fonts/conf.avail/"
  install -m644 "${srcdir}/culmus-${pkgver}/culmus.conf" \
    "${pkgdir}/etc/fonts/conf.avail/61-culmus.conf"

  # symlink for the abovementioned config file
  install -m755 -d "${pkgdir}/etc/fonts/conf.d"
  ln -fs "../conf.avail/61-culmus.conf" "${pkgdir}/etc/fonts/conf.d/"
}
