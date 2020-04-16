# Maintainer: Tobias Baust <tobias.baust at tutanota dot com>
_pkgname=cantera
pkgname="${_pkgname}-git"
pkgver='2.4.0.r689.g29437efc4'
pkgrel=2
pkgdesc='suite of tools for kinetics, thermodynamics, and transport processes'
arch=('x86_64')
url='https://cantera.org/'
license=('custom:Cantera Developers' 
         'custom:Sandia Corporation Contract AC04-94AL85000'
         'custom:California Institute of Technology')
depends=('python' 'eigen' 'sundials' 'boost')
makedepends=('scons' 'git' 'gcc' 'fmt') 
checkdepends=('gtest' 'gmock')
optdepends=('python-numpy: numerical python support' 
            'cython: compiler for python interface' 
            'python-ruamel-yaml: cython support'
            'doxygen: documentation' 
            'tcsh: csh scripts')
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
    $(pacman -Qi doxygen &> /dev/null)
    if [ "$?" -eq "0" ]; then
        scons doxygen
    fi
    # build cantera samples
    scons samples
}

check() {
	cd "$_pkgname"
    $(pacman -Qi python-numpy &> /dev/null) && \
    $(pacman -Qi python-ruamel-yaml &> /dev/null) && \
    $(pacman -Qi cython &> /dev/null) 
    if [ "$?" -ne "0" ]; then
        # run tests without python
        scons test-help | grep "test-" | sed '/python/d' | xargs scons
    else
        # run all tests
	    scons test
    fi
}

package() {
	cd "$_pkgname"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # install cantera
    scons install
    # correct namcap warning directory-not-world-executable
    chmod 755 "$pkgdir/usr/lib/python3.8/site-packages"
}
