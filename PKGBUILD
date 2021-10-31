# Maintainer: Georgiy Komarov <jubnzv@gmail.com>

pkgname=qtask-git
pkgver=0.1
pkgrel=1
pkgdesc="An open-source organizer based on Taskwarrior"
arch=(x86_64 aarch64)
url="https://github.com/jubnzv/qtask"
license=('MIT')
depends=('task')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'make' 'qt5-base')
source=("${pkgname}::git+https://github.com/jubnzv/qtask.git")
sha512sums=('SKIP')
provides=('qtask')
conflicts=('qtask')
options=(!strip)

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  cmake -S"${pkgname}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel $_cpuCount
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
