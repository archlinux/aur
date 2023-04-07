# Maintainer: Li Chen <me at linux dot beauty>
_base=ch343
pkgname=${_base}-dkms
pkgver=20230407
pkgrel=1
pkgdesc="CH343 serial driver"
license=(GPL)
arch=('i686' 'x86_64')
depends=(dkms)
makedepends=(git)
optdepends=('linux-headers: build the module against Arch kernel'
  'linux-ck-headers: build the module against Linux-ck kernel'
  'linux-lts-headers: build the module against LTS Arch kernel')
url="https://github.com/FirstLoveLife/${_base}"
source=(git+${url}
  dkms.conf.in *.conf)

package() {
  cd ${_base}
  install -dm755 "${pkgdir}/usr/src/${_base}-${pkgver}/"
  for i in "${srcdir}/${_base}/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_base}-${pkgver}/"
  done

  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" >"${pkgdir}/usr/src/${_base}-${pkgver}/dkms.conf"

  # autoload
  install -Dm644 ${srcdir}/ch343.conf "${pkgdir}/etc/modules-load.d/ch343.conf"

  # Blacklists conflicting module
  install -Dm644 ${srcdir}/cdc_acm.conf "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf"
}
sha256sums=('SKIP'
            '97964a99ceddca86af72429a4d3fc3521f0ccc3ea1247171f6854959674ddefb'
            '90413cc881dd782d98d8e591bb11b59b4c3827bfbd3f67aa40c4a711827d895a'
            'aa0713acc5394a9a985cc36642ece724056dd9b72349088896bc05a3ddb0e343')
