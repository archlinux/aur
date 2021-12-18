# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='yandex-tank'
pkgver='1.12.8'
pkgrel='2'
pkgdesc='Performance measurement tool'
arch=('any')
url="https://github.com/yandex/${pkgname}"
license=('GPL')
depends=('python-pyopenssl' 'python-cryptography'
	 'python-psutil' 'python-numpy' 'python-future'
	 'python-pandas' 'python-paramiko' 'python-requests' 'phantom')
makedepends=('python' 'python-setuptools' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a34b9c75ff8e03b094798f389b3f8887db2f51766a35ef12cc5058736d14620d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/data"
  gzip -f -9 load.conf.1 > load.conf.1.gz
  gzip -f -9 ${pkgname}.1 > ${pkgname}.1.gz
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"
  install -Dm0644 "data/load.conf.1.gz" "${pkgdir}/usr/share/man/man1/load.conf.1.gz"
  install -Dm0644 "data/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
