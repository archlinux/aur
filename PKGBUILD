# Maintainer: Xavier de Gaye <xdegaye@gmail.com>

pkgname=python-alpm-conf
pkgver=0.4
pkgrel=1
pkgdesc='ArchLinux tool to manage /etc configuration files using git'
arch=('any')
url='https://gitlab.com/xdegaye/alpm-conf'
license=('MIT')
depends=('git' 'util-linux' 'alpm-mtree' 'python>=3.12' 'pyalpm'
         'python-zstandard' 'python-flit-core')
makedepends=('python-build' 'python-installer' 'python-sphinx' 'gzip')
checkdepends=()
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('d26fb765126aa37be3dc0d6eb31cbb7fc68b493ff279328cef48ea18ba233d54')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
  make -C docs clean man
  gzip -c docs/build/man/alpm-conf.8 > alpm-conf.8.gz
}

check() {
  cd "${srcdir}/${pkgname}"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest --verbose --catch --failfast
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 alpm-conf.8.gz -t "$pkgdir/usr/share/man/man8/"
}
