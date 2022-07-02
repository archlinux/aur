# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname='python2-pytest-timeout'
_name="${pkgname#python2-}"
pkgver=1.4.2
pkgrel=5
pkgdesc='Pytest plugin to abort hanging tests (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
makedepends=('python2-setuptools')
checkdepends=(
  'python2-pexpect'
  'python2-pytest'
)
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('20b3113cf6e4e80ce2d403b6fb56e9e1b871b510259206d40ff8d609f48bda76')

prepare() {
  cd "${_tarname}"

  if [[ -d 'tmp_install' ]]; then
        echo "Cleaning the previous 'tmp_install' directory"
        rm -rfv 'tmp_install'
  fi

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  (
    # lookup path, i.e. "/usr/lib/python3.8"
    local python_stdlib_basepath="$(python2 -c "from sysconfig import get_path; print(get_path('stdlib'))")"

    # Hack entry points by installing it
    python2 setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build

    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}"

    py.test2 --verbose --cache-clear -k 'not cov'
  )
}

package() {
  depends=(
    'python2'
    'python2-pytest'
  )

  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
