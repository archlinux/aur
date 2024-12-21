# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_binname=tsp
_modifier=cpu
_app_name=task-spooler
pkgname=${_app_name}-${_modifier}
pkgver=2.0.0
pkgrel=2
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://justanhduc.github.io/2021/02/03/Task-Spooler.html"
license=('GPL-2.0')
makedepends=('make')
conflicts=("${_app_name}" "${_app_name}-gpu")
provides=("${_binname}")
source=(https://github.com/justanhduc/task-spooler/archive/refs/tags/v${pkgver}.tar.gz
        task-spooler.patch)
sha256sums=('ffffa86f95071e837af619e23fb4a037432b0b079d872d58dc530883d1d33557'
            '0409c3ad7f1b1b863d41df873fc2dce1ff37f13a846af5b6b7faeedf570ba3e6')

prepare() {
  patch -p 1 -d ${_app_name}-${pkgver} < task-spooler.patch
}

build() {
  cd ${_app_name}-${pkgver} || exit

  make cpu
}

package() {
  install -Dm644 ${_app_name}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 ${_app_name}-${pkgver}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ${_app_name}-${pkgver}/TRICKS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ${_app_name}-${pkgver}/INSTALL.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ${_app_name}-${pkgver}/CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  make -C ${_app_name}-${pkgver} PREFIX="${pkgdir}/usr" install
}
