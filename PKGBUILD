# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2016.0
pkgrel=3
epoch=1
pkgdesc='batman kernel module'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
        '0001-batman-adv-introduce-no_rebroadcast-option.patch'
        '0002-batman-adv-decrease-maximum-fragment-size.patch'
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

sha256sums=('7ff5d5e131b0c67deca00176349b62a98cc988df7fd2e90244f2ba288253ae64'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            '17c2722c81c196601878adba5315df425499e5e6cac89914d79e1806a835e95a'
            '17355f53c41d6687b893103c011cb48fc0e88b5eb217ccc5e93501da53b7f601')
