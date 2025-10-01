# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: fenugrec <fenugrec at users sourceforge org>
# based on vspcplay PKGBUILD by rabyte / Boohbah

_pkgbase=vspcplay
pkgname=vspcplay-git
pkgver=1.5.r132.d295375
pkgrel=1
pkgdesc="A terminal-based visual SNES sound file (SPC) player and optimisation tool"
arch=('i686' 'x86_64')
url="http://vspcplay.raphnet.net/"
license=('GPL2')
depends=('sdl')
makedepends=('git')
conflicts=('vspcplay')
provides=('vspcplay')
source=(git+https://github.com/raphnet/vspcplay)
md5sums=('SKIP')

pkgver() {
  printf "%s.r%s.%s" \
    "$(
      # Parse base version from a Makefile snippet
      sed -n -e 's/^VERSION_STR := \(.*\)/\1/p' "${_pkgbase}/shared.mk"
    )" \
    "$(git -C "${_pkgbase}" rev-list --count HEAD)" \
    "$(git -C "${_pkgbase}" rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  make CC="gcc ${CFLAGS}" LD="\$(CPP) ${LDFLAGS}"
  cd utils
  make CC="gcc ${CFLAGS} ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 vspcplay utils/applymask32 "${pkgdir}/usr/bin/"
  install -Dm644 vspcplay-icon.ico "${pkgdir}/usr/share/pixmaps/vspcplay.ico"
}
