# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=godot
pkgname=${_pkgname}-osc-git
pkgver=3.1.r15803.d7b892294
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine (git version with OSC support)"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('clang' 'git' 'scons')
depends=('desktop-file-utils' 'freetype2' 'glu' 'libpulse' 'libxcursor'
         'libxinerama' 'libxrandr' 'mesa' 'shared-mime-info')
conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/godotengine/${_pkgname}.git"
  'gdosc::git+https://github.com/djiamnot/gdosc.git#branch=develop'
)
sha256sums=('SKIP' 'SKIP')

if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local _major=$(grep ^major version.py | cut -f 3 -d ' ')
  local _minor=$(grep ^minor version.py | cut -f 3 -d ' ')
  local _rev=$(git rev-list --count HEAD)
  local _githash=$(git rev-parse --short HEAD)
  echo "${_major}.${_minor}.r${_rev}.${_githash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  ln -sf "${srcdir}/gdosc" modules/gdosc
  cd modules/gdosc
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}"

  # SCons apparently uses full path for calling the compiler
  # so we have to tell it to use ccache explicitly.
  if echo $PATH | grep -q /usr/lib/ccache && test -x /usr/lib/ccache/bin/clang++ ; then
    CXX=/usr/lib/ccache/bin/clang++
  else
    CXX=/usr/bin/clang++
  fi

  scons -j$(nproc) target=release_debug platform=x11 use_llvm=yes bits=${_arch} CXX=$CXX
}

package() {
  cd "${srcdir}/${_pkgname}"

  # binary
  install -D -m755 bin/godot.x11.opt.tools.${_arch}.llvm \
    "${pkgdir}/usr/bin/godot"
  # man page
  install -D -m755 misc/dist/linux/godot.6 -t "${pkgdir}/usr/share/man/man6"
  # icon
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  # desktop menu integration
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # mime-info database
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml \
    "$pkgdir/usr/share/mime/packages/${_pkgname}.xml"
  # licenses
  install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 modules/gdosc/LICENSE.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-gdosc.md"
}
