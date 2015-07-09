# Maintainer: Jan Lieven <echo amFuK2F1ckBkYXMtbGFib3Iub3JnCg== | base64 -d>
pkgname=rp++-git
pkgver=20120818
pkgrel=1
pkgdesc="Find ROP gadgets in PE/ELF/MACH-O x86/x64 binaries."
arch=('i686' 'x86_64')
url="https://github.com/0vercl0k/rp"
license=('GPL')
depends=()
makedepends=('git' 'cmake')

_gitroot=git://github.com/0vercl0k/rp.git
_gitname="rp++"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [[ -d ${_gitname} ]]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  sed -i 's/-static//g' CMakeLists.txt

  cd build
  cmake ..
  make
}

package() {
  install -d ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${_gitname}-build/bin/rp* ${pkgdir}/usr/bin/rp
  rm -rf ${srcdir}/${_gitname}-build
}

# vim:set ts=2 sw=2 et:
