# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-01-29

_gitname=zuluCrypt
_build=build
pkgname=zulucrypt-git
pkgver=5.5.0
pkgrel=1
pkgdesc="a cli and gui frontend to cryptsetup."
arch=('x86_64' 'i686')
url="https://github.com/mhogomchungu/zuluCrypt/"
license=('GPL')
depends=('cryptsetup' 'qt5-base' 'libpwquality' 'libsecret' 'libxkbcommon-x11')
makedepends=('cmake' 'git')
provides=(${_gitname})
conflicts=(${_gitname})
optdepends=('kwalletmanager: retrieve volume keys from kde kwallet')

# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
# source=("git+https://code.google.com/p/${_gitname}/")
source=("git+https://github.com/mhogomchungu/${_gitname}/")

# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
    cd "${_gitname}"
    msg "Making Build directory... ${_build}"
    if [[ -d "${_build}" ]]; then
        rm -Rf ${_build}
    fi
    mkdir -p ${_build}
    cd ${_build}
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOGUI=false -DQT5=true -DHOMEMOUNTPREFIX=false -DCMAKE_BUILD_TYPE=release . ..
    make
}
 
package() {
  msg "changelog updated"
  cd "${_gitname}"
  cp changelog ../../${pkgname}.changelog
  cd "${_build}"
  make DESTDIR="$pkgdir" install
}
