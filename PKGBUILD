# Maintainer: Alexander Tumin <iamtakingiteasy@eientei.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=ume-git
_pkgname=ume
pkgver=r67.242a9f5
pkgrel=8
pkgdesc="VTE based terminal emulator forked from sakura"
arch=('i686' 'x86_64')
url="https://github.com/SgtWiggles/ume"
license=('GPL-2.0-only')
depends=('vte3' 'libxft')
makedepends=('cmake' 'git')
source=("${_pkgname}::git+https://github.com/SgtWiggles/ume.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
  # extract the keybindings from the installed documentation, rest is only relevant during build time
  awk '/^Keybindings/{f="'${pkgdir}'/usr/share/doc/'${_pkgname}'/KEYBINDINGS"} f{print > f} /^END/' \
        "${pkgdir}"/usr/share/doc/${_pkgname}/INSTALL
  rm "${pkgdir}/usr/share/doc/${_pkgname}/INSTALL"
}
