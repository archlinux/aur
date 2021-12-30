# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=lesana
pkgver=0.9.0
pkgrel=3
pkgdesc="Manage collection inventories throught yaml files"
arch=('x86_64' 'aarch64')
url="https://lesana.trueelena.org/"
license=(GPL3)
depends=('python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-gitpython')
optdepends=('python-argcomplete: support for bash autocompletion')
makedepends=('python-setuptools')
provides=(lesana)
source=("https://git.sr.ht/~valhalla/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d9ed6884728f5d47977ae21e8e2fc634')

prepare() {
  cd "${pkgname}-v${pkgver}"
  # exclude tests from package
  sed -i.bpk "s/find_packages()/find_packages(exclude=['tests',])/" setup.py
  # fix data
  sed -i.bkp "s/'': \['\*\.yaml'\]/'': ['*.yaml', 'post-checkout']/" setup.py
}

build() {
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-v${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install scripts/openlibrary2lesana "${pkgdir}/usr/bin/"
  install scripts/tellico2lesana "${pkgdir}/usr/bin/"
}
