# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2016.2
pkgrel=0
pkgdesc='batman kernel module'
arch=('i686' 'x86_64')
url='https://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("https://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
        '0001-batman-adv-Fix-speedy-join-in-gateway-client-mode.patch'
        '1001-batman-adv-introduce-no_rebroadcast-option.patch'
        '1002-batman-adv-decrease-maximum-fragment-size.patch'
)
depends=('linux')
makedepends=('linux-headers')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('61521b3a4af216533850c2cdb7055b5f9c59eb3ce4849b55e2fd96a3ad92465e'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            'b1425b0fa6268fc67b3f35b443c382d86ac0e8513b3f786a06695f90b36774ee'
            '7a876cccdb287fb9929cf1b33361334d78b6cd7cbb3f3fb0a3c9c261f335edaf'
            '1501d6fef6497461d2439505eeeb264f02f2ecfb06e7101908d72fc4d1953c14')
