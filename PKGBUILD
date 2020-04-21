# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=0.7
pkgrel=3
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('x86_64')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${url}/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/${_pkgbase}-${pkgver}.tar.gz.sign"
        'kernel-5.6.patch'
        'dkms.conf')
sha512sums=('6f856d31aa79705e38a5436a47cb4e3f414a7734794713e6831426f1eda0f36ff1800e94dbfa9b211ab5b85055716c9b4839a8e46d292c9de95fc57b6cc02519'
            'SKIP'
            'cfbd6e2f8f8ced230939ad4773328e5ad00bc92c99c2174d57115aeb1e0bcad756fa609f380e37d345db8eaeebaac662458b9ea95777dfca541388d2e1d169e6'
            'ee259ac7e15fb6f6947ce6e64be808d6a1107d481ec0a7b4a35266bd720b639909c92e580fae2cecefe5318ce081a4d7431b5f941d1827f7783bee0a3206c5e8')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')
depends=('dkms')

prepare() {
  cd "${_pkgbase}-${pkgver}"
  # SELinux has been refactored in 5.6
  # A fix is available upstream in this commit but it doesn't apply cleanly:
  #  https://bitbucket.org/Adam_pi3/lkrg-main/commits/0f7c6350a844c4a65a6860bff1172035e3cccae3/raw"
  patch --forward --strip=1 --input="${srcdir}/kernel-5.6.patch"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_pkgbase}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;
}
