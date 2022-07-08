# Maintainer: Eric Woudstra <ericwouds@gmail.com>

_gitname=flashrom
pkgname="chromeos-${_gitname}-git"
pkgdesc="Flashrom Chromium OS version from git, includes libraries and programmers ec and host."
url="https://chromium.googlesource.com/chromiumos/third_party/${_gitname}"
license=('GPL')
source=("git+https://chromium.googlesource.com/chromiumos/third_party/${_gitname}")
depends=('libusb' 'libftdi' 'pciutils')
makedepends=('git' 'meson' 'cmocka')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("${_gitname}")
provides=("${_gitname}")
replaces=("${_gitname}-svn")
sha512sums=('SKIP')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=r4051.90795b2cc
pkgrel=1

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  arch-meson -D werror=false ../build
  ninja -v -C ../build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
}

