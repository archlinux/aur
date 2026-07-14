# Maintainer: Aida van de Wetering <aida@osphire.com>
pkgname=su2-mpi-bin
pkgver=8.5.0
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design. Binary package with parallel processing enabled."
url="https://su2code.github.io/"
license=(LGPL-2.1-or-later)
arch=('x86_64')
# prebuilt binaries have debugging info in them, which we probably will not use.
# Removing this option makes pacman install 2 packages, one with -debug suffix.
options=('!debug')
depends=(
    python
    python-numpy
    # The documentation implies that you can use 'any MPI implementation'.
    # https://su2code.github.io/docs_v7/Installation/
    # OpenMPI is more readily available in the Arch ecosystem (MPICH requires another AUR package),
    # so we use that.
    openmpi
)
conflicts=('su2')
source=(
    "https://github.com/su2code/SU2/releases/download/v${pkgver}/SU2-v${pkgver}-linux64-mpi.zip"
    "su2-cfd"
    "su2-def"
    "su2-sol"
    "su2-dot"
    "su2-gdc"
    "su2-msh"
)
sha256sums=('ff4381fd00e9984dd6fe2974ca4fdcd5c41a3d8edd4b710cb3964668c8069e60'
    '39dbd235ccd81186ddd77f1525496e6cba10b02992e2ac7b13c471744f222481'
    'be74f42479762ec8c0245ee0ca8e4bf5c752a8629722be7986d4b15397d9dd68'
    '980bd5d6cf470894d4e95881e51621cf50d89afa6ef39e4629d3d370d9340099'
    'efb1933ebfeecf28d22eefa6c297432b46f4f5603ec5c031df89392466bd9281'
    'ae58249e5054e8dd6a522185b234e6431396ffa582916f94f66a92c0df667153'
    'aa7d16d09d9e90d9141fae027d5c524d69263e466a237eaa5d00e924e21a5a92')

prepare() {
    cd "${srcdir}"

    # For some reason, the binary build is in a nested zip file.
    mkdir extracted
    bsdtar -xf linux64-mpi.zip -C extracted
    mv extracted/bin su2
}

package() {
    cd "${srcdir}"
    # create /opt/ in case it does not exist
    install -dm755 "${pkgdir}/opt"
    cp -a su2 "${pkgdir}/opt/su2"

    # Install the wrapper scripts with env vars set.
    install -Dm755 su2-cfd "${pkgdir}/usr/bin/su2-cfd"
    install -Dm755 su2-def "${pkgdir}/usr/bin/su2-def"
    install -Dm755 su2-sol "${pkgdir}/usr/bin/su2-sol"
    install -Dm755 su2-dot "${pkgdir}/usr/bin/su2-dot"
    install -Dm755 su2-gdc "${pkgdir}/usr/bin/su2-gdc"
    install -Dm755 su2-msh "${pkgdir}/usr/bin/su2-msh"

    # all-caps version for compatibility with the SU2 docs.
    ln -s su2-cfd "${pkgdir}/usr/bin/SU2_CFD"
    ln -s su2-def "${pkgdir}/usr/bin/SU2_DEF"
    ln -s su2-sol "${pkgdir}/usr/bin/SU2_SOL"
    ln -s su2-dot "${pkgdir}/usr/bin/SU2_DOT"
    ln -s su2-gdc "${pkgdir}/usr/bin/SU2_GDC"
    ln -s su2-msh "${pkgdir}/usr/bin/SU2_MSH"
}
