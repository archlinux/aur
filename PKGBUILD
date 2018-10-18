# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=minc-toolkit-v2
pkgver=1.9.17
pkgrel=1
pkgdesc="Medical Imaging NetCDF Toolkit"
arch=('any')
url="https://www.mcgill.ca/bic/software/minc"
license=('GPL3')
depends=('perl' 'libjpeg-turbo' 'libxi' 'libxmu' 'libgl' 'glu' 'fftw' 'glut' 'netcdf' 'pcre' 'zlib' 'hdf5' 'nifticlib' 'insight-toolkit' 'elastix' 'lapacke' 'blas' 'ants')
makedepends=('git' 'cmake' 'bc' 'libhdf5')
provides=('minc-toolkit')
source=('git+https://github.com/BIC-MNI/minc-toolkit-v2.git'
		'FindNIFTI.patch')
sha512sums=('SKIP'
            '28e12be5c8c7e397a063fa570fd4819dc45daf845a608164b9e7aec6fb6fb99d58f4f494d648147613bb80393b88d40f63748ea9f6096d96a1df1e66d17bbed7')

_release_commit="f7952e966e2fdd6169098df8c8ae13968b3e4832"

_itk=`ls /usr/lib/cmake | grep -m1 ITK`
_install_prefix="/usr/share/minc"

prepare() {

	# ensure that the required ITK modules are present
	if [ `ls "/usr/include/$_itk" | grep 'itkMINCImageIO.h'` == "" ];
	then
		error "ITK must be built with -DModule_ITKIOMINC:BOOL=ON"
		exit 1
	fi
	if [ `ls "/usr/include/$_itk" | grep 'itkMINCTransformAdapter.h'` == "" ];
	then
		error "ITK must be built with -DModule_ITKIOTransformMINC:BOOL=ON"
		exit 1
	fi

	cd "$srcdir/$pkgname"
	git checkout $_release_commit
	git submodule update --init --recursive

	# that hash seems to be wrong
	sed -i \
		's/5c9dad3705a3408d27f696e5b31fb88c/41fe6758d46cccb1675693d155ee7001/' \
		cmake-modules/BuildNETCDF.cmake

	# find system NIFTI in the right place
	sed -i \
		's/FIND_PACKAGE(NIFTI OPTIONAL)/FIND_PACKAGE(NIFTI REQUIRED)/' \
		CMakeLists.txt
	patch -p0 -i ${srcdir}/FindNIFTI.patch

	# static version of HDF5
	sed -i \
		'74iSET(HDF5_LIBRARY "/usr/lib/libhdf5.a")' \
		cmake-modules/FindHDF5.cmake
	sed -i \
		'75iSET(HDF5_LIBRARIES ${HDF5_LIBRARY})' \
		cmake-modules/FindHDF5.cmake

	# libminc for patch_morphology
	sed -i \
		'5iINCLUDE_DIRECTORIES(${LIBMINC_INCLUDE_DIRS})' \
		patch_morphology/legacy/CMakeLists.txt
	sed -i \
		'6iLINK_DIRECTORIES(${LIBMINC_LIBRARY_DIRS})' \
		patch_morphology/legacy/CMakeLists.txt

	# blas and liblapacke for patch_morphology
	sed -i \
		'20ilapacke' \
		patch_morphology/src/CMakeLists.txt
	sed -i \
		'51icblas' \
		patch_morphology/src/CMakeLists.txt
	sed -i \
		'51ilapacke' \
		patch_morphology/src/CMakeLists.txt
	sed -i \
		'76ilapacke' \
		patch_morphology/src/CMakeLists.txt
	sed -i \
		'76icblas' \
		patch_morphology/src/CMakeLists.txt

	# blas and lapacke for spams_test in BEaST
	sed -i \
		'166iblas' \
		BEaST/CMakeLists.txt
	sed -i \
		'167ilapack' \
		BEaST/CMakeLists.txt
	sed -i \
		'201iblas' \
		BEaST/CMakeLists.txt
	sed -i \
		'201ilapack' \
		BEaST/CMakeLists.txt

	# the compiler won't like this
	sed -i \
		's/enum {false=0, true=1};//' \
		minctools/progs/mincdump/mincdump.h

    mkdir build || :
    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE:STRING=Release   \
        -DCMAKE_INSTALL_PREFIX:PATH="${_install_prefix}" \
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
        -DUSE_SYSTEM_NETCDF:BOOL=ON   \
        -DUSE_SYSTEM_NIFTI:BOOL=ON   \
        -DUSE_SYSTEM_PCRE:BOOL=ON   \
        -DUSE_SYSTEM_ZLIB:BOOL=ON \
		-DITK_DIR:PATH=/usr/lib/cmake/$_itk
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

#check() {
#	cd "$srcdir/$pkgname/build"
#	make test
#}

package() {
	cd "$srcdir/$pkgname/build"

	make install DESTDIR="${pkgdir}"

	cd "${pkgdir}${_install_prefix}"
	rm -rf minc-toolkit-config*

	mkdir -p $pkgdir/usr/share/bash-completion/completions
	mv share/bashcomp.sh $pkgdir/usr/share/bash-completion/completions/c3d
	mv bin $pkgdir/usr/bin
	mv include $pkgdir/usr/include
	mv lib $pkgdir/usr/lib
	mv man $pkgdir/usr/share/man
}

