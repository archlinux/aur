# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms-git
pkgver=r382.8fd4806
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/openwall/lkrg/"
        'dkms.conf')
sha512sums=('SKIP'
            '2b4dd1787d318820b3bd3117ec0e5a57148ea67156ff27718d143d99e152fec0ce973b4f09c90889d4a72bca81a76f9b170580d27e5c3d54ab1dadebe4d85d72')
makedepends=('git') 
depends=('dkms')
provides=('lkrg-dkms')
conflicts=('lkrg-dkms')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Set version
  cp dkms.conf "${pkgname}/"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgname}/dkms.conf"
}

package() {
  # Copy sources (including Makefile)
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;

  # Copy OUR dkms.conf
  install -Dm644 "${pkgname}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
