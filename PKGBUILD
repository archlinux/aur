# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avisynthplus-git
pkgname=('avisynthplus-git'
         'avisynthplus-docs-git'
         )
pkgver=v3.7.0.69.gc54a3272
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
source=('avisynthplus::git+https://github.com/AviSynth/AviSynthPlus.git'
        'https://patch-diff.githubusercontent.com/raw/AviSynth/AviSynthPlus/pull/227.diff'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd avisynthplus
  echo $(git describe --long --tags | tr - .)
}

prepare() {
  mkdir -p build

  patch -d avisynthplus -p1 -i "${srcdir}/227.diff"

  mkdir -p avisynthplus/distrib/docs/english/source/_static
}

build() {
  cd build
  cmake ../avisynthplus \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make

  make -C "${srcdir}/avisynthplus/distrib/docs/english" html # man
}

package_avisynthplus-git() {
  depends=('devil')
  provides=('avisynthplus')
  conflicts=('avisynthplus')

  make -C build DESTDIR="${pkgdir}" install

  #install -Dm644 avisynthplus/distrib/docs/english/build/man/avisynth.1 "${pkgdir}/usr/share/man/man1/avisynth.1"

  (cd avisynthplus/distrib/Examples; find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/avisynth/Examples/{}" \;)
}

package_avisynthplus-docs-git() {
  pkgdesc='AviSynth+ Documentation'
  arch=('any')

  (cd avisynthplus/distrib/docs/english/build/html; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/${i}"; done)
}
