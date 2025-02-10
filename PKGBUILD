# Maintainer: Luke Street <luke.street@encounterpc.com>
# Contributor: David Manouchehri
# Contributor: anatolik
# Contributor: fill <mailbox@fillo.ru>

_gitname=flashrom
pkgname="${_gitname}-git"
_gitbranch=main
_gitauthor=flashrom
pkgdesc="A utility to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL-2.0-only')
source=("git+https://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
depends=('glibc' 'libftdi' 'libusb' 'openssl' 'pciutils')
makedepends=('git' 'meson' 'cmocka' 'python-sphinx')
optdepends=(
  "dmidecode: for SMBIOS/DMI table decoder support"
  "libjaylink: for accessing SEGGER J-Link and compatible devices"
)
conflicts=("${_gitname}")
provides=("${_gitname}")
sha512sums=('SKIP')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=1.5.0.17.ged84669d
pkgrel=1

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/v\(.*\)/\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  export CFLAGS="-Wno-error=calloc-transposed-args $CFLAGS"
  arch-meson ../build
  ninja -v -C ../build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim:set et sw=2 sts=2 tw=80:
