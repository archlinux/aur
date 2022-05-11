# Maintainer: realasking <realasking@outlook.com>


# HTML documentation
_BUILD_DOC=0
# Copy 'examples' to /usr/share/examples/lammps
_INSTALL_EXAMPLES=1


_pkgname=lammps
pkgname=${_pkgname}-ryzen-opencl
pkgver=r30482.1b8641685a
pkgrel=1
pkgdesc="lammps with opencl support ONLY for ryzen cpu and amd gpu, modified from pyskets's lammps package"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi' 'opencl-amd' 'voro++' 'env-modules')
makedepends=('cmake>=3.1')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git')
sha512sums=('SKIP')

# process the build settings from above
if (( $_BUILD_DOC )); then
    makedepends+=('python-sphinx')
fi


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p ${srcdir}/${_pkgname}_cpu/build
  mkdir -p ${srcdir}/${_pkgname}_gpu/build
}

build() {
  cd ${srcdir}/${_pkgname}_cpu/build
  cmake ../../${_pkgname}/cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/opt/lammps/cpu" \
    -DPKG_CORESHELL=ON \
    -DPKG_DIPOLE=ON \
    -DPKG_GRANULAR=ON \
    -DPKG_MOLECULE=ON \
    -DPKG_PERI=ON \
    -DPKG_MC=ON  \
    -DPKG_MISC=ON \
    -DPKG_GPU=OFF \
    -DPKG_USER-MEAMC=ON \
    -DPKG_USER-REAXC=ON \
    -DPKG_REPLICA=ON \
    -DPKG_KSPACE=ON \
    -DPKG_POEMS=ON \
    -DPKG_MANYBODY=ON \
    -DPKG_USER-ATC=ON \
    -DPKG_USER-AWPMD=ON \
    -DPKG_USER-DIFFRACTION=ON \
    -DPKG_VORONOI=ON -DDOWNLOAD_VORO=OFF \
    -DPKG_USER-FEP=ON \
    -DPKG_USER-MOLFILE=ON \
    -DPKG_USER-PHONON=ON \
    -DPKG_USER-VTK=OFF \
    -DPKG_KOKKOS=OFF \
    -DPKG_KIM=OFF \
    -DPKG_LATTE=OFF \
    -DDOWNLOAD_KIM=OFF \
    -DBUILD_OMP=OFF \
    -DPKG_OPT=ON \
    -DPKG_USER-OMP=OFF \
    -DBUILD_LIB=ON \
    -DBUILD_EXE=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPKG_PYTHON=ON \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCMAKE_Fortran_COMPILER=mpif90 \
    -DFFT=FFTW3 \
    -DCMAKE_CXX_FLAGS="-O3" \
    "${_feature_args[@]}" #\
  make -j8


  cd ${srcdir}/${_pkgname}_gpu/build
  cmake ../../${_pkgname}/cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/opt/lammps/gpu" \
    -DPKG_CORESHELL=ON \
    -DPKG_DIPOLE=ON \
    -DPKG_GRANULAR=ON \
    -DPKG_MOLECULE=ON \
    -DPKG_PERI=ON \
    -DPKG_MC=ON  \
    -DPKG_MISC=ON \
    -DPKG_USER-MEAMC=ON \
    -DPKG_USER-REAXC=ON \
    -DPKG_REPLICA=ON \
    -DPKG_KSPACE=ON \
    -DPKG_POEMS=ON \
    -DPKG_MANYBODY=ON \
    -DPKG_USER-ATC=ON \
    -DPKG_USER-AWPMD=ON \
    -DPKG_USER-DIFFRACTION=ON \
    -DPKG_VORONOI=ON -DDOWNLOAD_VORO=OFF \
    -DPKG_USER-FEP=ON \
    -DPKG_USER-MOLFILE=ON \
    -DPKG_USER-PHONON=ON \
    -DPKG_USER-VTK=OFF \
    -DPKG_KOKKOS=OFF \
    -DPKG_KIM=OFF \
    -DPKG_LATTE=OFF \
    -DDOWNLOAD_KIM=OFF \
    -DBUILD_OMP=OFF \
    -DPKG_OPT=ON \
    -DPKG_USER-OMP=OFF \
    -DBUILD_LIB=ON \
    -DBUILD_EXE=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPKG_PYTHON=ON \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCMAKE_Fortran_COMPILER=mpif90 \
    -DFFT=FFTW3 \
    -DPKG_GPU=on -DGPU_API=OPENCL -DGPU_PREC=single \
    -DCMAKE_CXX_FLAGS="-O3" \
    "${_feature_args[@]}" #\

  make -j8


  if (( $_BUILD_DOC )) ; then
    # Generate ReStructuredText from Text files
    mkdir -p rst

    for file in ../../${_pkgname}/doc/src/*.txt
    do
      tmp=${file%.*} # Strips the '.txt' extension
      fname=${tmp##*/} # Strips the path prefixing the file-name
      ../../${_pkgname}/doc/utils/converters/lammpsdoc/txt2rst.py ${file} > "rst/${fname}.rst"
    done

    # Generate HTML from ReStructuredText files
    mkdir -p html
    cp -r ../../${_pkgname}/doc/src/* rst/

    sphinx-build -b html -c "../../${_pkgname}/doc/utils/sphinx-config" -d "doctrees" "rst" html
  fi
}

package() {
  cd ${srcdir}
  install -Dm644 ../lammps_cpu_mod ${pkgdir}/etc/modules/modulefiles/lammps_Ryzen5
  install -Dm644 ../lammps_gpu_single_mod ${pkgdir}/etc/modules/modulefiles/lammps_OpenCL_single
  #install -Dm755 ../pos2lmp.awk ${pkgdir}/opt/lammps/cpu/bin/pos2lmp.awk
  #install -Dm755 ../pos2lmp.awk ${pkgdir}/opt/lammps/gpu/bin/pos2lmp.awk
  cd ${srcdir}/${_pkgname}_cpu/build
  #cd ${_pkgname}_cpu/build
  make DESTDIR=${pkgdir} install
  cd ${srcdir}/${_pkgname}_gpu/build
  #cd ${_pkgname}_gpu/build
  make DESTDIR=${pkgdir} install
  
  if (( $_BUILD_DOC )) ; then
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.html
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_images" "html/_images/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.png
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/css" "html/_static/css/"*.css
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/fonts" "html/_static/fonts/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/js" "html/_static/js/"*.js
  fi
  if (( $_INSTALL_EXAMPLES )) ; then
    mkdir -p "${pkgdir}/usr/share/examples/lammps"
    cp -r "../../${_pkgname}/examples/"* "${pkgdir}/usr/share/examples/lammps/"
    find "${pkgdir}/usr/share/examples/lammps/" -type f -exec chmod 644 '{}' +
  fi
  install -Dm644 "../../${_pkgname}/tools/vim/lammps.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/lammps.vim"
  install -Dm644 "../../${_pkgname}/tools/vim/filetype.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/lammps.vim"
}
