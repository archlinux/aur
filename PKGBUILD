# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=minetestmapper-git
pkgver=6e30d47
pkgrel=1
pkgdesc="Minetest map generator"
arch=('i686' 'x86_64')
url="http://wiki.minetest.net/Minetestmapper"
license=('LGPL')
depends=('gd' 'leveldb' 'sqlite' 'zlib')
makedepends=('cmake' 'git')
provides=('minetestmapper')
_gitname="minetestmapper"
source=(git://github.com/minetest/minetestmapper.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  cmake . -DENABLE_LEVELDB=1 -DCMAKE_INSTALL_PREFIX="/usr/share/${_gitname}"
  make
}

package() {
  cd ${_gitname}
  # hack: colors.txt is expected to be in the same folder as the executable
  install -Dm755 "${_gitname}" "${pkgdir}/usr/share/${_gitname}/${_gitname}"
  install -Dm644 "colors.txt" "${pkgdir}/usr/share/${_gitname}/colors.txt"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_gitname}/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
}
