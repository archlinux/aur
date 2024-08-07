# Maintainer: Dylan Ferris <dylan@psilly.com>

_pkgname=godot-export-templates
pkgname=${_pkgname}-git
_gitname=godot
pkgver=4.3.r66012.eabeafd8c3
pkgrel=1
pkgdesc='Godot export templates'
url='https://godotengine.org/'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'scons' 'pulse-native-provider' 'clang' 'pkgconf' 'xorg-xrandr' 'yasm' 'lld')
optdepends=('godot: use the templates')
source=(
  "godot::git+https://github.com/godotengine/${_gitname}.git"
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

  # 64 bit
  scons platform=linuxbsd tools=no target=template_debug arch=x86_64 use_llvm=yes linker=lld use_static_cpp=no -j$(nproc)
  scons platform=linuxbsd tools=no target=template_release arch=x86_64 production=yes -j$(nproc)

  # 32 bit
  #scons platform=linuxbsd tools=no target=template_debug arch=x86_32 use_llvm=yes linker=lld use_static_cpp=no -j$(nproc)
  #scons platform=linuxbsd tools=no target=template_release arch=x86_32 production=yes -j$(nproc)
}

package() {
  cd "${srcdir}"/${_gitname}
  mkdir -p "${pkgdir}"/usr/share/godot/templates/

  # 64 bit
  install -Dm644 bin/godot.linuxbsd.template_debug.x86_64.llvm "${pkgdir}"/usr/share/godot/templates/
  install -Dm644 bin/godot.linuxbsd.template_release.x86_64 "${pkgdir}"/usr/share/godot/templates/

  # 32 bit
  #install -Dm644 bin/godot.linuxbsd.template_debug.x86_32.llvm "${pkgdir}"/usr/share/godot/templates/
  #install -Dm644 bin/godot.linuxbsd.template_release.x86_32 "${pkgdir}"/usr/share/godot/templates/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
