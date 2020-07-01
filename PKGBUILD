# Maintainer: Dylan Ferris <dylan@psilly.com>

_pkgname=godot-export-templates
pkgname=${_pkgname}-git
_gitname=godot
pkgver=4.0.dev
pkgrel=1
pkgdesc='Godot export templates'
url='https://godotengine.org/'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'scons' 'pulseaudio' 'clang' 'pkgconf')
optdepends=('godot: use the templates')

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

  # 64 bit client
  scons platform=linuxbsd tools=no target=release bits=64 CXX=clang++ werror=no -j$(nproc)
  scons platform=linuxbsd tools=no target=release_debug bits=64 CXX=clang++ werror=no -j$(nproc)

  # 64 bit headless server
  scons platform=server tools=no target=release bits=64 CXX=clang++ werror=no -j$(nproc)
  scons platform=server tools=no target=release_debug bits=64 CXX=clang++ werror=no -j$(nproc)

  # 32 bit client
  #scons platform=linuxbsd tools=no target=release bits=32 CXX=clang++ werror=no -j$(nproc)
  #scons platform=linuxbsd tools=no target=release_debug bits=32 CXX=clang++ werror=no -j$(nproc)
}

package() {
  cd "${srcdir}"/${_gitname}
  mkdir -p "${pkgdir}"/usr/share/godot/templates/

  # 64 bit client
  install -Dm644 bin/godot.linuxbsd.opt.64.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm644 bin/godot.linuxbsd.opt.debug.64.llvm "${pkgdir}"/usr/share/godot/templates/

  # 64 bit server
  install -Dm644 bin/godot_server.linuxbsd.opt.64.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm644 bin/godot_server.linuxbsd.opt.debug.64.llvm "${pkgdir}"/usr/share/godot/templates/

  # 32 bit client
  #install -Dm644 bin/godot.linuxbsd.opt.32.llvm "${pkgdir}"/usr/share/godot/templates/
  #install -Dm644 bin/godot.linuxbsd.opt.debug.32.llvm "${pkgdir}"/usr/share/godot/templates/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}
