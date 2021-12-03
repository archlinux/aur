# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=3.1.1
pkgrel=3
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=('any')
url="https://github.com/pytest-dev/pytest-html"
license=('MPL2')
depends=('python-pytest' 'python-pytest-metadata')
makedepends=('python-setuptools-scm')
checkdepends=('python-ansi2html' 'python-pytest-mock'
'python-pytest-rerunfailures' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('78091b485d153b54cd76abb8cfeb6494830b1b51a10dc0c00c73eccf67962d2805e3f83972c7ccfd1f877a939b582f80d5ddd5273fd1ddcac2a1a9c2eb121300')
b2sums=('d2491280ceb4524a10a46891448bb63fe997a4be82062e727fb1d79ef6154a0b4229bbec27c6601372776f7c8dd124aab5d4968482fc24ad24330db5d2520187')

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
