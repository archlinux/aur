# Maintainer: crl <crl18039102576@126.com>

pkgname=python-pyg-lib
_pkgname=pyg-lib
pkgver=0.4.0
pkgrel=1
pkgdesc='Low-Level Graph Neural Network Operators for PyG'
arch=('x86_64')
url='https://github.com/pyg-team/pyg-lib'
license=('MIT')
depends=(python python-torch-geometric python-pytorch)
makedepends=(python-build python-installer python-wheel
             python-setuptools cuda cmake)
_metis_commit=22008804e8c9b78893ae10a94c0d8b4b592438b4
_cutlass_commit=6f47420213f757831fae65c686aa471749fa8d60
_parallel_hashmap_commit=01ea8093e6d0293ea252e8027c17d7dff26a9c9f
_gklib_commit=3eabb216ac97e11ce7e7a9b90f4c90778d9e7c18
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "parallel_hashmap.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/$_parallel_hashmap_commit.tar.gz"
        "METIS.tar.gz::https://github.com/KarypisLab/METIS/archive/$_metis_commit.tar.gz"
        "cutlass.tar.gz::https://github.com/NVIDIA/cutlass/archive/$_cutlass_commit.tar.gz"
        "gklib.tar.gz::https://github.com/KarypisLab/GKlib/archive/$_gklib_commit.tar.gz")
sha256sums=('6a515815f69f925a0ba15e743ac071629e1fd1ae9c46576db8b7f91ab40a8eac'
            'b18bd20bacc812ea5b41aed3e2c3e05cc5d99f42d60cd9e30250d5105c84dcbf'
            '437fc187540bd468cbbbebb034875b601c1160294bae58e0f01730da8f2ee071'
            'c0570c36023d8290085bc8fed5170a887ff2c1c8791889df770100d448a8f66d'
            'ef4f0a28c1fadf9475b344af6feec3cd886b2f9cafa165faf4e87d264177896a')

prepare() {
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"
    ln -sf "${srcdir}/parallel-hashmap-$_parallel_hashmap_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    ln -sf "${srcdir}/METIS-$_metis_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    ln -sf "${srcdir}/cutlass-$_cutlass_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"
    ln -sf "${srcdir}/GKlib-$_gklib_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export USE_MKL_BLAS=1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
