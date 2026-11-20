# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=seacas
pkgname=seacas-cuda
pkgver=2026.08.11
pkgrel=1
pkgdesc="Sandia Engineering Analysis Code Access System: Exodus II, IOSS and mesh tools (with CUDA)"
arch=('x86_64')
url="https://github.com/sandialabs/$_name"
license=('BSD-3-Clause')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'libgfortran'
         'openmpi'
         'hdf5-openmpi'
         'netcdf-openmpi'
         'pnetcdf-openmpi'
         'cgns-parallel'
         'matio'
         'metis'
         'parmetis'
         'zoltan'
         'fmt'
         'libx11'
         'zlib'
         'adios2'
         'paraview-catalyst'
         'aws-sdk-cpp'
         'kokkos-cuda'
         'cuda'
         'faodel'
         'pamgen'
         'robin-map'
         'hopscotch-map'
         'util-linux')
makedepends=('cmake'
             'bison'
             'gcc-fortran'
             'python'
             'cereal')
optdepends=('python: exodus3.py and exomerge3.py modules'
            'python-numpy: numpy arrays in exodus3.py')
provides=("seacas=$pkgver"
          "exodusii=$pkgver")
conflicts=('seacas')
options=('!lto')
_tag=v${pkgver//./-}
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
        'fix-vector-one-past-end-indexing.patch'
        'fix-node-map-without-node-blocks.patch'
        'fix-ctx-cgio-linkage.patch'
        'fmt-uint128-bitwise-not.patch')
sha256sums=('9010d5fe17e14f556ae2a065573ab297bd861738742ead92895025d27fec31bb'
            'c5514e0b24abb34c42de1842b086ef4a1084ef39ef44d5ebf0e72fc34193e3b4'
            'ea33c91e69f426d83fb0f4c289faf12b4bbc5c97e332669f281305f6a88bee65'
            'd29dd5a20cd2c140c42b67f94e35f0562d5a3f14eabdf2972cdd11f849302f1c'
            '929be1d3af590d180ad117e72e1a713b04564ee305629a9bdf773e1d78340252')

prepare() {
  cd "$_name-${_tag#v}"
  # Upstream fix for one-past-end std::vector indexing that aborts Utst_blockbatchread and Utst_nem_spread under _GLIBCXX_ASSERTIONS (sandialabs/seacas@80471a3)
  patch -Np1 -i ../fix-vector-one-past-end-indexing.patch
  # Skip the parallel Exodus node map output for blob-only regions instead of asserting, fixing Utst_blob_write_read_MPI_4
  patch -Np1 -i ../fix-node-map-without-node-blocks.patch
  # Upstream fix declaring CGNS's ctx_cgio outside the anonymous namespace, which nvcc otherwise makes a hidden symbol that libIocgns cannot link to (sandialabs/seacas@25eb1cf)
  patch -Np1 -i ../fix-ctx-cgio-linkage.patch
  # fmt 12.2 lacks the operator~ of its fallback uint128, which nvcc uses since it has no __int128 there (fmtlib/fmt@588b3a0, not released yet): build against a copy of the fmt headers with that upstream fix, found through CPLUS_INCLUDE_PATH so its path stays out of the CXXFLAGS that TriBITS writes into the installed CMake configs
  mkdir -p ../fmt-include
  cp -r /usr/include/fmt ../fmt-include/
  grep -q 'operator~(const uint128' ../fmt-include/fmt/format.h || patch -d ../fmt-include -Np2 -i "$srcdir"/fmt-uint128-bitwise-not.patch
  # Remove the bundled Zoltan to use the zoltan package, keeping only the dependencies file TriBITS reads for every listed package
  find packages/zoltan -mindepth 1 ! -path packages/zoltan/cmake ! -path packages/zoltan/cmake/Dependencies.cmake -delete
  # Check each package's own Zoltan switch: Seacas_ENABLE_Zoltan is only set when Zoltan is built inside seacas, so an external Zoltan was silently not used
  sed -i 's/${PROJECT_NAME}_ENABLE_Zoltan/${PACKAGE_NAME}_ENABLE_Zoltan/' packages/seacas/libraries/ioss/src/CMakeLists.txt packages/seacas/libraries/ioss/src/cgns/CMakeLists.txt packages/seacas/libraries/ioss/src/main/CMakeLists.txt packages/seacas/applications/nem_slice/CMakeLists.txt packages/seacas/applications/slice/CMakeLists.txt packages/seacas/applications/zellij/CMakeLists.txt
  # Pick decomp's default method from nem_slice's Zoltan switch
  sed -i 's/${PROJECT_NAME}_ENABLE_Zoltan/SEACASNemslice_ENABLE_Zoltan/' packages/seacas/scripts/CMakeLists.txt
  # Remove the bundled tsl robin-map and hopscotch-map to use the robin-map and hopscotch-map packages
  rm packages/seacas/libraries/ioss/src/robin_*.h packages/seacas/libraries/ioss/src/hopscotch_*.h packages/seacas/libraries/ioss/src/bhopscotch_*.h packages/seacas/libraries/aprepro_lib/robin_*.h
  sed -i -E 's@#include [<"]((b?hopscotch|robin)_[a-z_]+\.h)[>"]@#include <tsl/\1>@' $(grep -rlE '#include [<"](b?hopscotch|robin)_[a-z_]+\.h[>"]' packages/seacas)
  # Remove the pre-generated aprepro parser so it is generated with the system bison (the scanner stays: aprepro.ll needs the flex 2.5 C++ API)
  rm packages/seacas/libraries/aprepro_lib/apr_parser.cc packages/seacas/libraries/aprepro_lib/aprepro_parser.h packages/seacas/libraries/aprepro_lib/location.hh packages/seacas/libraries/aprepro_lib/position.hh packages/seacas/libraries/aprepro_lib/stack.hh
  # Find the generated aprepro_parser.h in the build directory, and declare it as a bison output so nothing compiles before it exists
  sed -i 's|^  ${CMAKE_CURRENT_SOURCE_DIR}$|  ${CMAKE_CURRENT_SOURCE_DIR}\n  ${CMAKE_CURRENT_BINARY_DIR}|' packages/seacas/libraries/aprepro_lib/CMakeLists.txt
  sed -i 's|set(BISON_LIB_SOURCE ${CMAKE_CURRENT_BINARY_DIR}/apr_parser.cc)|set(BISON_LIB_SOURCE ${CMAKE_CURRENT_BINARY_DIR}/apr_parser.cc ${CMAKE_CURRENT_BINARY_DIR}/aprepro_parser.h)|' packages/seacas/libraries/aprepro_lib/CMakeLists.txt
  sed -i 's|add_custom_command(OUTPUT  apr_parser.cc$|add_custom_command(OUTPUT  apr_parser.cc aprepro_parser.h|' packages/seacas/libraries/aprepro_lib/CMakeLists.txt
  # Use util-linux's getopt instead of building the bundled copy as getopt.seacas, and find the scripts' directory from the programs they run
  rm packages/seacas/scripts/getopt.seacas.c packages/seacas/scripts/getopt-enhanced.c
  sed -i '/getopt\.seacas/d' packages/seacas/scripts/CMakeLists.txt
  sed -i 's|${ACCESS_BIN}/getopt\.seacas|getopt|' packages/seacas/scripts/blot.in packages/seacas/scripts/fastq.in packages/seacas/scripts/epup.in packages/seacas/scripts/pconjoin.in
  sed -i 's| -a -x ${basedir}/getopt\.seacas||' packages/seacas/scripts/epup.in packages/seacas/scripts/pconjoin.in
  sed -i 's|getopt\.seacas|blot_x11|' packages/seacas/scripts/blot.in
  sed -i 's|getopt\.seacas|fastq_x11|' packages/seacas/scripts/fastq.in
  # Print the S3 error messages into an ostringstream, as the rest of Ioss does (fmt 11+ treats a std::string first argument as the format string)
  sed -i 's/std::string errmsg;/std::ostringstream errmsg;/' packages/seacas/libraries/ioss/src/s3/Ios3_DatabaseIO.C
}

build() {
  cd "$_name-${_tag#v}"
  export PATH="/opt/cuda/bin:$PATH"
  export OMPI_CXX=/usr/bin/nvcc_wrapper
  export CPLUS_INCLUDE_PATH="$srcdir/fmt-include"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_Fortran_COMPILER=mpif90 -DCMAKE_CXX_STANDARD=20 -DBUILD_SHARED_LIBS=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DSEACASExodus_ENABLE_STATIC=OFF -DSeacas_ENABLE_ALL_PACKAGES=ON -DSeacas_ENABLE_ALL_OPTIONAL_PACKAGES=ON -DSeacas_ENABLE_SECONDARY_TESTED_CODE=ON -DSeacas_ENABLE_Fortran=ON -DSeacas_SKIP_FORTRANCINTERFACE_VERIFY_TEST=ON -DENABLE_ExoNull=ON -DSEACASExodus_ENABLE_THREADSAFE=ON -DTPL_ENABLE_MPI=ON -DTPL_ENABLE_Pthread=ON -DTPL_ENABLE_DLlib=ON -DTPL_ENABLE_Zlib=ON -DTPL_ENABLE_X11=ON -DTPL_ENABLE_fmt=ON -DTPL_ENABLE_HDF5=ON -DHDF5_ALLOW_PACKAGE_PREFIND=OFF -DTPL_ENABLE_Netcdf=ON -DTPL_ENABLE_Pnetcdf=ON -DTPL_Netcdf_Enables_PNetcdf=ON -DTPL_ENABLE_CGNS=ON -DTPL_ENABLE_Matio=ON -DTPL_ENABLE_METIS=ON -DTPL_ENABLE_ParMETIS=ON -DTPL_ENABLE_Zoltan=ON -DTPL_ENABLE_ADIOS2=ON -DADIOS2_LIBRARY_NAMES="adios2_c;adios2_cxx;adios2_c_mpi;adios2_cxx_mpi" -DTPL_ENABLE_Catalyst2=ON -DTPL_Catalyst2_INCLUDE_DIRS="/usr/include/catalyst-2.1;/usr/include/conduit" -DTPL_Catalyst2_LIBRARIES="/usr/lib/libcatalyst.so;/usr/lib/libconduit.so" -DTPL_ENABLE_AWSSDK=ON -DTPL_ENABLE_Cereal=ON -DTPL_ENABLE_Kokkos=ON -DTPL_Kokkos_INCLUDE_DIRS=/usr/include -DTPL_Kokkos_LIBRARIES=/usr/lib/libkokkoscore.so -DTPL_ENABLE_CUDA=ON -DCUDA_LIBRARY_DIRS=/opt/cuda/lib64 -DCMAKE_CXX_STANDARD_LIBRARIES=/opt/cuda/targets/x86_64-linux/lib/stubs/libcuda.so -DTPL_ENABLE_Faodel=ON -DFaodel_INCLUDE_DIRS=/usr/include/faodel -DFaodel_LIBRARY_NAMES="kelpie;dirman;opbox;lunasa;nnti;faodel-services;whookie;faodel-common;sbl;faodel-tcmalloc;faodel-spinlock" -DTPL_ENABLE_DataWarp=OFF -DTPL_ENABLE_Pamgen=ON -DGENERATE_BISON_FILES=ON -DSeacas_ENABLE_TESTS=OFF -Wno-dev
  cmake --build build
}

package() {
  cd "$_name-${_tag#v}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
