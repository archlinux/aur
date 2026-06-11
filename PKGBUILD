# Maintainer: crl <crl18039102576@126.com>

pkgname=python-pyg-lib
_pkgname=pyg-lib
pkgver=0.7.0
pkgrel=1
pkgdesc='Low-Level Graph Neural Network Operators for PyG'
arch=('x86_64')
url='https://github.com/pyg-team/pyg-lib'
license=('MIT')
depends=(python python-torch-geometric python-pytorch)
makedepends=(python-build python-installer python-wheel
             python-setuptools cuda cmake)
_metis_commit=22008804e8c9b78893ae10a94c0d8b4b592438b4
_cutlass_commit=ad7b2f5e84fcfa124cb02b91d5bd26d238c0459e
_cccl_commit=d84981c797eb186e45f883f85423df94f9ac8bf4
_cucollections_commit=8333a0beb551bc1a46314840de3c28b855564ccb
_parallel_hashmap_commit=2ec799017610ef831f4dc29c21fb3cce7e4a19b9
_gklib_commit=3eabb216ac97e11ce7e7a9b90f4c90778d9e7c18
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "parallel_hashmap.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/$_parallel_hashmap_commit.tar.gz"
        "METIS.tar.gz::https://github.com/KarypisLab/METIS/archive/$_metis_commit.tar.gz"
        "cutlass.tar.gz::https://github.com/NVIDIA/cutlass/archive/$_cutlass_commit.tar.gz"
        "gklib.tar.gz::https://github.com/KarypisLab/GKlib/archive/$_gklib_commit.tar.gz"
        "cccl.tar.gz::https://github.com/NVIDIA/cccl/archive/$_cccl_commit.tar.gz"
        "cuCollections.tar.gz::https://github.com/NVIDIA/cuCollections/archive/$_cucollections_commit.tar.gz")
sha256sums=('60bcc10ef197a4445a43af92c9700fc1e5b6570d3ecc4dfd44fa7888826c1214'
            '11f42dd45abe08ad0c93d5509bfb24bc3877efdd11ce678e07b71b7d7fd74921'
            '437fc187540bd468cbbbebb034875b601c1160294bae58e0f01730da8f2ee071'
            '36429479df2ab1cd1c7981c2d34e786106326ccfefc8846f902f76151a65e112'
            'ef4f0a28c1fadf9475b344af6feec3cd886b2f9cafa165faf4e87d264177896a'
            '40e7ada45001e816e087ce2876cfc6c840fe13d43c95e18d40d0d9eba5595c82'
            '0f19bde8f49f13e0bc55d29058ab89dbe59ee85022c043c5fd12e1100d665307')

prepare() {
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cccl"
    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/cuCollections"
    ln -sf "${srcdir}/parallel-hashmap-$_parallel_hashmap_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/parallel-hashmap"
    ln -sf "${srcdir}/METIS-$_metis_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS"
    ln -sf "${srcdir}/cutlass-$_cutlass_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/cutlass"
    ln -sf "${srcdir}/cccl-$_cccl_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/cccl"
    ln -sf "${srcdir}/cuCollections-$_cccl_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/cuCollections"

    rm -r "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"
    ln -sf "${srcdir}/GKlib-$_gklib_commit" "${srcdir}/pyg-lib-${pkgver}/third_party/METIS/GKlib"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
