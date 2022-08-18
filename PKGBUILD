# Maintainer: WoofinaS <woofina.s.love@gmail.com>

pkgname=vapoursynth-plugin-bm3dcuda-cpu-git
pkgver=2.10.1.g6ce6828
pkgrel=1
pkgdesc="Plugin for Vapoursynth: bm3dcuda-cpu (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BM3DCUDA'
license=('GPL')
depends=('vapoursynth')
makedepends=('git' 'cmake')
provides=('vapoursynth-plugin-bm3dcuda-cpu')
conflicts=('vapoursynth-plugin-bm3dcuda' 'vapoursynth-plugin-bm3dcuda-git')
source=('bm3dcuda::git+https://github.com/WolframRhodium/VapourSynth-BM3DCUDA.git')
sha256sums=('SKIP')
options=('!strip' 'debug')

pkgver() {
  cd "bm3dcuda"
  echo "$(git describe --long --tags | tr - . | tr -d R)"
}

build() {
  cd "bm3dcuda"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib/vapoursynth \
    -DCMAKE_SKIP_RPATH=ON \
    -DVAPOURSYNTH_INCLUDE_DIRECTORY="$(pkg-config --cflags vapoursynth | sed 's|-I||g')" \
    -DENABLE_CUDA=0
  make -C build
}

package() {
  cd "bm3dcuda"
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/bm3dcuda/README.md"
}
