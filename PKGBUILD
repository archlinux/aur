# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

_pkgbase=led-ugreen
pkgbase=ugreen-leds-controller-git
pkgname=(ugreen-leds-controller-dkms-git ugreen-leds-controller-utils-git)
pkgver=v0.3.r8.g1defbaf
pkgrel=1

pkgdesc="LED controller for UGREEN NAS"
arch=('x86_64')
url="https://github.com/miskcoo/ugreen_leds_controller"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/miskcoo/ugreen_leds_controller.git")
sha256sums=('SKIP')
_gitname="ugreen_leds_controller"

pkgver() {
    cd ${_gitname}
    git describe --long --tags | sed 's/^release\-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"/scripts
  g++ -std=c++17 -O2 blink-disk.cpp -o ugreen-blink-disk
  g++ -std=c++17 -O2 check-standby.cpp -o ugreen-check-standby

}

package_ugreen-leds-controller-dkms-git() {
  pkgdesc="DKMS kernel module for UGREEN NAS leds"
  depends=('dkms' 'ugreen-leds-controller-utils-git')
  conflicts=('ugreen-leds-controller-dkms')
  provides=('ugreen-leds-controller-dkms')

  cd "${_gitname}"/kmod

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set version
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp ${_pkgbase}.* Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Module loading
  printf '%s\n' i2c-dev led-ugreen ledtrig-oneshot ledtrig-netdev |
    install -D -m0644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${_pkgbase}.conf"

}

package_ugreen-leds-controller-utils-git() {
  pkgdesc="Utils for module for UGREEN NAS leds"
  depends=('smartmontools' 'dmidecode')
  conflicts=('ugreen-leds-controller-utils')
  provides=('ugreen-leds-controller-utills')

  cd "${_gitname}"/scripts

  install -d "${pkgdir}"/usr/bin
  install -Dm755 ugreen-{diskiomon,netdevmon,power-led,probe-leds,blink-disk,check-standby} "${pkgdir}"/usr/bin/

  install -Dm644 ugreen-leds.conf "${pkgdir}"/etc/ugreen-leds.conf

  install -d "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 systemd/*.service "${pkgdir}"/usr/lib/systemd/system/

}
