# Maintainer: Ritiek Malhotra <ritiekmalhotra123+aur at gmail dotty com>

pkgname=pi400kb-git
pkgver=0.0.1.r4.g0a8cd14
pkgrel=1
pkgdesc='Raw HID keyboard forwarder to turn the Pi 400 into a USB keyboard'
arch=('aarch64')
url='https://github.com/Gadgetoid/pi400kb'
license=('MIT')
makedepends=('git' 'libconfig' 'gcc' 'make' 'cmake')
provides=('pi400kb')
conflicts=('pi400kb')
source=(git+"${url}")
sha256sums=('SKIP')

_gitname="pi400kb"


prepare() {
  cd "${_gitname}"
  git submodule update --init
  mkdir -p build
}

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's:^v::;s:\([^-]*-g\):r\1:;s:-:.:g'
}

build() {
  cd "${_gitname}/build"
  cmake -DHOOK_PATH="/usr/bin/rpi400kb_hook.sh" ..
  make
}

check() {
  cd "${_gitname}/build"
  test -f "${_gitname}"
}

package() {
  cd ${_gitname}
  install -Dm755 "build/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm755 "hook.sh" "${pkgdir}/usr/bin/rpi400kb_hook.sh"
  install -Dm644 "${_gitname}.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/etc/modules-load.d/"
  echo libcomposite > "${pkgdir}/etc/modules-load.d/libcomposite.conf"

  echo
  echo ----------------------------------------------------------
  echo Execute the following to start the service now:
  echo   $ sudo modprobe libcomposite
  echo   $ sudo systemctl start pi400kb.service
  echo
  echo - Ctrl + Raspberry - Enable/disable forwarding
  echo - Ctrl + Shift + Raspberry - Exit
  echo
  echo Execute the following to start the service at every boot:
  echo   $ sudo systemctl enable pi400kb.service
  echo ----------------------------------------------------------
  echo
}
