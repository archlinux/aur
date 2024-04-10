# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=minetest-git-dill
pkgver=1.1
pkgrel=1
pkgdesc="Minetest from git. This version uses github and allows aur helper devel functions to work properly. Also the PKGBUILD script is much simpler."
arch=('x86_64')
url="https://github.com/minetest/minetest"
license=('GPL')
depends=(base-devel libcurl-gnutls cmake libpng sqlite libogg libvorbis openal freetype2 jsoncpp gmp luajit leveldb ncurses zstd gettext sdl2 gcc make git)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/minetest"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/minetest"
  cmake . -DCMAKE_BUILD_TYPE=Release -DRUN_IN_PLACE=FALSE -DCMAKE_INSTALL_PREFIX=/usr/share/minetest
  make -j$(( $(nproc) + 1 ))
}

package() {
  cd "${srcdir}/minetest"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /usr/share/minetest/bin/minetest "${pkgdir}/usr/bin/minetest"
}