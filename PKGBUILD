# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avisynthplus-git
pkgname=(
  'avisynthplus-git'
  'avisynthplus-docs-git'
)
pkgver=3.7.3.8.geba18dca
pkgrel=1
pkgdesc='Avisynth+. (GIT Version)'
arch=('x86_64')
url='http://avs-plus.net'
license=('GPL')
makedepends=(
  'git'
  'cmake'
  'python-sphinx'
  'devil'
)
source=('git+https://github.com/AviSynth/AviSynthPlus.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd AviSynthPlus
  echo $(git describe --long --tags | tr - . | tr -d v)
}

prepare() {
  mkdir -p AviSynthPlus/distrib/docs/english/source/_static
}

build() {
  cmake -S AviSynthPlus -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_CUDA=OFF

  cmake --build build

  make -C "${srcdir}/AviSynthPlus/distrib/docs/english" html # man
}

package_avisynthplus-git() {
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so libm.so
    'devil' # libIL.so
  )
  provides=(
    'avisynthplus'
    'libavisynth.so'
  )
  conflicts=('avisynthplus')

  DESTDIR="${pkgdir}" cmake --build build --target install

  #install -Dm644 AviSynthPlus/distrib/docs/english/build/man/avisynth.1 "${pkgdir}/usr/share/man/man1/avisynth.1"

  (cd AviSynthPlus/distrib/Examples; find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/avisynth/Examples/{}" \;)
}

package_avisynthplus-docs-git() {
  pkgdesc='AviSynth+ Documentation. (GIT Version)'
  arch=('any')

  (cd AviSynthPlus/distrib/docs/english/build/html; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/${i}"; done)
}
