# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=riotkit-do
pkgver=1.1
pkgrel=1
pkgdesc='Task executor - balance between Makefile and Gradle. Written in Python. Powerful tool for every DevOps. Automates production tasks as well as local development tasks'
arch=('any')
url='https://github.com/riotkit-org/riotkit-do'
license=('Apache')
depends=('python-yaml'
         'python-pbr'
         'python-jinja'
         'python-dotenv'
         'python-tabulate')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/riotkit-org/riotkit-do/archive/v${pkgver}.tar.gz")
sha256sums=('67f9061f168fa4a8d878633e11f9d44b590fce887bc0a6922e88894ac6a73fb2')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s|==|>=|g" requirements.txt
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R src/rkd/misc "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/rkd"
  cp -R src/rkd/internal "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/rkd"
}
# vim:set ts=2 sw=2 et: