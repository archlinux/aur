# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-freezegun'
_name="${pkgname#python2-}"
pkgver=0.3.15
pkgrel=8
pkgdesc="Support for tests to mock datetime and set fake times values (legacy Python 2 version)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
_repourl="https://github.com/spulec/${_name}"
license=('Apache')
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  'python2-dateutil'
  'python2-mock'
  'python2-pytest'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d4ed621d2d25ed675758d4385e892fb3af220ecc694310e6124fe1c1bbf3cf02f0088affd40f152d5a23c8e942a7f83166250bcc5d4185ff1030bdcfa8b0166e')

prepare() {
  cd "${_tarname}"

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')

  echo "Deleting async modules since they don't support Python 2"
  rm -rv $(find . -name '*_async*.py')
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  (
    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    pytest2 --verbose --cache-clear
  )
}

package() {
  depends=(
    'python2'
    'python2-dateutil'
  )

  cd "${_tarname}"
  python2 \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1 \
	--skip-build

  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
