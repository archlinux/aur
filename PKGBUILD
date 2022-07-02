# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thore Bödecker <foxxx0@archlinux.org>

pkgname='python2-pytest-freezegun'
_name="${pkgname#python2-}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Wrap freezegun's freeze_time for Pytest (legacy Python 2 version)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
_repourl="https://github.com/ktosiek/${_name}"
license=('MIT')
makedepends=('python2-setuptools')
checkdepends=(
  'python2-freezegun'
  'python2-pytest'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('aaaea6a38c1e19a8158683d2e3cf34704163bcda58ba20b9fd066b89271c1fac621bdfe2200ce3c43391bc9b9a2aecb3b4e5b7a7e585df8af7676f60d16c2b14')

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
    export PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}:${PWD}/tests"
    py.test2 --verbose --cache-clear
  )
}

package() {
  depends=(
    'python2'
    'python2-freezegun'
    'python2-pytest'
  )

  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
