# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname='rofi-git'
_gitname='rofi'
pkgver=1.3.1.r757.g9b0a430f
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement'
arch=('i686' 'x86_64')
url='https://davedavenport.github.io/rofi/'
license=('MIT')
depends=(
  'cairo' 'flex' 'freetype2' 'librsvg' 'libx11' 'libxcb' 'libxdg-basedir'
  'libxft' 'libxkbcommon' 'libxkbcommon-x11' 'pango' 'startup-notification'
  'xcb-util' 'xcb-util-wm' 'xcb-util-xrm'
)
makedepends=('check' 'git' 'meson')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(
  'git+https://github.com/DaveDavenport/rofi'
  'git+https://github.com/sardemff7/libgwater'
  'git+https://github.com/sardemff7/libnkutils'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_gitname"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"

  for module in libgwater libnkutils; do
    local submodule="subprojects/${module}"
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done

  if [[ -d build ]]; then
    # This should be removed when 'meson [OPTIONS] ..' can be run
    # repeatedly without generating an error.
    rm -rf build
  fi

  mkdir -p build
}

build() {
  cd "${_gitname}/build"

  meson --prefix=/usr ..
  ninja
}

check() {
  cd "${_gitname}/build"

  ninja test
}

package() {
  cd "${_gitname}/build"

  DESTDIR="${pkgdir}" ninja install
  install -d -m 755 "${pkgdir}/usr/share/doc/rofi/examples"
  install -d -m 755 "${pkgdir}/usr/share/man/man1"
  install -D -m 644 ../COPYING "$pkgdir/usr/share/licenses/rofi/COPYING"
  install -D -m 644 ../doc/*.1 "${pkgdir}/usr/share/man/man1/"
  install -D -m 755 ../Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}

# vim: ts=2 sw=2 et:
