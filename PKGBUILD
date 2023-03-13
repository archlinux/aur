# Maintainer: Luke Street <luke.street@encounterpc.com>
# Contributor: David Manouchehri
# Contributor: anatolik
# Contributor: fill <mailbox@fillo.ru>

_gitname=flashrom
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=flashrom
pkgdesc="Flashrom is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source=("git+https://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
depends=('libftdi' 'pciutils')
makedepends=('git' 'meson' 'cmocka' 'python-sphinx')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("${_gitname}")
provides=("${_gitname}")
replaces=("${_gitname}-svn")
sha512sums=('SKIP')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=v1.2.r1231.g0e8902f1
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
  arch-meson ../build
  ninja -v -C ../build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim:set et sw=2 sts=2 tw=80:
