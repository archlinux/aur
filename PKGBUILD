#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=rgepp
_pkgname=RGEpp
pkgver=r32.65b23c8
pkgrel=1
pkgdesc="Template-based C++ class library for solving renormaliztion group equations in quantum field theory"
url="https://github.com/Herren/RGEpp"
license=("MIT")
arch=('x86_64')
depends=('boost' 'eigen')
makedepends=('clang' 'cmake')

source=("git+https://github.com/Herren/RGEpp.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#cd "${srcdir}/${_pkgname}"
#patch -l -p1 < ../make.patch
#}

build () {
cd "${srcdir}/${_pkgname}"
cmake -B build
cd build
make -j all
}

package() {
mkdir -p "${pkgdir}/usr/include/rgepp/"
cd "${srcdir}/${_pkgname}/build/"  
install -Dm755 sm_example "${pkgdir}/usr/bin/sm_example"
install -Dm755 nsm_example "${pkgdir}/usr/bin/nsm_example"
install -Dm755 numssm_example "${pkgdir}/usr/bin/numssm_example"
install -Dm755 thdm_example "${pkgdir}/usr/bin/thdm_example"
install -Dm755 running_plot "${pkgdir}/usr/bin/running_plot"
install -Dm755 landau_example "${pkgdir}/usr/bin/landau_plot"
for i in include models
  do
    cd "${srcdir}/${_pkgname}/${i}"
    echo "Copying from $PWD"
    install -Dm644 *.h "${pkgdir}/usr/include/rgepp/"
done
}
