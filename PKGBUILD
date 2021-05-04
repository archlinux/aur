# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
pkgver=21
_releasever=20
pkgrel=1
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(boost zlib bzip2 gcc-fortran tk libx11 libxext blas lapack python python-numpy python-scipy python-matplotlib python-setuptools perl perl-chemistry-mol)
makedepends=('cmake>=3.10' make gcc flex bison patch tcsh imake openmpi 'cuda>=11.1')
optdepends=('openmpi: MPI support'
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
        ".version")
sha256sums=('f55fa930598d5a8e9749e8a22d1f25cab7fcf911d98570e35365dd7f262aaafd'
            '7344dcd9c2dc3407a01551af46714cefeff52e20b43ce395c1479d88422c29d8'
            '034e2a84531a7db77d4a19f9976f5b3f8a7a96f222de0157cc4f47bb1c0efe1e'
            '5296a44c433f80188c1a77b7f993540a0d17e302971696fb542523a6dd512839'
            'ce3fc27c1d05ab1a47b4701dc18a8a1e15625047594c35b57aa649054fcd25c1'
            '3b55bc5d1aa9f1c045448c07ccee4af209d836f54cfbf2ee2d32a412e6b77e8b'
            '3f7d7a0cae1531ad36513ec554cae302e78b2b574026e5dbfacf9a0d0c72b1cc')

prepare() {
  cd ${srcdir}/amber${_releasever}_src

  # apply updates manually
  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${_releasever}_src/build

  export AMBER_PREFIX="${srcdir}"

  cmake $AMBER_PREFIX/amber${_releasever}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCHECK_UPDATES=FALSE \
      -DCOMPILER=GNU \
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
