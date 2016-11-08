# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2016.4
pkgrel=0
epoch=1
pkgdesc='batman kernel module'
arch=('i686' 'x86_64')
url='https://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("https://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
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
  install -D -m644 build/net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('bc1236dd83209db51a09368b7ed1dd3a1ce5f5b933e09260c4d6f107c0a150eb'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            'f86ba376f8563b9eb2e040fad8282949d4c61413fced068204a8de0523392c1f'
            '1501d6fef6497461d2439505eeeb264f02f2ecfb06e7101908d72fc4d1953c14')
