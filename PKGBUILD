# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Lukas Sabota <lukas@lwsabota.com>

pkgname=blastem-hg
pkgver=r2315.b67e4e930fa4
pkgrel=1
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator (Development build)"
arch=('x86_64')
url="https://www.retrodev.com/blastem/"
license=('GPLv3')
depends=('sdl2' 'glew')
makedepends=('imagemagick' 'mercurial' 'python-pillow' 'vasm')
provides=('blastem')
conflicts=('blastem')
source=("blastem::hg+http://rhope.retrodev.com/repos/blastem")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed s/+//g
}

build() {
  cd "${srcdir}/${pkgname%-hg}"
  make blastem
  make termhelper
  make menu.bin
  make tmss.md
}

package() {
  cd "${srcdir}/${pkgname%-hg}"

  install -d -g games "${pkgdir}/opt/blastem"
  install -d -g games "${pkgdir}/opt/blastem/shaders"
  install -d -g games "${pkgdir}/opt/blastem/images"

  install -Dm 755 -g games blastem termhelper "${pkgdir}/opt/blastem"

  install -Dm 644 -g games default.cfg \
                           gamecontrollerdb.txt \
                           menu.bin \
                           rom.db \
                           systems.cfg \
                           tmss.md \
    "${pkgdir}/opt/blastem"

  install -Dm 644 -g games shaders/* "${pkgdir}/opt/blastem/shaders"
  install -Dm 644 -g games images/* "${pkgdir}/opt/blastem/images"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/blastem/blastem" "${pkgdir}/usr/bin/blastem"
}
