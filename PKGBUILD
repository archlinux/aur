# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=riotkit-do
pkgver=2.1.5
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
sha256sums=('94f051b39a173b87ffbbd4da9544df6ff05bd45e65c194cbe7c77f9e4ece128d')

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