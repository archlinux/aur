# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname='ags-git'
_pkgname='ags'
pkgver=3.4.1.6.r56.g234c69ef
pkgrel=1
pkgdesc='Adventure Game Studio, a development tool that is primarily used to create graphical adventure games'
arch=('i686' 'x86_64')
url='http://www.adventuregamestudio.co.uk/'
license=('custom: Artistic 2.0')
depends=('allegro' 'dumb' 'freetype2' 'libogg' 'libtheora' 'libvorbis')
makedepends=('git')
optdepends=('wine: For non-native games')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(
  'git+https://github.com/adventuregamestudio/ags.git'
  'agslua::git+https://github.com/duncanc/Lua-for-AGS.git'
  'git+https://github.com/google/googletest.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags           \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/v.//'
}

prepare() {
  cd "${_pkgname}"

  local submodules=(
    'Plugins/agslua/agslua'
    'Common/libsrc/googletest'
  )

  for module in "${submodules[@]}"; do
    git submodule init "${module}"
    git config "submodule.${module}.url" "${srcdir}/$(basename ${module})"
    git submodule update "${module}"
  done
}

build() {
  cd "${_pkgname}"

  make --directory=Engine
}

package() {
  cd "${_pkgname}"

  install -D -m 755      \
    "Engine/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m 644 \
    "License.txt"   \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
