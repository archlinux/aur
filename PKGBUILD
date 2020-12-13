# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
pkgver=20
_releasever=20
_gccver=9.3.0
pkgrel=7
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(boost zlib bzip2 gcc9-libs gcc9-fortran tk libx11 libxext blas lapack python python-numpy python-scipy python-matplotlib python-setuptools perl perl-chemistry-mol)
makedepends=('cmake>=3.8.1' make gcc9 flex bison patch tcsh imake openmpi-gcc9 'cuda>=10.1')
optdepends=('openmpi-gcc9: MPI support'
            'cuda: GPU acceleration support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'vmd: visualize trajectories'
            'env-modules-tcl: modulefile support')
options=(!buildflags)

# Due to licensing issues you must register and download the package from the AmberMD url and put it in the PKGBUILD folder!
source=("local://AmberTools${pkgver}.tar.bz2"
        "amber.sh"
        "${pkgver}"
        "sander"
        "sander.MPI"
        "sander.OMP"
        ".version"
        "cuda-11.1.patch")
sha256sums=('b1e1f8f277c54e88abc9f590e788bbb2f7a49bcff5e8d8a6eacfaf332a4890f9'
            'cc06f57d7f81dfe7b3e3d9e5a00be105fef462b690076b4a274a02df4713339c'
            'bdbf6bdbe87ae7473a015cef775896e2fb8bda4cf9da534e67848bc3a2e13e87'
            'd99716e83d04217fd653d3a44b348e0d948ba671fb246480cf2b764fd4c07280'
            '675895e85b2ac518aee4d196f5162d8110e3c4a4d147f566bc2160f174a65c1c'
            '37e8c94c7d1ed88ace6a67eba5bcc146f030db0a8b230794b0b246cb635bb44c'
            '0736c740ec86bbe1545df3b66566d6fcffdd78368e457bb96fca2501d124de18'
            'b666b2f186c5fd40b0be71a52b854060deea690205dbca24606c13c97cbf07de')

prepare() {
  cd ${srcdir}/amber${_releasever}_src

  ./update_amber --update

  patch -Np0 -i "${srcdir}/cuda-11.1.patch"
}

build() {
  cd ${srcdir}/amber${_releasever}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-9 CXX=g++-9 FC=gfortran-9 cmake $AMBER_PREFIX/amber${_releasever}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCHECK_UPDATES=FALSE \
      -DCOMPILER=MANUAL  \
      -DMPI=TRUE -DCUDA=TRUE \
      -DOPENMP=TRUE \
      -DINSTALL_TESTS=FALSE \
      -DDOWNLOAD_MINICONDA=FALSE \
      -DFORCE_DISABLE_LIBS="plumed" \
      -DFORCE_INTERNAL_LIBS="arpack;xblas;netcdf;netcdf-fortran;pnetcdf;mpi4py;fftw" \
      -DFORCE_EXTERNAL_LIBS="boost" \
      -Wno-dev \
      2>&1 | tee cmake.log

  make
}

package() {
  mkdir -p ${pkgdir}/opt/amber

  # install stuff
  cd ${srcdir}/amber${_releasever}_src/build
  make DESTDIR=${pkgdir} install

  # install environment config file
  cd ${pkgdir}/opt/amber
  install -Dm755 ${srcdir}/amber.sh ./amber.sh

  # install other stuff
  install -Dm644 ${srcdir}/${pkgver} ${pkgdir}/opt/amber/share/modulefiles/ambertools/${pkgver}
  install -Dm644 ${srcdir}/.version ${pkgdir}/opt/amber/share/modulefiles/ambertools/.version

  # install wrappers
  install -Dm755 ${srcdir}/sander ${pkgdir}/usr/bin/sander
  install -Dm755 ${srcdir}/sander.MPI ${pkgdir}/usr/bin/sander.MPI
  install -Dm755 ${srcdir}/sander.OMP ${pkgdir}/usr/bin/sander.OMP

  # cleanup
  find ${pkgdir}/opt -mindepth 1 -maxdepth 1 ! -name "amber" -exec rm -rf '{}' \;
  rm -f ${pkgdir}/opt/amber/amber.csh
  find ${pkgdir}/opt/amber/lib -name "*.pyc" -type f -delete

  # fix buildroot traces
  sed -i "s#${srcdir}/amber${_releasever}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build#/opt/amber#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build#/opt/amber#" ${pkgdir}/opt/amber/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src#/opt/amber#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src#/opt/amber#" ${pkgdir}/opt/amber/AmberTools/src/config.h
}
