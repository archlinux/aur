# Maintainer: bs2k <bs2k[at]bs[the number before three]k[period]me>
_pkgbase=uwurandom
pkgname=uwurandom-git-dkms
pkgver=r3.1272106
pkgrel=1
pkgdesc="Like /dev/urandom, but objectively better (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/valadaptive/uwurandom"
license=('GPL2' 'MIT')
depends=('dkms')
provides=('uwurandom')
source=("git+https://github.com/valadaptive/uwurandom.git"
        'dkms.conf')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}
}

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  chmod 755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r "${srcdir}/${_pkgbase}/"* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
