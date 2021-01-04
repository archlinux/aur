# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
name=hpmvs
pkgname=${name}-git
pkgver=r18.f003e54
pkgrel=3
pkgdesc="Progressive multiview stero, generate dense surface form  sparse 3D model."
arch=('i686' 'x86_64')
url="https://github.com/alexlocher/hpmvs"
license=('GPL')
groups=()
depends=('libjpeg' 'google-glog' 'gflags' 'nlopt>=2.4.2')
makedepends=('git' 'cmake' 'eigen' 'ninja')
provides=()
options=()
source=("${pkgname}::git+https://github.com/alexlocher/hpmvs.git"
        "https://openaccess.thecvf.com/content_cvpr_2016/papers/Locher_Progressive_Prioritized_Multi-View_CVPR_2016_paper.pdf"
        "external_nlopt.patch"
        )
sha256sums=('SKIP'
            '3c760202058a0bc78d12b53ed535c94b2d5e44765c0b1b15208fb7dcee935df3'
            '3067ac77cb8d5fcb9bd7871918701325b5e51b731c929e52966bf988a52ee06b')
b2sums=('SKIP'
        'e630f1f418264d8a4a93b8ff72e4751e777b8a6094f53b0b1477e4a048b2cf9024f45c138047a6635509e63e38d6b2b291eb9e16f00b58ef3bcb4795fd6258fd'
        '3f551f68ec7905e7e07331c540b7c4dac14fcdbb42290401b89624fa37725f0043881561986e16ebc37dcfed6838236c3cb7903bdab4736ebe4151fda531a0cf')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C "$srcdir/$pkgname" apply -v "$srcdir"/external_nlopt.patch
}

build() {
  cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S ${pkgname} -B build -G Ninja
# shellcheck disable=SC2086 # allow expanding MAKEFLAGS
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  # install introduction paper in doc
  msg "install introduction paper in doc folder"
  install -Dm644 Locher_Progressive_Prioritized_Multi-View_CVPR_2016_paper.pdf -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
