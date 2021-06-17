# Maintainer: David Runge <dvzrv@archlinux.org>

_name=setuptools-declarative-requirements
pkgname=python-setuptools-declarative-requirements
pkgver=1.2.0
pkgrel=1
pkgdesc="File support for setuptools declarative setup.cfg"
arch=('any')
url="https://github.com/s0undt3ch/setuptools-declarative-requirements"
license=('Apache')
depends=('python-setuptools')
makedepends=('python-setuptools-scm' 'python-toml')
checkdepends=('pypiserver' 'python-packaging' 'python-pytest' 'python-virtualenv' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('859e102be1503af5387ccd5907ab5879b91e2b8522dc8c9fff080d90bc806a1c7bc3f4bee273851d644740ab91cf2c1f6f1e83d207694f96126cf1cf87988258')
b2sums=('7d1fe255a427aa20c92bae8d346abc09672069726d853cbda6909ffa26c8cbe01ed19b9ac2a7c46a1258c9eef685142f5112d2bc25d3b1dfa077074ab728bbb5')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  # disable failing test:
  # https://github.com/s0undt3ch/setuptools-declarative-requirements/issues/4
  pytest -vv -k "not test_build_package[bdist_wheel]"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
