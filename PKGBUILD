# Maintainer: envolution
# Contributor: dreieck
# Contributor: pika02
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-libpulse
pkgver=0.7
pkgrel=1
pkgdesc="Asyncio interface to the Pulseaudio and Pipewire pulse library"
arch=('any')
url="https://gitlab.com/xdegaye/libpulse"
license=('MIT')
provides=("${pkgname}=${pkgver}")
depends=(
  'python'
  'libpulse'
)
checkdepends=(python-pytest)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('5b3cf50a1a5aad6c038e6160f58d669815a947d3188748b479c71a96027794e9')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  PYTHONPATH="$PWD:$PYTHONPATH"
  python -m pytest --ignore=libpulse/tests/test_pactl.py
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
