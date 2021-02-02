#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=rgepp
_pkgname=RGEpp
pkgver=r24.1d9b740
pkgrel=1
pkgdesc="Template-based C++ class library for solving renormaliztion group equations in quantum field theory"
url="www.github.com/Herren/RGEpp"
license=("MIT")
arch=('x86_64')
depends=('boost' 'eigen')
makedepends=('clang')

source=("git://github.com/Herren/RGEpp.git"
"make.patch")
md5sums=("SKIP"
"SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd "${srcdir}/${_pkgname}"
patch -l -p1 < ../make.patch
}

build () {
cd "${srcdir}/${_pkgname}"
make
make sm_example
make nsm_example
make numssm_example
make thdm_example
make running_plot
}

package() {
mkdir -p "${pkgdir}/usr/include/rgepp/"
cd "${srcdir}/${_pkgname}/examples"
install -Dm755 sm_example "${pkgdir}/usr/bin/sm_example"
install -Dm755 nsm_example "${pkgdir}/usr/bin/nsm_example"
install -Dm755 numssm_example "${pkgdir}/usr/bin/numssm_example"
install -Dm755 thdm_example "${pkgdir}/usr/bin/thdm_example"
install -Dm755 running_plot "${pkgdir}/usr/bin/running_plot"
for i in include models
  do
    cd "${srcdir}/${_pkgname}/${i}"
    echo "Copying from $PWD"
    install -Dm644 *.h "${pkgdir}/usr/include/rgepp/"
done
}