# Maintainer: Orestis Floros <orestisf1993@gmail.com>
# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname='rofi-git'
pkgver=1.5.1.r52.g4631ac71
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement'
arch=('x86_64')
url='https://github.com/DaveDavenport/rofi/'
license=('MIT')
depends=(
  'cairo' 'flex' 'freetype2' 'librsvg' 'libx11' 'libxcb' 'libxdg-basedir'
  'libxft' 'libxkbcommon' 'libxkbcommon-x11' 'pango' 'startup-notification'
  'xcb-util' 'xcb-util-wm' 'xcb-util-xrm'
)
makedepends=('check' 'git')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=(
  'git+https://github.com/DaveDavenport/rofi#branch=next'
  'git+https://github.com/sardemff7/libgwater'
  'git+https://github.com/sardemff7/libnkutils'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${pkgname/-git}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-git}"

  for module in libgwater libnkutils; do
    local submodule="subprojects/${module}"
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done
}

build() {
  cd "${pkgname/-git}"

  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "${pkgname/-git}"

  #LC_ALL=C
  make check
}

package() {
  cd "${pkgname/-git}"

  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rofi/COPYING"
  install -dm755 "$pkgdir/usr/share/doc/rofi/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}

# vim: ts=2 sw=2 et:
