# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Lukas Sabota <lukas@lwsabota.com>
pkgname=blastem-hg
pkgver=r2242.31fc1186ffbb
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
  make menu.bin
}

package() {
  cd "${srcdir}/${pkgname%-hg}"
  install -d -g games "${pkgdir}/opt/blastem"
  install -m 755 -g games -D blastem "${pkgdir}/opt/blastem"
  install -m 666 -g games -D default.cfg "${pkgdir}/opt/blastem"
  install -m 666 -g games -D systems.cfg "${pkgdir}/opt/blastem"
  install -m 666 -g games rom.db gamecontrollerdb.txt "${pkgdir}/opt/blastem"
  install -m 644 -g games -d "${pkgdir}/opt/blastem/shaders"
  install -m 644 -g games -D shaders/* "${pkgdir}/opt/blastem/shaders"
  install -m 644 -g games -D menu.bin "${pkgdir}/opt/blastem"
  chmod 755 "${pkgdir}/opt/blastem/blastem"
  chown root:games "${pkgdir}/opt/blastem"
  chown root:games "${pkgdir}/opt/blastem/shaders"
  chmod 755 "${pkgdir}/opt/blastem/shaders"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/blastem/blastem" "${pkgdir}/usr/bin/blastem"
}
