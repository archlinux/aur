# Maintainer: Electric Prism <electricprism@gmail.com>
# Contributor: Electric Prism <electricprism@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ges-git
pkgver=r149.c6bd265
pkgrel=1
pkgdesc=" (WIP!) Multiplayer Only FPS. A recreation of GoldenEye64 as a Half-Life 2 mod using Source Engine SDK 2013."
arch=('i686')
url="https://www.geshl2.com/"
license=('GPLv3')
makedepends=('cmake' 'boost-libs' 'boost' 'git' 'gcc' 'glibc' 'libstdc++5')
source=('ges-git::git+https://github.com/goldeneye-source/ges-code.git'
	'python::git+https://github.com/python-cmake-buildsystem/python-cmake-buildsystem.git')
sha256sums=('SKIP'
	    'SKIP')
provides=('ges-git')
conflicts=('ges')

pkgver() {

  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
prepare()
{

  # Enter Package Source
  cd "${pkgname}"

  # Init submodules
  git submodule init thirdparty/python
  git config submodule.python.url ../python
  git submodule update thirdparty/python

  # Setup build environment
  if [[ -d build ]]; then
  	rm -rf build
  fi

  mkdir build

}

build()
{

  cd "${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=${HOME}/.local/share/Steam/steamapps/sourcemods/gesource ..
  make
  make DESTDIR="${pkgdir}" install

}

package()
{

  # TODO
  cd "${srcdir}/${pkgname}/build"
  install -m 755 client.so "${pkgdir}"/usr/bin/
  install -m 755 server.so "${pkgdir}"/usr/bin/

}
