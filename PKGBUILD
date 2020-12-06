# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=3.1.0
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=('any')
url="https://github.com/pytest-dev/pytest-html"
license=('MPL2')
depends=('python-pytest' 'python-pytest-metadata')
makedepends=('python-setuptools-scm')
checkdepends=('python-ansi2html' 'python-pytest-mock'
'python-pytest-rerunfailures' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('161071f92b271970b47260e7f3ac8eed8c0a2329302b1ccee4d8eff25d9a2221b652ed193bd6bab3529d7736d1906cf3e229108868f6ec8f09f891d36e319bee')
b2sums=('d6da0588187727e4b1c4b6ba1ffe41154471140ae441f47094f5276303b463c278e6c95f193959e4753d0deede198d053a39ade78a0dfeb3925fb7b0e329314a')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  local _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  local _test_dir='test_dir'

  # install into test location
  mkdir -vp "${_test_dir}"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${_test_dir}"

  export PYTHONPATH="${PWD}/${_test_dir}/usr/lib/python${_python_version}/site-packages/:${PYTHONPATH}"
  export PATH="${PWD}/test_dir/usr/bin:${PATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
