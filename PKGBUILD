# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='yandex-tank'
pkgver='1.11.3'
pkgrel='1'
pkgdesc='Performance measurement tool'
arch=('any')
url="https://github.com/yandex/${pkgname}"
license=('GPL')
depends=('python2-pyopenssl' 'python2-cryptography'
	 'python2-psutil' 'python2-numpy' 'python2-future'
	 'python2-pandas' 'python2-paramiko' 'python2-requests' 'phantom')
makedepends=('python2' 'python-setuptools' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('129a564ff448e817a96de4a264e5e7dd2f7c1b2936e238a4345e43e134119d54')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/data"
  gzip -f -9 load.conf.1 > load.conf.1.gz
  gzip -f -9 ${pkgname}.1 > ${pkgname}.1.gz
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"
  install -Dm0644 "data/load.conf.1.gz" "${pkgdir}/usr/share/man/man1/load.conf.1.gz"
  install -Dm0644 "data/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
