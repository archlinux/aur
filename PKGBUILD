# Maintainer: Han Luo <han dot luo at gmail dot com>
pkgname=coolfluid-svn
_pkgname=${pkgname%-svn}
provides=("$_pkgname")
pkgver=r1387
pkgrel=1
#_config=linux-c-debug
pkgdesc="Computational Object-Oriented Libraries for Fluid Dynamics"
arch=('x86_64')
url="https://github.com/andrealani/COOLFluiD"
license=('LGPL3')
depends=('petsc' 'parmetis' 'mutationpp' 'boost' 'boost-libs')
optdepends=('cgns: cgns support'
            'python: run script in /opt/coolfluid/tools/Python' )
makedepends=('svn' 'gcc' 'cmake')
source=("$_pkgname::svn+https://github.com/andrealani/COOLFluiD/trunk"
        FindMPI.patch)
sha256sums=('SKIP'
            '2e95d3cc346e403437ce67f03e9c73bf01a6a7e9f701cf4c895e9597a09fc9e1')
export MAKEFLAGS="-j"$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
export CC=mpicc
export CXX=mpicxx
export FC=mpif90
# ============== Warning =====================
# It usually takes more than 1 hour to compile
# the code. You can download the compiled package
# from https://github.com/luohancfd/COOLFluiD/releases
# AT YOUR OWN RISK!
# ============================================
pkgver() {
  cd $_pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  if [ -z $PETSC_DIR ]; then
    echo '$PETSC_DIR not defined' 1>&2
    quit 64
  fi

  # get version of boost-lib
  _boost_ver=`pacman -Q boost-libs | \
              sed 's/.*\([0-9]\.[0-9]\{2\}\).*/\1/'`
  sed -i $'s/^\(SET.*Boost_ADDITIONAL_VERSIONS.*\)$/# \\1\\\nSET (Boost_ADDITIONAL_VERSIONS "'$_boost_ver'" "'$_boost_ver'.0")/'  $srcdir/$_pkgname/CMakeLists.txt
  sed -i 's|\(.*SET(CF_INSTALL_LIB_DIR\).*|\1 lib/coolfluid)|' $srcdir/$_pkgname/CMakeLists.txt
  sed -i  's|\(.*SET(CMAKE_INSTALL_RPATH\).*|\1 "/usr/lib/coolfluid")|' $srcdir/$_pkgname/CMakeLists.txt

  # override default compilation flags and link flags
  sed -i $'/CMAKE_MINIMUM_REQUIRED.*/a SET(CMAKE_C_FLAGS "")\\nSET(CMAKE_CXX_FLAGS "")\\nSET(CMAKE_Fortran_FLAGS "")\\nSET(CMAKE_SHARED_LINKER_FLAGS "")' $srcdir/$_pkgname/CMakeLists.txt

  # modify source to make it find MPI
  cd $srcdir/$_pkgname
  patch -Np1 -i "${srcdir}/FindMPI.patch"
}

build() {
  _base_dir=$srcdir/$_pkgname/OPENMPI
  _build_dir=$srcdir/$_pkgname/OPENMPI/optim
  mkdir -p $_base_dir
  mkdir -p $_build_dir

  # get the name of all plugins
  cd $srcdir/$_pkgname/plugins
  plugin_name=`find .  -maxdepth 1 -type d -printf '%f,' | sed 's|^\.,\(.*\)\,|\1|g'`


  # write coolfluid configuration file
  cat > $srcdir/$_pkgname/coolfluid.conf << EOF
# this is the directory of the source
coolfluid_dir = $srcdir/$_pkgname
# this is the directory where program is built
basebuild_dir = $_base_dir
# this is passed to CMAKE_INSTALL_PREFIX
install_dir   = /usr
install_api = ${plugin_name}
# compilers
cc     = $CC
cxx    = $CXX
fc     = $FC

#cudac = /opt/cuda/4.0.17/bin/nvcc
#cudacflags = -O2 -g -Xcompiler
#cuda_dir      = /opt/cuda/4.0.17
#withcuda = 1
#withcurl = 0

# library locations
mpi_dir       = /usr
curl_dir      = /usr
boost_dir     = /usr
petsc_dir     = $PETSC_DIR
parmetis_dir  = /usr

#gsl_includedir = /usr/include/gsl
#gsl_librarydir = /usr/lib64

# activate the following option for large meshes (>50 million cells)
# with_longint = 1

with_mutationpp = 1
mutationpp_dir = /usr
mutationpp_includedir = /usr/include/mutation++
mutationpp_librarydir = /usr/lib
lib_MutationI     = on
#assertions = 0
mods-getall = 1

# enable doxygen
withdocs = 0

# names of the extra modules to download
# extra_mods_list = Mutation,Mutation2.0,Mutation2.0.0
# URL from which extra modules are downloadable (order must match extra_mods_list)
# extra_mods_url  = https://minarossa.vki.ac.be/svn/coolfluid-plugins/Mutation,https://minarossa.vki.ac.be/svn/coolfluid-plugins/Mutation2.0,https://minarossa.vki.ac.be/svn/coolfluid-plugins/Mutation2.0.0
#
#mod_ClientServer = off
#mod_DiscontGalerkin = off
#mod_MutationPanesi = off
#mod_MutationUsage = off
#
cmake_generator = make
#
with_testcases = 1
#assertions = 0

#########################################################################################
# examples of user-defined modes that can be used for compilation
#
# the following will create /data/user/COOLFluiD/OPENMPI/releasefort after configuration
#releasefort_cflags     = -O3
#releasefort_cxxflags   = -O3
#releasefort_fflags     = -c -fpe0 -O2 -r8 -ip

# the following will create /data/user/COOLFluiD/OPENMPI/debugprofile after configuration
#debugprofile_cflags     = -pg -O2
#debugprofile_cxxflags   = -pg -O2
#debugprofile_fflags     = -pg -O2
EOF

  # configure the code
  cd $srcdir/$_pkgname
  ./prepare.pl --build=optim | tee prepare.log

  # start build the code
  cd $_build_dir
  if [ -f success.log ]; then
    rm success.log
  fi
  _max_build=10
  _i_build=1

  # if compile fail, we retry
  # this is usually caused by poor derivation
  cat /dev/null >  make.log
  while [ $? -ne 0 ] && [ $_i_build -lt $_max_build ]; do
    let _i_build=_i_build+1
    echo "Rety $_i_build / $_max_build"
    make $MAKEFLAGS | tee -a make.log
  done
  # until make -j20; do echo "Retry"; sleep 5; done

  if [ $? -eq 0 ]; then
    touch success.log
  fi
}

package() {
  _base_dir=$srcdir/$_pkgname/OPENMPI
  _build_dir=$srcdir/$_pkgname/OPENMPI/optim

  cd $_build_dir
  if [ -f success.log ]; then
    make $MAKEFLAGS DESTDIR="$pkgdir" CF_INSTALL_LIB_DIR="lib/coolfluid" install
    install apps/Solver/coolfluid-solver-wrapper $pkgdir/usr/bin
    cd $pkgdir/usr/bin
    sed -i "s|ldir=.*|ldir=/usr/lib/coolfluid|" coolfluid-solver-wrapper
    sed -i "s|mpicmd=.*|mpicmd=mpirun|" coolfluid-solver-wrapper
    sed -i "s|cf_cmd=.*|cf_cmd=/usr/bin/coolfluid-solver|" coolfluid-solver-wrapper

    # move include
    # install -d $pkgdir/usr/coolfluid_include
    # mv $pkgdir/usr/include/* $pkgdir/usr/coolfluid_include/
    # mv $pkgdir/usr/coolfluid_include $pkgdir/usr/include/coolfluid

    # move all lib to subdirectory
    # install -d $pkgdir/usr/coolfluid_lib
    # mv $pkgdir/usr/lib/* $pkgdir/usr/coolfluid_lib/
    # mv $pkgdir/usr/coolfluid_lib     $pkgdir/usr/lib/coolfluid

    # install configuration file and pkg-conf
    install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  	echo "/usr/lib/coolfluid" > "${pkgdir}"/etc/ld.so.conf.d/coolfluid.conf
    install -d -m755 ${pkgdir}/usr/share/pkgconfig
    cat > ${pkgdir}/usr/share/pkgconfig/coolfluid.pc << EOF
prefix=/usr
exec_prefix=\${prefix}

Name: COOLFluiD
Description: ${pkgdesc}
Requires: mutationpp
Version: ${pkgver}
Libs: -L\${prefix}/lib/coolfluid
Cflags: -I\${prefix}/include/coolfluid
EOF

    ## create opt directory
    install -d $pkgdir/opt/coolfluid
    # move something to another directory
    mv $pkgdir/usr/cmake $pkgdir/opt/coolfluid/

    # copy prepare.log and make.log
    install -d $pkgdir/opt/coolfluid/build
    cp -f $srcdir/$_pkgname/prepare.log $pkgdir/opt/coolfluid/build/
    cp -f $srcdir/$_pkgname/coolfluid.conf $pkgdir/opt/coolfluid/build/
    cp -f $_build_dir/make.log $pkgdir/opt/coolfluid/build/

    # install doc and tool
    cp -rf $srcdir/$_pkgname/doc $pkgdir/opt/coolfluid/
    cp -rf $srcdir/$_pkgname/tools $pkgdir/opt/coolfluid/

    # install testcases, very huge
    # install -d $pkgdir/opt/coolfluid/testcases
    # cd $srcdir/$_pkgname/plugins
    # find . -type d -name "testcase*" -exec cp -r --parents \{\} $pkgdir/opt/coolfluid/testcases \;
    # cd $pkgdir/opt/coolfluid/testcases
    # for i in */; do
      # j=${i%/}
      # mv "$j"/testcases/* $j/
      # rm -rf "$j"/testcases
    # done
    # # fix symbolic link
    # cd $pkgdir/opt/coolfluid/testcases
    # files=`find . -type l -print`
    # for i in ${files[@]}; do
      # olddest=`readlink -n $i`
      # newdest=`echo $olddest | sed 's|testcases/||' | sed 's|../||'`
      # newdest=`dirname $i`"/$newdest"
      # if [ -f $newdest ]; then
        # cp `dirname $i`"/$newdest" $i
      # else
        # rm $i
        # echo $newdest" not found"
      # fi
    # done
  else
    echo "Fail to build" 1>&2
    quit 64
  fi
}
