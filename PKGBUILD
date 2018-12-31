# Maintainer: Dylan Ferris <dylan@psilly.com>

_pkgname=godot-export-templates
pkgname=${_pkgname}-git
_gitname=godot
pkgver=3.1.dev
pkgrel=1
pkgdesc='Godot export templates'
url='https://godotengine.org/'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'scons' 'pulseaudio' 'clang')
depends=('glu' 'libxcursor' 'libxinerama' 'alsa-lib' 'freetype2' 'mesa')
_arch=''
if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi

source=(
  "git://github.com/godotengine/${_gitname}.git#branch=master"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  _major=$(cat version.py|grep "major" | sed 's/major = //')
  _minor=$(cat version.py|grep "minor" | sed 's/minor = //')
  _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_major}.${_minor}.${_revision}"
}

build() {
  cd "${srcdir}"/${_gitname}
  sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

  # 64 bit x11 client
  scons platform=x11 tools=no target=release bits=64 CXX=clang++ -j$(nproc)
  scons platform=x11 tools=no target=release_debug bits=64 CXX=clang++ -j$(nproc)
  
  # 64 bit headless server
  scons platform=server tools=no target=release bits=64 CXX=clang++ -j$(nproc)
  scons platform=server tools=no target=release_debug bits=64 CXX=clang++ -j$(nproc)

  # 32 bit
  scons platform=x11 tools=no target=release bits=32 CXX=clang++ -j$(nproc)
  scons platform=x11 tools=no target=release_debug bits=32 CXX=clang++ -j$(nproc)
}

package() {
  cd "${srcdir}"/${_gitname}
  mkdir -p "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot.x11.opt.64.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot.x11.opt.debug.64.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot_server.x11.opt.64 "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot_server.x11.opt.debug.64 "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot.x11.opt.32.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm755 bin/godot.x11.opt.debug.32.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}
