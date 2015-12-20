# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.0.6.r279.8a21e0f
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=('x86_64')
url='https://github.com/DHrpcs3/rpcs3'
license=('GPL2')
depends=('gcc-libs' 'glew' 'glibc' 'libgl' 'libx11' 'openal' 'wxgtk'
         'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so')
makedepends=('asmjit-git' 'cmake' 'git')
provides=('rpcs3')
conflicts=('rpcs3')
source=('git+https://github.com/DHrpcs3/rpcs3.git'
        'rpcs3-system-libs.patch')
sha256sums=('SKIP'
            'dea43bf8c143753fb9985c2f0d9921daec025876b21817e98e3e5ddc875887e9')

pkgver() {
  cd rpcs3

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd rpcs3

  patch -Np1 -i ../rpcs3-system-libs.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd rpcs3/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make
}

package() {
  cd rpcs3/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 bin/rpcs3 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
