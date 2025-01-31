# Maintainer: a821 at (nospam) mail de
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=python-yaml-git
pkgver=6.0.r11.g69c141a
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
url='https://pyyaml.org/wiki/PyYAML'
arch=('x86_64')
license=('MIT')
depends=('python' 'libyaml')
makedepends=('git' 'python-setuptools' 'cython' 'python-build' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
provides=("${pkgname%-git}" "python-pyyaml")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/yaml/pyyaml.git)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  local _pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
  export PYTHONPATH=build/lib.linux-${CARCH}-cpython-${_pyver}
  pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 CHANGES README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:
