# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
# shellcheck disable=SC2010,SC2016
pkgname=minc-toolkit-v2
pkgver=1.9.18.2
pkgrel=1
pkgdesc="Medical Imaging NetCDF Toolkit"
arch=('x86_64')
url="https://www.mcgill.ca/bic/software/minc"
license=('GPL3')
depends=(
    'ants'
    'blas'
    'cblas'
    'elastix'
    'flex'
    'fftw'
    'glu'
    'glut'
    'gsl'
    'hdf5'
    'insight-toolkit4'
    'lapacke'
    'libgl'
    'libjpeg-turbo'
    'libxi'
    'libxmu'
    'netcdf'
    'nifticlib'
    'openjpeg2'
    'pcre'
    'perl'
    'zlib'
)
makedepends=(
    'bc'
    'cmake'
    'gcc-fortran'
    'git'
)
provides=('minc-toolkit')
source=("git+https://github.com/BIC-MNI/minc-toolkit-v2.git#tag=release-${pkgver}"
        'FindNIFTI.patch')
sha256sums=('SKIP'
            'bfff8b8b72c7ac39bc457709d482bb205d94c1303304ae15fd3a3299bc087b2a')

_itk=$(ls /opt/insight-toolkit4/lib/cmake | grep -m1 ITK)
_install_prefix="/usr/share/minc"

prepare() {

    # Ensure that the required ITK modules are present
    if [ "$(ls "/opt/insight-toolkit4/include/$_itk" | grep 'itkMINCImageIO.h')" == "" ];
    then
        error "ITK must be built with -DModule_ITKIOMINC:BOOL=ON"
        exit 1
    fi
    if [ "$(ls "/opt/insight-toolkit4/include/$_itk" | grep 'itkMINCTransformAdapter.h')" == "" ];
    then
        error "ITK must be built with -DModule_ITKIOTransformMINC:BOOL=ON"
        exit 1
    fi

    cd "$srcdir/$pkgname"
    git submodule update --init --recursive

    # Find system NIFTI in the right place
    sed -i \
        's/FIND_PACKAGE(NIFTI OPTIONAL)/FIND_PACKAGE(NIFTI REQUIRED)/' \
        CMakeLists.txt
    patch -p0 -i "${srcdir}"/FindNIFTI.patch

    # Fix missing libminc in patch_morphology
    sed -i \
        -e '5iINCLUDE_DIRECTORIES(${LIBMINC_INCLUDE_DIRS})' \
        -e '6iLINK_DIRECTORIES(${LIBMINC_LIBRARY_DIRS})' \
        patch_morphology/legacy/CMakeLists.txt

    # Fix missing references to libsz, libcblas and liblapacke
    sed -i \
        -e '404iSET(LIBMINC_LIBRARIES ${LIBMINC_LIBRARIES} sz)' \
        libminc/CMakeLists.txt
    sed -i \
        -e '1iSET(ITK_LIBRARIES ${ITK_LIBRARIES} cblas lapacke)' \
        patch_morphology/src/CMakeLists.txt

    # The C++ compiler won't like this
    sed -i \
        's/enum {false=0, true=1};//' \
        minctools/progs/mincdump/mincdump.h

    rm -rf build
    mkdir build
    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE:STRING=Release   \
        -DCMAKE_INSTALL_PREFIX:PATH="${_install_prefix}" \
        -DCMAKE_CXX_FLAGS='-fdiagnostics-color=always' \
        -DCMAKE_C_FLAGS='-fdiagnostics-color=always' \
        -DLIBMINC_USE_SYSTEM_NIFTI:BOOL=ON \
        -DMT_BUILD_ABC:BOOL=ON   \
        -DMT_BUILD_ANTS:BOOL=OFF   \
        -DMT_BUILD_C3D:BOOL=ON   \
        -DMT_BUILD_ELASTIX:BOOL=OFF   \
        -DMT_BUILD_IM:BOOL=OFF   \
        -DMT_BUILD_ITK_TOOLS:BOOL=ON   \
        -DMT_BUILD_LITE:BOOL=OFF   \
        -DMT_BUILD_SHARED_LIBS:BOOL=ON   \
        -DMT_BUILD_VISUAL_TOOLS:BOOL=ON   \
        -DMT_USE_OPENMP:BOOL=ON   \
        -DUSE_SYSTEM_ANTS:BOOL=ON   \
        -DUSE_SYSTEM_ELASTIX:BOOL=ON   \
        -DUSE_SYSTEM_FFTW3D:BOOL=ON   \
        -DUSE_SYSTEM_FFTW3F:BOOL=ON   \
        -DUSE_SYSTEM_GLUT:BOOL=ON   \
        -DUSE_SYSTEM_GSL:BOOL=ON   \
        -DUSE_SYSTEM_HDF5:BOOL=ON   \
        -DUSE_SYSTEM_ITK:BOOL=ON   \
        -DUSE_SYSTEM_JPEG:BOOL=ON \
        -DUSE_SYSTEM_NETCDF:BOOL=ON   \
        -DUSE_SYSTEM_NIFTI:BOOL=ON   \
        -DUSE_SYSTEM_OPENJPEG:BOOL=ON \
        -DUSE_SYSTEM_PCRE:BOOL=ON   \
        -DUSE_SYSTEM_ZLIB:BOOL=ON \
        -DITK_DIR:PATH=/opt/insight-toolkit4/lib/cmake/"$_itk"
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

package() {
    cd "$srcdir/$pkgname/build"

    make install DESTDIR="${pkgdir}"

    cd "${pkgdir}${_install_prefix}"
    rm -rf minc-toolkit-config*

    mkdir -p "$pkgdir"/usr/share/bash-completion/completions
    mv share/bashcomp.sh "$pkgdir"/usr/share/bash-completion/completions/c3d
    mv bin "$pkgdir"/usr/bin
    mv include "$pkgdir"/usr/include
    mv lib "$pkgdir"/usr/lib
    mv man "$pkgdir"/usr/share/man
}

