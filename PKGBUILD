# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.26.0
_debver=1
pkgver=${_omver}
pkgrel=1
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

sha256sums=('d7e3b48965cca96e7fa3b3b845f214fe4aa2fd5113b7a8f306dc2f83e80c6527'
            '3a7a5c8e1d5c1c72e589bc2a7c01212e734120622cfeff38b728e9d89b9f3c6e'
            '0a9fb912f16a58d9647eecc9f4fc9eb01a39601f50ba2ed17498d1ffa52a27b5'
            '4c037c57dca753d3fcb14a0278027d281f93ddce5cefec2ead63f1d32e73a2b0'
            'bb87b3d5778d6d7b1e34c6ef24c8d3742398bb3d6606cd789fef37dad9057f33'
            '93e39428e31767667a577f866cb1f2a8165b78f41d3e5dc7ea1b3719446f25eb'
            'ce7cd9045dd1b72c1c6513299f3f80254591ad8e625c6b5e47a873aeb706498b'
            'e043552b92fe4c0e7c0df6af8d796b5a51348d5466eab0109095fcc690eb73a3'
            '302d16a3eee13a23d57ef8e275650eb1f0a1ec072cc512600d973b1278bb3c1b'
            '82ae138917746eaf9f97901cd4ab072b668a16d180b8b7823786ec90c4da3d99'
            'f6afa47a366286873c8a0e1b5398197a2764a676434b38dfe979dc1e68a655e3'
            'a1dd9007a3f5fb6060be02213690262a94979f7206ee9c0d4cf01b941cfcf46a'
            '3a84435ee759625be440c1211d8cbd41580746a7f354d9c95795263be2a629bc'
            '62cd0404d940fb2b5f8f9adde00be478d2c11e711979f2eb5fdd8aa7cd1336db'
            '747dec95ee25ec6ceec30eb12cd655e096d880e1cfad685ddb20fb9409b7c313'
            'b4c4c0a8e5a80c20742f60a8b60399218b71d1863bbd699f3f756ef97d0780c1'
            '88af437e8ab1ce723421f19f3ba613a13a8dc4fc999373f48486f720d97ed1b4'
            'd85293398a929b3e133440aa88eed95ea45b1e332659a3a1ac1f06e52793fcd0')

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
