# Maintainer: Tobias M. Baust <tobias.baust at tutanota dot com>
_pkgname=cantera
pkgname="${_pkgname}-git"
pkgver='2.5.1.r0.gb0bace782'
pkgrel=1
pkgdesc='suite of tools for kinetics, thermodynamics, and transport processes'
arch=('x86_64')
url='https://cantera.org/'
license=('custom:Cantera Developers' 
         'custom:Sandia Corporation Contract AC04-94AL85000'
         'custom:California Institute of Technology')
depends=('eigen' 'sundials' 'boost' 'tcsh' 'cython' 'python-numpy')
makedepends=('scons' 'git' 'gcc' 'fmt' 'doxygen') 
checkdepends=('gtest' 'gmock' 'python-ruamel-yaml')
provides=('libcantera_shared.so=2-64')
install="$pkgname.install"
source=(git+https://github.com/Cantera/cantera.git)
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    # build cantera
    scons build \
        prefix="$pkgdir/usr" \
        system_eigen='y' \
        system_sundials='y' \
        sundials_include='/usr/include/sundials' \
        googletest='system' \
        extra_inc_dirs='/usr/include/eigen3'
    # build documentation
    scons doxygen
    # build cantera samples
    scons samples
}

check() {
    cd "$_pkgname"
    scons test
}

package() {
    cd "$_pkgname"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # install cantera
    scons install
    # correct namcap warning directory-not-world-executable
    _python_v=$(python -V |  awk '{print $2}')
    chmod 755 "$pkgdir/usr/lib/python${_python_v:0:3}/site-packages"
}
