# Maintainer: crl <crl18039102576@126.com>

pkgname=python-pyg-lib
_pkgname=pyg-lib
pkgver=0.5.0
pkgrel=1
pkgdesc='Low-Level Graph Neural Network Operators for PyG'
arch=('x86_64')
url='https://github.com/pyg-team/pyg-lib'
license=('MIT')
depends=(python python-torch-geometric python-pytorch)
makedepends=(python-build python-installer python-wheel
             python-setuptools cuda cmake cucollections)
_metis_commit=22008804e8c9b78893ae10a94c0d8b4b592438b4
_cutlass_commit=b78588d1630aa6643bf021613717bafb705df4ef
_parallel_hashmap_commit=2ec799017610ef831f4dc29c21fb3cce7e4a19b9
_gklib_commit=3eabb216ac97e11ce7e7a9b90f4c90778d9e7c18
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "parallel_hashmap.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/$_parallel_hashmap_commit.tar.gz"
        "METIS.tar.gz::https://github.com/KarypisLab/METIS/archive/$_metis_commit.tar.gz"
        "cutlass.tar.gz::https://github.com/NVIDIA/cutlass/archive/$_cutlass_commit.tar.gz"
        "gklib.tar.gz::https://github.com/KarypisLab/GKlib/archive/$_gklib_commit.tar.gz"
        "cmake.patch")
sha256sums=('7b1a88880bfd9bd59b5f9c1a16ff858923c26a7d6117cf0160159d163bc07b43'
            '11f42dd45abe08ad0c93d5509bfb24bc3877efdd11ce678e07b71b7d7fd74921'
            '437fc187540bd468cbbbebb034875b601c1160294bae58e0f01730da8f2ee071'
            'cbdce3a76f531fdb4c0b7c6669c9d744fb9377f96ee3876e105d6efea32a016e'
            'ef4f0a28c1fadf9475b344af6feec3cd886b2f9cafa165faf4e87d264177896a'
            '3ab4a3ec88773e99bd19da32b089398de567a92cb4223a9119df190d9181c504')

prepare() {
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cccl"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cuCollections"
    ln -sf "${srcdir}/parallel-hashmap-$_parallel_hashmap_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    ln -sf "${srcdir}/METIS-$_metis_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    ln -sf "${srcdir}/cutlass-$_cutlass_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"

    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"
    ln -sf "${srcdir}/GKlib-$_gklib_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"

    cd "${srcdir}/pyg-lib-${pkgver}"
    patch -p1 CMakeLists.txt < "${srcdir}/cmake.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
