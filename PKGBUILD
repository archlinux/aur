# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.25.7
_debver=1
pkgver=${_omver}
pkgrel=3
pkgdesc="A complete Modelica modeling and simulation environment (from Debian binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'lapack' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-tools' 'qt6-webengine' 'readline' 'sundials' 'suitesparse')

optdepends=(
    'java-runtime: For Java CORBA interface'
    'python-ompython: For OpenModelica-Python Integration'
    'python-statsmodels: For running test/doc scripts'
    'python-junit-xml: For running test/doc scripts'
    'python-natsort: For running test/doc scripts'
    'ruby: For running test/doc scripts'
    'texlive-bin: For LaTeX documentation generation in OMNotebook'
    'texlive-latex: For LaTeX documentation generation in OMNotebook'
)

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib-trixie"

source=(
    "${_baseurl}/drcontrol_${_omver}-${_debver}_all.deb"
    "${_baseurl}/drmodelica_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomccpp_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomcsimulation_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsensplugin_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omc-common_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omedit_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omlibrary_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omnotebook_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell-terminal_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/openmodelica_${_omver}-${_debver}_amd64.deb"
)

sha256sums=('cc5f67394d4140522e7f32757bdf4ca66a28ff503b8a502910f75b56095e8168'
            '980963df4e08ce13b01411a80320084c0ae40dd1869e338592fcad55841a5eb9'
            '082b8287718c8d6fbd387d912b4753939ebdfc73a31b68adebf64dbdd4c9ad0c'
            'f862104e835ba0d5d07b2d31b8f3abc0ee6e5780738ef033b88fc6c15aa4c896'
            'db38da10ee52ed1f416371aa08a4c7cd13c97d6a098696ea1f5b1d913b692041'
            'ab2a4995cabda7e95ded76846194a68b6a0904d2922f33db9c95cb1a91c8147a'
            '71665e18ba6ebc1a13bb4dd78969b92eaa3fb3494a049c7062334daa9e2c7738'
            '1597340f24a47eeaaeecc397c08e837e2ba51c603b221f9287cfae364b25c07c'
            '7c5fd0af051261a549d7f0f774733e605429db3d1ff6c38f38103cd121a33a5a'
            'f4c945d71381c86464eb422ad2c7d6b13d81bcd22a8f56bcbddd498e7577ae2c'
            '2f66ffe30a6ba668c57d0e99247d97838c9f94fa487710addb4cec09cdf2394f'
            '5fbe8ee8729871e65f330938818662c260683fc3eda31427b7d8f77f642880ae'
            '85549f99ab26a0c52ad71d5e8cd320f63e679bbce732341ab85a342141af7cba'
            '08fbaebdb3450a14024ce53e056fd3d2f77838b61012c6a6bed4706f1a7fbe1a'
            '75002d663f28979c44fa7fd800146aa454dc9e42dee11605cb956370309727f3'
            '2c792276a4b539d47ad77648f642e09c850f4d01fc0cdb5bc63f6c655d1e7149'
            '648d7b4afe9abf42f850c7d302c15d51177e0f88496e75b226dd04202460abcd'
            '78c783eafe07afce5c85c6c5066d50b98ba70ae59846bcce39eba61e36956995')

package() {
    for deb in "${source[@]}"; do
        msg2 "Extracting $(basename "$deb")..."
        ar p "$srcdir/$(basename "$deb")" data.tar.xz | tar -xJ -C "$pkgdir/" --no-same-owner
    done

    install -d "$pkgdir/usr/share/applications"

    mv "$pkgdir/usr/share/applications/"{omedit,openmodelica-omedit}.desktop
    mv "$pkgdir/usr/share/applications/"{omnotebook,openmodelica-omnotebook}.desktop
    mv "$pkgdir/usr/share/applications/"{omshell,openmodelica-omshell}.desktop

    install -Dm644 "$pkgdir/usr/share/doc/openmodelica/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Remove broken symlinks from Debian package
    rm "$pkgdir/usr/include/omc/cpp/boost"
    rm "$pkgdir/usr/include/omc/omsicpp/boost"
}
