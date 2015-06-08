# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-01-29

_gitname=zulucrypt
_build=build
pkgname=${_gitname}-git
pkgver=4.7.5.33.ga1a29d8
pkgrel=1
pkgdesc="a cli and gui frontend to cryptsetup."
arch=('x86_64' 'i686')
url="https://github.com/mhogomchungu/zuluCrypt/"
license=('GPL')
depends=('cryptsetup' 'qt4' 'libpwquality' 'libsecret' 'tcplay')
makedepends=('cmake' 'git')
provides=(${_gitname})
conflicts=(${_gitname})
optdepends=('kdeutils-kwalletmanager: retrieve volume keys from kde kwallet')
options=('!buildflags')

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

changelog=${pkgname}.changelog
install=${pkgname}.install

build() {
    cd "${_gitname}"
    msg "Making Build directory... ${_build}"
    if [[ -d "${_build}" ]]; then
        rm -Rf ${_build}
    fi
    mkdir -p ${_build}
    cd ${_build}

    cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOKDE=true -DCMAKE_BUILD_TYPE=release . ..
    make
}
 
package() {
  msg "changelog updated"
  cd "${_gitname}"
  cp changelog ../../${pkgname}.changelog
  cd "${_build}"
  make DESTDIR="$pkgdir" install
}
