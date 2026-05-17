# Maintainer: Gemini CLI Agent
_base=ch341-i2c-spi-gpio
pkgname=${_base}-dkms-git
pkgver=r59.1f05229
pkgrel=2
pkgdesc="Modern CH341 USB-I2C/SPI/GPIO adapter driver (Frank Zago's MFD version)"
license=(GPL)
arch=('i686' 'x86_64')
depends=(dkms)
makedepends=(git)
optdepends=('i2c-tools: for interacting with I2C devices'
  'libgpiod: for interacting with GPIO pins')
url="https://github.com/frank-zago/${_base}"
install="${pkgname}.install"
source=("git+${url}.git"
        "60-ch341-i2c-spi-gpio.rules")
sha512sums=('SKIP'
            'fc1b502215cda0ec86def3cb3f32706fa785e068e40c9c4a94fbf994e8e69521f6353677508315a57ed2bb506e1eacfe5704fc56eb52dcf330f141b21f757ae5')

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
  
  # Install udev rules
  install -Dm644 "${srcdir}/60-ch341-i2c-spi-gpio.rules" "${pkgdir}/usr/lib/udev/rules.d/60-ch341-i2c-spi-gpio.rules"
}
