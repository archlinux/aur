# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=petsc-git
pkgver=20201016
pkgrel=1
_config=linux-c-opt
pkgdesc="Portable, extensible toolkit for scientific computation (external downloads enabled)"
provides=(petsc)
conflicts=(petsc)
arch=('i686' 'x86_64')
url="https://gitlab.com/petsc/petsc"
license=('BSD')
depends=('openmpi' 'lapack' 'fftw' 'hdf5' 'suitesparse')
makedepends=('gcc' 'gcc-fortran' 'cmake' 'sowing' 'python')
optdepends=("opencl: GPU computing"
            "hwloc: hardware locality"
            "cgns: CFD data support"
            "libpng: PNG support"
            "libyaml: YAML configuration support"
            "libx11: GUI tools"
            "python: Tools, examples, tutorials")
install=petsc.install
source=(petsc::git+https://gitlab.com/petsc/petsc.git#branch=release)
sha256sums=('SKIP')

_petsc_arch="arch-${_config}"

generic_flags="-fPIC -fopenmp -O3 -march=x86-64 -mtune=generic"
# generic_flags="-fPIC -fopenmp -O3 -march=amdfam10 -mtune=generic"

export COPTFLAGS=-O3
export CXXOPTFLAGS=-O3
export FOPTFLAGS=-O3
export CPPFLAGS="$generic_flags -O2 -D-FORTIFY-SOURCE=2"
export CFLAGS="$generic_flags"
export CXXFLAGS="$generic_flags"
export FFLAGS="$generic_flags"
export FCFLAGS="$generic_flags"
export F90FLAGS="$generic_flags"
export F77FLAGS="$generic_flags"


pkgver() {
    cd petsc
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}


prepare() {
    cd "${srcdir}/petsc"
    sed -i 's-\(self.publicInstall[^=]*=[[:space:]]\)[^#]*-\10 -g' config/BuildSystem/config/package.py
}


build() {
    cd petsc

    declare -a CONFOPTS
    CONFOPTS=(
      --COPTFLAGS="$COPTFLAGS"
      --CXXOPTFLAGS="$CXXOPTFLAGS"
      --CPPFLAGS="$CPPFLAGS"
      --CFLAGS="$CFLAGS"
      --CXXFLAGS="$CXXFLAGS"
      --FFLAGS="$FFLAGS"
      --FCFLAGS="$FCFLAGS"
      --F90FLAGS="$F90FLAGS"
      --F77FLAGS="$F77FLAGS"

      --with-cxx-dialect=C++11
      --with-mpi=1
      --with-pic=1
      --with-shared-libraries=1
      --with-zlib=1

      --with-fftw=1
      --with-hdf5=1
      --with-suitesparse=1

      --with-scalar-type=complex

      --download-amd=1
      --download-eigen=1
      --download-hypre=1
      --download-metis=1
      --download-mumps=1
      --download-parmetis=1
      --download-ptscotch=1
      --download-scalapack=1
      --download-superlu=1
      --download-superlu_dist=1
    )

    CONFOPTS=( "${CONFOPTS[@]}" )

    # Add OpenCL support
    OPENCL_DIR="/usr/include/CL/"
    if [ -f "${OPENCL_DIR}/cl.h" ]; then
        CONFOPTS="${CONFOPTS} --with-opencl=1"
    fi

    # Add hwloc support
    if [ -f "/usr/lib/libhwloc.so" ]; then
        CONFOPTS="${CONFOPTS} --with-hwloc=1 --with-hwloc-pkg-config=/usr/lib/pkgconfig/"
    fi

    # Add CGNS support
    if [ -f "/usr/lib/libcgns.so" ]; then
        CONFOPTS="${CONFOPTS} --with-cgns=1"
    fi

    # Add PNG support
    if [ -f "/usr/lib/libpng.so" ]; then
        CONFOPTS="${CONFOPTS} --with-png=1 --with-png-pkg-config=/usr/lib/pkgconfig/"
    fi

    # Add YAML support
    if [ -f "/usr/lib/libyaml.so" ]; then
        CONFOPTS="${CONFOPTS} --with-yaml=1 --with-yaml-pkg-config=/usr/lib/pkgconfig/"
    fi

    # if --with-debugging=1 is set then PETSC_ARCH is automatically set to
    # "linux-c-debug" for some things, so _config should be changed to "linux-c-debug"
    #CONFOPTS="${CONFOPTS} --with-debugging=1"

    dirpkg=${srcdir}/petsc/${_petsc_arch}/externalpackages/

    export PETSC_DIR="${srcdir}/petsc"
    export PETSC_ARCH="${_petsc_arch}"

    python ./configure LDFLAGS="$LDFLAGS" \
           --prefix=/usr/petsc/${_config} \
           --MAKEFLAGS="$MAKEFLAGS" \
           $(for (( i=1; i<=${#CONFOPTS[@]}; i++)); do echo "${CONFOPTS[$i]}"; done)
    make clean
    make all
}

package() {
    cd petsc

    _build_dir="${srcdir}/petsc"
    _install_dir=/usr/petsc/${_config}

    export PETSC_DIR=${_build_dir}
    export PETSC_ARCH="${_petsc_arch}"

    make DESTDIR="${pkgdir}" install

    # install license
    install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    mkdir -p "${pkgdir}/etc/profile.d"
    echo "export PETSC_DIR=${_install_dir}" > "${pkgdir}/etc/profile.d/petsc.sh"
    chmod +x "${pkgdir}/etc/profile.d/petsc.sh"

    # show where the shared libraries are
    install -dm 755 "${pkgdir}/etc/ld.so.conf.d/"
    echo "${_install_dir}/lib" > "${pkgdir}/etc/ld.so.conf.d/petsc.conf"

    sed -i "s#-L${_build_dir}/${_petsc_arch}/lib ##" "${pkgdir}${_install_dir}/lib/pkgconfig/PETSc.pc"
}
