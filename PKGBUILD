# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=cendric-git
_gitname=Cendric2
pkgver=1.1.3.r18.g5b0438c7
pkgrel=2
pkgdesc='RPG game of a boy with no memory who discovers the magical world of Admantris.'
url='https://github.com/tizian/Cendric2'
license=('MIT' 'CCPL:by-sa')
arch=('x86_64' 'i686' 'aarch64')
makedepends=('git' 'cmake')
depends=('sfml')
provides=("cendnric")
conflicts=("cendric")
source=("git+https://github.com/tizian/${_gitname}.git" 'cendric.desktop')
md5sums=('SKIP' '826f54010dd9654e6ed76635ba923ef7')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  git submodule update --init --recursive

  # Use latest sfml v2
  (
    cd ext/sfml
    git checkout 2.6.2
  )

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSFML_USE_SYSTEM_DEPS=ON \
    -DUSE_SYSTEM_SFML=0 \
    -DCENDRIC_EXTERNAL_DOCUMENT_FOLDER=ON \
    -DUSE_SYSTEM_PATHS=ON
}

build() {
  cd "${srcdir}/${_gitname}"

  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/bin/Cendric "${pkgdir}"/usr/share/Cendric/

  cp ext/sfml/lib/libsfml-* "${pkgdir}"/usr/share/Cendric/

  install -d "${pkgdir}"/usr/share/applications
  cp "${srcdir}"/cendric.desktop "${pkgdir}"/usr/share/applications/

  install -dm 0777 "${pkgdir}"/usr/share/Cendric/saves

  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/Cendric
  echo "cd /usr/share/Cendric" >> "${pkgdir}"/usr/bin/Cendric
  echo 'LD_LIBRARY_PATH=/usr/share/Cendric:$LD_LIBRARY_PATH ./Cendric' >> "${pkgdir}"/usr/bin/Cendric

  chmod 0755 "${pkgdir}"/usr/bin/Cendric
}
