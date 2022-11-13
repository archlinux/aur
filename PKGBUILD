# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-verbose-parametrize
pkgname=python-pytest-verbose-parametrize
pkgver=1.7.0
pkgrel=4
pkgdesc="Pytest parametrize hook to generate ids for parametrized tests"
arch=('any')
url="https://github.com/man-group/pytest-plugins/tree/master/pytest-verbose-parametrize"
license=('MIT')
depends=('python-pytest' 'python-six')
makedepends=('python-setuptools' 'python-setuptools-git')
checkdepends=('python-coverage' 'python-mock' 'python-pytest-virtualenv')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        $pkgname-python310.patch::https://github.com/man-group/pytest-plugins/commit/fef336a05902.patch)
sha512sums=('ac81cdf002d60b4af916c4beb4c832c9c39dc9dcfa3eea7385b093f9ea18391cbf968a4e908abdb23523a7cb1e294dce2017083414e61eef6762f157319e2cf4'
            '5e05613fd1c8d13f04b4b516907d8dd6e5b1c28bc550c8b38af3f3023c59f29fb586cfe8ffb05438d5fbd134e551976a858cbf439aa9ccddecd2b74c3e79c93d')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  patch -Np2 -d "$pkgname-$pkgver" <$pkgname-python310.patch
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v -k 'not test_handles_apparent_duplicates and not test_truncates_long_ids'
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CHANGES,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
