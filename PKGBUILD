# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=iceoryx-git
pkgver=2.90.0.r7412.d5be6d829
pkgrel=1
pkgdesc="True zero-copy inter-process-communication"
arch=(x86_64)
url="https://github.com/eclipse-iceoryx/iceoryx"
license=('Apache-2.0')
depends=('acl' 'ncurses')
makedepends=('ninja' 'cmake' 'pkg-config' 'git')
source=("${pkgname}::git+https://github.com/eclipse-iceoryx/iceoryx.git")
sha512sums=('SKIP')
provides=('iceoryx')
conflicts=('iceoryx')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(cat VERSION)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  cmake -Bbuild -Hiceoryx_meta \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DBINDING_C=ON \
        -DEXAMPLES=OFF \
        -DBUILD_TEST=OFF \
        -DINTROSPECTION=OFF \
        -DOUT_OF_TREE=ON \
        -DMAKE_UNIQUE_INCLUDEDIR=OFF

  cmake --build build --parallel $_cpuCount
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
