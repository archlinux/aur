# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Maintainer: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2017.1
pkgrel=1
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

sha256sums=('ec1848023308c41710eeefb544580f5853d68b88a627a3f2dabaa3472b988c15'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's/export CONFIG_BATMAN_ADV_MCAST=y/export CONFIG_BATMAN_ADV_MCAST=n/g' Makefile

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

