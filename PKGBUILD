# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Maintainer: Jonathan Neidel <aur@jneidel.com>

_binname=tsp
_modifier=cpu
_app_name=task-spooler
pkgname=${_app_name}-${_modifier}
pkgver=2.0.0
pkgrel=3
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://justanhduc.github.io/2021/02/03/Task-Spooler.html"
_ghurl="https://github.com/justanhduc/task-spooler"
license=('GPL-2.0')
makedepends=('make' 'git')
conflicts=("${_app_name}" "${_app_name}-gpu")
provides=("${_binname}")
source=("git+${_ghurl}.git#tag=v${pkgver}"
        'tsp.patch' 'gpu-fix.patch' 'end-jobs.patch')
sha256sums=('97a34e041f046b5061674bb793b70a8962986eab940c56d7cf4fbc69d4b115aa'
            '0409c3ad7f1b1b863d41df873fc2dce1ff37f13a846af5b6b7faeedf570ba3e6'
            '615af54f598e019e2b4e7e2a48e84309a4b2dceaa02be98ce95ff88ff1925cd2'
            '1a0d0b1fb94ab71fca54b2d1847db9d923a116f6762db89a7ca48b3939810294')

prepare() {
  patch -p 1 -d ${_app_name} < tsp.patch
  patch -p 1 -d ${_app_name} < gpu-fix.patch
  patch -p 1 -d ${_app_name} < end-jobs.patch
}

build() {
  cd "${_app_name}" || exit

  export CUDA_HOME="/opt/cuda/targets/x86_64-linux/"
  make CPPFLAGS="-D_DEFAULT_SOURCE" cpu
}

package() {
  cd "${_app_name}" || exit

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 TRICKS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 INSTALL.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  make PREFIX="${pkgdir}/usr" install
}
