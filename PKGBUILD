# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
name=hpmvs
pkgname=${name}-git
pkgver=r18.f003e54
pkgrel=2
pkgdesc="Progressive multiview stero, generate dense surface form  sparse 3D model."
arch=('i686' 'x86_64')
url="https://github.com/alexlocher/hpmvs"
license=('GPL')
groups=()
depends=('libjpeg' 'google-glog' 'gflags')
makedepends=('git' 'cmake' 'eigen-qfix' 'ninja')
provides=()
options=()
source=("${pkgname}::git+https://github.com/alexlocher/hpmvs.git"
        "https://openaccess.thecvf.com/content_cvpr_2016/papers/Locher_Progressive_Prioritized_Multi-View_CVPR_2016_paper.pdf"
        )
md5sums=('SKIP'
         'f5a13b2ac11fda01a29e90f93893b94d')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
