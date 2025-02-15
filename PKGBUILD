# Contributor:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:   pika02 (https://aur.archlinux.org/account/pika02)
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-libpulse
pkgver=0.6
pkgrel=1
pkgdesc="Asyncio interface to the Pulseaudio and Pipewire pulse library."
arch=('any')
url="https://gitlab.com/xdegaye/libpulse"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
  'python>=3.8'
  'python<4'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core>=3.2'
  'python-flit-core<4'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=()
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('cc8303c5939e71560647ba22403166dbfa4cb2acff893a231b8e84bddb014b19')


build() {
  cd "${srcdir}/${pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  ### Remove file that gets ill-installed
  #rm -v "${pkgdir}/usr/LICENSE.txt"

  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

