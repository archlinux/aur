# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=faodel
pkgver=1.2306.1
pkgrel=1
pkgdesc="Flexible, Asynchronous, Object Data-Exchange Libraries for HPC data management"
arch=('x86_64')
url="https://github.com/sandialabs/$pkgname"
license=('MIT')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'openmpi'
         'boost-libs'
         'hdf5-openmpi'
         'leveldb'
         'arrow'
         'rdma-core'
         'libtirpc'
         'zlib'
         'cassandra-cpp-driver'
         'cereal')
makedepends=('cmake'
             'boost'
             'gtest'
             'rpcsvc-proto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'libtirpc.patch')
sha256sums=('8fa3ca830a6e65b45df84e35f25bbc0b108b27b4996f20a21cfbe28e9775cb96'
            '199fa5de463a0f85c0c369bedc2c70842dc70a65efd0b71d68cc417ca4472d27')

prepare() {
  cd "$pkgname-$pkgver"
  # Find the XDR headers and library in libtirpc, so NNTI uses XDR instead of falling back to Cereal
  patch -Np1 -i ../libtirpc.patch
  # Lunasa needs the bundled tcmalloc fork (it doesn't replace malloc and gets its memory only from Lunasa's allocator); rename its libraries so they don't conflict with gperftools' /usr/lib/libtcmalloc.so
  printf 'set_target_properties( tcmalloc PROPERTIES OUTPUT_NAME faodel-tcmalloc )\nset_target_properties( spinlock PROPERTIES OUTPUT_NAME faodel-spinlock )\n' >> tpl/gperftools/CMakeLists.txt
  sed -i 's/"-ltcmalloc -lspinlock"/"-lfaodel-tcmalloc -lfaodel-spinlock"/' CMakeLists.txt
  # Use the cereal headers shipped by Arch instead of the bundled copy
  rm -rf tpl/cereal/include
  sed -i '/install( DIRECTORY/,+1d;s|INCLUDES DESTINATION "${INCLUDE_INSTALL_DIR}/faodel/tpl-cereal" )|)|' tpl/cereal/CMakeLists.txt
  # Boost 1.89 removed the boost_system stub library (Boost.System is header-only); don't look for it
  sed -i 's/COMPONENTS system log/COMPONENTS log/;s/if( NOT TARGET Boost::system )/if( NOT TARGET Boost::log )/' cmake/FaodelTPLs.cmake
  # Build as C++17: the Boost.Lockfree headers used by NNTI need C++14 since Boost 1.87
  sed -i 's/set( CMAKE_CXX_STANDARD 11 )/set( CMAKE_CXX_STANDARD 17 )/' CMakeLists.txt
  # Boost 1.87 removed io_service, resolver::query/iterator and address_v4::to_ulong(); use io_context, resolve(host, service) and to_uint()
  sed -i 's/boost::asio::io_service /boost::asio::io_context /' src/whookie/client/Client.cpp src/whookie/server/boost/server.hpp
  sed -i '/tcp::resolver::query query(server, port);/d;s/tcp::resolver::iterator endpoint_iterator = resolver.resolve(query);/auto endpoint_iterator = resolver.resolve(server, port);/' src/whookie/client/Client.cpp
  sed -i 's/\*resolver.resolve({address, ssport.str()})/resolver.resolve(address, ssport.str()).begin()->endpoint()/;s/to_v4().to_ulong()/to_v4().to_uint()/' src/whookie/server/boost/server.cpp
  # requires is a keyword in C++20, which Arrow's CMake targets force on faodel-arrow and its tests; rename the parameter in the public headers
  sed -i 's/\(std::vector<std::string> &\?\)requires,/\1requires_,/' src/faodel-common/Bootstrap.hh src/faodel-common/BootstrapInterface.hh src/lunasa/core/Singleton.hh src/dirman/core/Singleton.hh src/opbox/core/Singleton.hh src/kelpie/core/Singleton.hh src/whookie/server/boost/server.hpp src/faodel-services/BackBurner.hh src/faodel-services/MPISyncStart.hh
  # mpi_kelpie_dht uses std::setw/std::setfill without including <iomanip>
  sed -i 's/#include <random>/#include <random>\n#include <iomanip>/' tests/kelpie/component/mpi_kelpie_dht.cpp
  # mpi_kelpie_many_items starts MPI with MPI_Init (MPI_THREAD_SINGLE), but the NNTI MPI transport calls MPI from its worker threads and crashes in MPI_Irecv; request MPI_THREAD_MULTIPLE like the other network tests
  sed -i 's/MPI_Init(&argc, &argv);/int provided;\n  MPI_Init_thread(\&argc, \&argv, MPI_THREAD_MULTIPLE, \&provided);/' tests/kelpie/component/mpi_kelpie_many_items.cpp
  # The MPI transport takes &vector[0] of an empty request list, which aborts with _GLIBCXX_ASSERTIONS; use data()
  sed -i 's/&outstanding_msg_requests_\[0\]/outstanding_msg_requests_.data()/;s/&outstanding_op_requests_\[0\]/outstanding_op_requests_.data()/' src/nnti/transports/mpi/mpi_transport.cpp
  # NntiOpVectorTest writes to a vector it only reserve()d, which aborts with _GLIBCXX_ASSERTIONS; resize it
  sed -i 's/mirror.reserve(1024);/mirror.resize(num_op);/' tests/nnti/cpp-api/NntiOpVectorTest.cpp
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DBUILD_SHARED_LIBS=ON -DBOOST_ROOT=/usr -DGTEST_ROOT=/usr -DHDF5_ROOT=/usr -DBUILD_TESTS=ON -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF -DFaodel_ENABLE_MPI_SUPPORT=ON -DFaodel_ENABLE_TCMALLOC=ON -DFaodel_ENABLE_IOM_HDF5=ON -DFaodel_ENABLE_IOM_LEVELDB=ON -DFaodel_ENABLE_IOM_CASSANDRA=ON -DFaodel_ENABLE_ARROW=ON -DFaodel_NETWORK_LIBRARY=nnti -DFaodel_NNTI_SERIALIZATION_METHOD=XDR -DFaodel_THREADING_MODEL=pthreads -DMPIEXEC_PREFLAGS=--oversubscribe -Wno-dev
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  echo 'net.transport.name mpi' > "$srcdir"/faodel-test.conf
  FAODEL_CONFIG="$srcdir"/faodel-test.conf ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
