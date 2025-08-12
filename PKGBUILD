# Maintainer: Joelton D. Brandão <joeltondbrandao at freedxm dot com>
# Maintainer: Ruben Di Battista  <rubendibattista at gmail dot com>
# Contributor: Tobias M. Baust <tobias.baust at tutanota dot com>
_pkgname=cantera
pkgname="${_pkgname}"
pkgver=3.1.0
pkgrel=1
pkgdesc='suite of tools for kinetics, thermodynamics, and transport processes'
arch=('x86_64')
url='https://cantera.org/'
license=('custom:Cantera Developers' 
         'custom:Sandia Corporation Contract AC04-94AL85000'
         'custom:California Institute of Technology')
depends=('python-numpy' 'openmp' 'yaml-cpp' 'fmt' 'boost-libs' 'sundials-seq' 'python' 'hdf5')
makedepends=('scons' 'git' 'gcc' 'doxygen' 'cython' 'eigen' 'boost' 'python-pip' 'python-setuptools' 'patch') 
checkdepends=('gtest' 'gmock' 'python-ruamel-yaml' 'python-pytest')
conflicts=('cantera-git')
provides=('libcantera_shared.so=2-64')
source=(git+https://github.com/Cantera/cantera.git)
md5sums=('SKIP')

prepare() {
    cd "$_pkgname"
    git checkout tags/v$pkgver
    git submodule update

}

build() {
    cd "$_pkgname"
    scons -j $(nproc) build \
        prefix="/usr" \
        debug='n' \
        system_eigen='y' \
        system_sundials='y' \
        system_fmt='y' \
        googletest='system' \
        hdf_support='y' \
        system_yamlcpp='y' \
        system_blas_lapack='y' \
        python_package='y'
    scons doxygen
    scons samples
}

check() {
    cd "$_pkgname"
    scons -j $(nproc) test
    scons test-clean
}

package() {
  cd "$_pkgname"
  _python_v=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  scons install prefix=/usr stage_dir="$pkgdir"
  chmod 755 "$pkgdir/usr/lib/python${_python_v}/site-packages"

  # Fix pkg-config file, because of conflits with install in the /usr dir
  pcfile="$pkgdir/usr/lib/pkgconfig/cantera.pc"
  cat > "$pcfile" <<'EOF'
prefix=/usr
exec_prefix=${prefix}
libdir=${prefix}/lib
includedir=${prefix}/include

Name: Cantera
Description: Cantera library
URL: https://cantera.org
Version: 3.1.0

Libs: -L${libdir} -lcantera_shared -lfmt -lpthread
Cflags: -std=c++17 -pthread
EOF
}
