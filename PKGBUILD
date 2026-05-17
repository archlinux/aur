# Maintainer: Gemini CLI Agent
_base=ch341-i2c-spi-gpio
pkgname=${_base}-dkms-git
pkgver=r59.1f05229
pkgrel=1
pkgdesc="Modern CH341 USB-I2C/SPI/GPIO adapter driver (Frank Zago's MFD version)"
license=(GPL)
arch=('i686' 'x86_64')
depends=(dkms)
makedepends=(git)
optdepends=('linux-headers: build the module against Arch kernel'
  'linux-lts-headers: build the module against LTS Arch kernel'
  'i2c-tools: for interacting with I2C devices'
  'libgpiod: for interacting with GPIO pins')
url="https://github.com/frank-zago/${_base}"
source=("git+${url}.git")
sha512sums=('SKIP')


conflicts=('i2c-ch341-dkms' 'spi-ch341-usb-dkms-git')
replaces=('i2c-ch341-dkms')

pkgver() {
  cd "${srcdir}/${_base}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${_base}"
  
  local _srcdir="${pkgdir}/usr/src/${_base}-${pkgver}"
  install -dm755 "${_srcdir}"
  
  # Copy all necessary files for the DKMS module
  cp -r * "${_srcdir}/"
  
  # Update version in dkms.conf to match the Arch package
  sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${_srcdir}/dkms.conf"
  
  # Clean up the copied source if necessary
  rm -rf "${_srcdir}/.git"
}
