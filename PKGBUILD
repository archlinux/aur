# Maintainer:  Rubin Simons <me@rubin55.org>

# Do HEAD by default. You can specify a specific commit hash here.
_commit=HEAD
_pkgname=Retro68
pkgname=${_pkgname,,}-git
pkgver=r1182.335fa54f6d
pkgrel=2
pkgdesc="Cross-platform classic Macintosh 68k and PowerPC toolchain"
arch=('x86_64')
url="https://github.com/autc04/${_pkgname}"
makedepends=('cmake' 'gmp' 'mpfr' 'libmpc' 'boost' 'bison' 'flex' 'texinfo' 'ruby' 'unarchiver')
provides=("${_pkgname}")
license=('GPLv3')
# You can get the MPW archive from https://macintoshgarden.org/apps/macintosh-programmers-workshop
source=("git+$url#commit=$_commit"
        "local://MPW_fully_updated.sit"
        "retro68.sh")

md5sums=('SKIP'
         '3f32f16d1e3b972e4a8b91ff6fd1406f'
         '2a9b1aa4c7f3f30d42bc7587ab75824c')
options=('!strip' '!debug' '!lto')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init
  unar -k hidden "${srcdir}/MPW_fully_updated.sit" 'MPW-GM+PR+Final Updates/Interfaces&Libraries/*'
  mv MPW_fully_updated/MPW-GM+PR+Final\ Updates/Interfaces\&Libraries/* InterfacesAndLibraries/
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p ../${_pkgname}-build
  cd ../${_pkgname}-build
  unset CFLAGS CXXFLAGS
  export MAKEFLAGS="--jobs=$(nproc)"
  "../${_pkgname}/build-toolchain.bash" --universal
}

package() {
  cd "${srcdir}/${_pkgname}-build"
  mkdir -p "${pkgdir}/opt"
  mv toolchain "${pkgdir}/opt/retro68"
  mv "${srcdir}/${_pkgname}/Samples" "${pkgdir}/opt/retro68/examples"
  install -m 755 "${srcdir}/retro68.sh" "${pkgdir}/opt/retro68/retro68.sh"
}
