# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: fenugrec <fenugrec at users sourceforge org>
# based on vspcplay PKGBUILD by rabyte / Boohbah

_pkgbase=vspcplay
pkgname=vspcplay-git
pkgver=1.3.r52.414c9ab
pkgrel=1
pkgdesc="A terminal-based visual SNES sound file (SPC) player and optimisation tool"
arch=('i686' 'x86_64')
url="http://vspcplay.raphnet.net/"
license=('GPL2')
depends=('sdl')
makedepends=('git')
source=(git+https://github.com/raphnet/vspcplay)
md5sums=('SKIP')

pkgver() {
  printf "%s.r%s.%s" \
    "$(
      # Parse the base version from `main.c`
      sed -n \
        -e 's/#define PROG_NAME_VERSION_STRING ".* v\(.*\)"/\1/p' \
        "${_pkgbase}/main.c"
    )" \
    "$(git -C "${_pkgbase}" rev-list --count HEAD)" \
    "$(git -C "${_pkgbase}" rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  make CFLAGS="${CFLAGS} $(sdl-config --cflags)"
  cd utils
  make CC="gcc ${CFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 vspcplay utils/applymask32 "${pkgdir}/usr/bin/"
  install -Dm644 vspcplay-icon.ico "${pkgdir}/usr/share/pixmaps/vspcplay.ico"
}
