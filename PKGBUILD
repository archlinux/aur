# Maintainer: Barnaby Gray <barnaby at pickle dot me dot uk>
pkgname=raspberry-pico-sdk-git
pkgver=2.2.0
pkgrel=2
pkgdesc="Raspberry Pico SDK "
arch=("any")
url="https://github.com/raspberrypi/pico-sdk"
license=('BSD-3')
source=(
	"git+https://github.com/raspberrypi/pico-sdk"
	"pico-sdk.sh"
	"pico-sdk.csh"
)
sha256sums=(
	'SKIP'
	'8610406fc529818eb2f67163e19a7204cda36f8cd7ed77fb4a65154918de3acb'
	'5d795a2d5de6046ad4bf196c912da4683e62779cac8dbcf90f20733470810e34'
)
depends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'cmake')
optdepends=('arm-none-eabi-gdb')
makedepends=('git')
install="pico-sdk.install"

pkgver() {
  cd "${srcdir}/pico-sdk"
  git describe --tags --match '?.*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/pico-sdk"
  git submodule update --init
  mkdir -p "${pkgdir}/usr/share"
  find "${srcdir}/pico-sdk" -type f -executable -iname '*.c' -print0|xargs -0 chmod -x
  find "${srcdir}/pico-sdk" -type f -executable -iname '*.h' -print0|xargs -0 chmod -x
  cp -r "${srcdir}/pico-sdk" "${pkgdir}/usr/share/pico-sdk"
  install -Dm755 "${srcdir}/pico-sdk.sh" "${pkgdir}/etc/profile.d/pico-sdk.sh"
  install -Dm755 "${srcdir}/pico-sdk.csh" "${pkgdir}/etc/profile.d/pico-sdk.csh"
}
