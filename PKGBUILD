# Maintainer: Tobias M. Baust <tobias.baust at tutanota dot com>
# Maintainer: Ruben Di Battista  <rubendibattista at gmail dot com>
_pkgname=cantera
pkgname="${_pkgname}-git"
pkgver=3.1.0.r76.g9c3a57c8b
pkgrel=1
pkgdesc='suite of tools for kinetics, thermodynamics, and transport processes'
arch=('x86_64')
url='https://cantera.org/'
license=('custom:Cantera Developers' 
         'custom:Sandia Corporation Contract AC04-94AL85000'
         'custom:California Institute of Technology')
depends=('python-numpy' 'openmp' 'yaml-cpp' 'fmt' 'boost-libs')
makedepends=('scons' 'git' 'gcc' 'doxygen' 'cython' 'eigen' 'boost' 'python-pip' 'python-setuptools') 
checkdepends=('gtest' 'gmock' 'python-ruamel-yaml' 'python-pytest')
conflicts=('cantera')
provides=('libcantera_shared.so=2-64')
source=(git+https://github.com/Cantera/cantera.git)
md5sums=('SKIP')
_python_v=$(python -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    # build cantera
    scons -j $(nproc) build \
        prefix="$pkgdir/usr" \
	debug='n' \
        system_eigen='y' \
        system_sundials='n' \
        googletest='system' \
        extra_inc_dirs='/usr/include/eigen3'
    # build documentation
    scons doxygen
    # build cantera samples
    scons samples
}

check() {
    cd "$_pkgname"
    scons -j $(nproc) test
    scons test-clean
}

package() {
    cd "$_pkgname"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # install cantera
    scons install
    # correct namcap warning directory-not-world-executable
    chmod 755 "$pkgdir/usr/lib/python${_python_v}/site-packages"
}
