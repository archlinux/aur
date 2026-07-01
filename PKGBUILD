# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.26.9
_debver=1
pkgver=${_omver}
pkgrel=2
pkgdesc="A complete Modelica modeling and simulation environment (from Debian binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('bash' 'blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'lapack' 'libglvnd' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-svg' 'qt6-tools' 'qt6-webchannel' 'qt6-webengine' 'readline' 'sundials' 'suitesparse' 'util-linux-libs')

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

sha256sums=('95645aef4499ee8bd4437817ffc279e17072bca51ddf562950af3a9f4d2eb599'
            '1f7f95cf0b77aa3f01e9f08ed44e74d48155323bd6c2e6e136213f1e559e7445'
            '5e1883292c88dc690230302dca80c9fe310fe789da9a564563bcef936b073b11'
            '049de9bd7addb5c039aab6144bd6cb4491817c77527b90af71cebb2956f514b5'
            '04f7f373cef17776e378a29087910069e0202e89348c7e9dcc3e2b13f4d2044c'
            'a998a204cbb30f896cbcf1d919f8da833280f675f48bc444548536956aff5fd5'
            '92c0d332326b363b2d1df004e9ccd0be5a7cf6ac267db166abae81655fdb6501'
            '3703521384055c5784d648932de4e8a47fe31fe54bbb7159303d5b18e385f9a2'
            '015d5fc14ab6bb0e15c374398e210aae8dcd63135313b95575b50ab19fa3b146'
            '7534a5c931354434fc7db6842959554209b476737c998ee5b631200e825af334'
            'e1a9e6f69edaba2ac66091c3aa1c88fd08d38d0209fd26be2207d6fa605829ca'
            '5201c8b6b1d851779125cf849d5d48019f4282f7e5d38c8b1b339539220dbf34'
            '7fc73ec83e8a9b1dd7f0e90e3a49b97924a190c005ace6c03805023b4d33cb92'
            'ef4814851571b996a7ab088128132eebc15862decc4b03bec8066767e5eabf1f'
            '568dee7533c5bf28f3cba8a05dc60a195e02d8a2dbf2cf31368b9f2cf038ca13'
            '0fa86da3b15c39fb033f6a0e8a34d26d529bfa5ab01eb819155e163e4db2171f'
            '8eb86b99f74e832104221db85a443f918b6ed9a481a88f931146caf6c5dc2af8'
            'c78390bdcd36fadaaf519f69632eae3376370d794ccc7310489f7706aec5f200')

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
