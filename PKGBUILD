# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=apbs
pkgver=3.0.0
pkgrel=1
pkgdesc="Software for biomolecular electrostatics and solvation calculations"
arch=(x86_64)
url="http://www.poissonboltzmann.org/"
license=(custom)
depends=(python boost eigen termcap swig)
makedepends=('cmake>=3.12' make git wget)
provides=(apbs)
conflicts=(apbs-bin)
source=("https://github.com/Electrostatics/apbs/releases/download/v3.0.0/APBS-3.0.0_Source-Code.tar.gz"
        "globals_apbs.patch"
        "globals_bem.patch")
sha256sums=('3cf8b227a205cdcbd13246489427606f256f2356343fc954734fd39975e5cbdb'
            '6bc1f2dc7a454aa8b0799641f78ee571ba04795821a9bcac356cbe496bdb3df6'
            '3d8cc3d052a60a36d79ab95b8c89c03d79bdcca9958c2936513d92c23acb097b')
options=(!makeflags !buildflags)

prepare() {
    # patch APBS building issues
    cd "${srcdir}/${pkgname}-${pkgver}/apbs"
    patch -Np0 -i "${srcdir}/globals_apbs.patch"

    # get external modules
    cd "${srcdir}/${pkgname}-${pkgver}/apbs/externals"

    # mesh_routines
    mkdir -p mesh_routines/NanoShaper/Linux64
    mkdir -p mesh_routines/msms/msms_i86_64Linux2_2.6.1
    wget https://github.com/lwwilson1/mesh_routines/releases/download/v1.5/NanoShaper_Linux64 -O mesh_routines/NanoShaper/Linux64/NanoShaper
    wget https://github.com/lwwilson1/mesh_routines/releases/download/v1.5/msms.x86_64Linux2.2.6.1.staticgcc -O mesh_routines/msms/msms_i86_64Linux2_2.6.1/msms.x86_64Linux2.2.6.1.staticgcc

    # PBAM/PBSAM
    git clone https://github.com/Electrostatics/pb_solvers.git pb_s_am
    cd pb_s_am
    git checkout 7ca2a8a491c0cf746074053005fcae026acc4da5
    cd ..

    # FETK
    git clone https://github.com/Electrostatics/FETK.git fetk
    cd fetk
    git checkout 0c6fdeabe8929acea7481cb1480b5706b343b7e0
    cd ..

    # Geometric Flow
    git clone https://github.com/Electrostatics/geoflow_c.git geoflow_c
    cd geoflow_c
    git checkout 99446ec841647419411d23bad632d50405913a06
    cd ..

    # TABI-PB (BEM)
    git clone https://github.com/Electrostatics/TABIPB.git bem
    cd bem
    git checkout de187a41720887d667edcfb6c23bb61fbbe06b5b

    # patch BEM building issues
    patch -Np0 -i "${srcdir}/globals_bem.patch"
    cd ..
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/apbs"

    mkdir build
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_GEOFLOW=ON \
        -DENABLE_BEM=ON \
        -DENABLE_FETK=ON \
        -DENABLE_OPENMP=ON \
        -DENABLE_PBAM=ON \
        -DENABLE_PBSAM=ON \
        -DENABLE_PYTHON=ON \
        -DENABLE_TESTS=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_DOC=OFF \
        -Wno-dev \
        ..

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/apbs/build"

    # install base components
    make DESTDIR="$pkgdir" install

    # install license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apbs/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # cleanup conflicting symlinks
    cd "${pkgdir}/usr/lib"

    rm -f libamd.so libblas.so libsuperlu.so libumfpack.so
}
