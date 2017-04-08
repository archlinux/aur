# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Maintainer: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2017.0.1
pkgrel=0
epoch=1
pkgdesc='batman kernel module'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("https://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
)
depends=('linux')
makedepends=('linux-headers')

sha256sums=('55c2bc9739c5ef13d6951705431a3bcc4b9e5686be9c8d742923d1149f04c47c'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')

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

