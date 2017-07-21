# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Maintainer: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2017.1
pkgrel=2
epoch=1
pkgdesc='batman kernel module'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("https://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
	'batman-adv-Fix-inconsistent-teardown-and-release-of-private-netdev-state..patch::https://patchwork.open-mesh.org/patch/17043/mbox/'
	'batman-adv-only-enable-priv-destructor.patch::https://patchwork.open-mesh.org/patch/17074/mbox/'
)
depends=('linux')
makedepends=('linux-headers')

sha256sums=('ec1848023308c41710eeefb544580f5853d68b88a627a3f2dabaa3472b988c15'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
	    '3518772d87fe23d233e46d91cc10de003029f7af64b6e2e4744d6f10c2a0081e'
	    '150a8acad0ba8a88b9643fe098fcdcc81ccc63b97f11b87e9c16af960081b660'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's/export CONFIG_BATMAN_ADV_MCAST=y/export CONFIG_BATMAN_ADV_MCAST=n/g' Makefile

  patch -p1 < "${srcdir}/batman-adv-Fix-inconsistent-teardown-and-release-of-private-netdev-state..patch"
  patch -p1 < "${srcdir}/batman-adv-only-enable-priv-destructor.patch"
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

