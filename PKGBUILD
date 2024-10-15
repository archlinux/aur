# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor: None

pkgname=limo-git
pkgdesc='A simple Qt based mod manager.'
pkgver=r57.6eda51d
pkgrel=1
epoch=0
url='https://github.com/limo-app/limo/'
arch=('x86_64')
license=('GPL3')
makedepends=('cpr' 'git' 'jsoncpp' 'libarchive' 'libloot' 'openssl' 'pugixml'
             'qt5-base' 'qt5-tools')
depends=('cpr' 'git' 'jsoncpp' 'libarchive' 'libloot' 'openssl' 'pugixml'
         'qt5-base' 'qt5-tools')
optdepends=('doxygen')
source=("${pkgname}::git+https://github.com/limo-app/limo.git"
        'unrar-git::git+https://github.com/aawc/unrar.git')
cksums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}" || return
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mv 'unrar-git' "${pkgname}/unrar"
  cd "${pkgname}/unrar" && make lib || return
}

build() {
  cd "${pkgname}" || return
  mkdir build
  cmake -DCMAKE_BUILD_TYPE=Release -S . -B build
  cmake --build build
  cd build && make || return
  which doxygen &>/dev/null
  DOXYGEN_FOUND=$?
  if [[ ${DOXYGEN_FOUND} -eq 0 ]]; then
    doxygen ../src/lmm_Doxyfile
  fi
}

package() {
  cd "${pkgname}/build" || return
  make INSTALL_ROOT="${pkgdir}" install
}
