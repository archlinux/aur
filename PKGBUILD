# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avisynthplus-git
pkgname=('avisynthplus-git'
         'avisynthplus-docs-git'
         )
pkgver=3.7.2.188.g25601720
pkgrel=1
pkgdesc='Avisynth+. (GIT Version)'
arch=('x86_64')
url='http://avs-plus.net'
license=('GPL')
makedepends=('git'
             'cmake'
             'python-sphinx'
             'devil'
             )
source=('avisynthplus::git+https://github.com/AviSynth/AviSynthPlus.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd avisynthplus
  echo $(git describe --long --tags | tr - . | tr -d v)
}

prepare() {
  mkdir -p avisynthplus/distrib/docs/english/source/_static
}

build() {
  cmake -S avisynthplus -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_CUDA=OFF

  cmake --build build

  make -C "${srcdir}/avisynthplus/distrib/docs/english" html # man
}

package_avisynthplus-git() {
  depends=('devil')
  provides=('avisynthplus'
            'libavisynth.so'
            )
  conflicts=('avisynthplus')

  DESTDIR="${pkgdir}" cmake --build build --target install

  #install -Dm644 avisynthplus/distrib/docs/english/build/man/avisynth.1 "${pkgdir}/usr/share/man/man1/avisynth.1"

  (cd avisynthplus/distrib/Examples; find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/avisynth/Examples/{}" \;)
}

package_avisynthplus-docs-git() {
  pkgdesc='AviSynth+ Documentation. (GIT Version)'
  arch=('any')

  (cd avisynthplus/distrib/docs/english/build/html; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/${i}"; done)
}
