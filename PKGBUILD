# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=planner9-git
pkgver=20111207
pkgrel=1
pkgdesc="A distributed hierarchical task network planner."
arch=('i686' 'x86_64')
url="https://gitorious.org/planner9"
license=('custom')
depends=('boost-libs')
makedepends=('git' 'boost')
optdepends=('qt4')
provides=('planner9')
conflicts=('planner9')

_gitroot="https://gitorious.org/planner9/planner9.git"
_gitname="planner9"
_gitbranch="master"


build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone -b ${_gitbranch} ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  
  cd "${srcdir}/${_gitname}-build/"

  # The boost thread library depends on the system library
  sed "s/Boost REQUIRED thread/Boost REQUIRED thread system/g" -i CMakeLists.txt
  sed "s/Boost_THREAD_LIBRARY/Boost_LIBRARIES/g" -i programs/CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=On .
  make  
}

package() {
  install -dm755 "${pkgdir}"/usr/{bin,lib,include/planner9/{core,distributed,threaded}}

  cd "${srcdir}/${_gitname}-build/core"
  install -Dm644 *.hpp "${pkgdir}/usr/include/planner9/core"
  install -Dm644 libplanner9core.so "${pkgdir}/usr/lib"

  cd "${srcdir}/${_gitname}-build/distributed"
  install -Dm644 *.h "${pkgdir}/usr/include/planner9/distributed"
  install -Dm644 *.hpp "${pkgdir}/usr/include/planner9/distributed"
  install -Dm644 libplanner9distributed.so "${pkgdir}/usr/lib"

  cd "${srcdir}/${_gitname}-build/threaded"
  install -Dm644 *.hpp "${pkgdir}/usr/include/planner9/threaded"
  install -Dm644 libplanner9threaded.so "${pkgdir}/usr/lib"
  

  cd "${srcdir}/${_gitname}-build/programs"
  install -Dm755 p9client p9distributed p9simple p9simpleproba p9threaded "${pkgdir}/usr/bin"
}
