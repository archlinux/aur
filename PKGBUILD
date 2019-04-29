# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Frank Siegert < frank.siegert at googlemail dot com >
# Contributor: Scott Lawrence < bytbox at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail dot com >
# Contributor: Sebastian Voecking < voeck at web dot de >

pkgbase=root-py2
pkgname=('root-py2' 'root-cuda-py2')
_pkgbase=root
pkgver=6.16.00
pkgrel=2
pkgdesc='C++ data analysis framework and interpreter from CERN'
arch=('x86_64')
url='https://root.cern.ch'
license=('LGPL2.1')
makedepends=('ccache'
             'cern-vdt'
             'cfitsio'
             'cmake'
             'cuda'
             'fcgi'
             'fftw'
             'ftgl'
             'blas'
             'gcc-fortran'
             'giflib'
             'git'
             'gl2ps'
             'glew'
             'go-pie'
             'gsl'
             'hicolor-icon-theme'
             'intel-tbb'
             'libafterimage'
             'libmariadbclient'
             'librsvg'
             'libxpm'
             'ocaml'
             'ocaml-ctypes'
             'openssl'
             'postgresql-libs'
             'pythia8>=8.2.40-1'
             'python2'
             'python2-numpy'
             'sqlite'
             'tex-gyre-fonts'
             'unuran'
             'vc'
             'xmlrpc-c'
             'xrootd>=4.6.0-2'
             'xxhash>=0.6.5-1'
             'z3')
depends=('blas'
         'desktop-file-utils'
         'fcgi'
         'fftw'
         'ftgl'
         'giflib'
         'gl2ps'
         'glew'
         'gsl'
         'hicolor-icon-theme'
         'intel-tbb'
         'libafterimage'
         'librsvg'
         'libxpm'
         'tex-gyre-fonts'
         'xxhash>=0.6.5-1')
optdepends=('cfitsio: Read images and data from FITS files'
            'cern-vdt: Add a set of fast and vectorisable mathematical functions'
            'libmariadbclient: MySQL support'
            'openssl: OpenSSL support'
            'postgresql-libs: PostgreSQL support'
            'pythia8>=8.2.40-1: Pythia8 EG support'
            'sqlite: SQLite support'
            'tcsh: Legacy CSH support'
            'unuran: Support non-uniform random numbers'
            'vc: Add types for portable and intuitive SIMD programming'
            'libxml2: XML parser interface'
            'xrootd: Support remote file server and client')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
        'root.xml'
        'rootd'
        'settings.cmake'
        'settings-cuda.cmake'
        'fix_compile_time_install_clad.patch'
        'adding_directories_needed_to_use_libxml.patch'
        'rename_based_fix_for_rconfig_on_case_sensitive_systems.patch')
sha256sums=('2a45055c6091adaa72b977c512f84da8ef92723c30837c7e2643eecc9c5ce4d8'
            '50c08191a5b281a39aa05ace4feb8d5405707b4c54a5dcba061f954649c38cb0'
            '3c45b03761d5254142710b7004af0077f18efece7c95511910140d0542c8de8a'
            '0110fd393a6de68c9d65abad7ec626b298e0bb4431210e6cd75285078052a39a'
            '114c6ae5ac03ebed30f93ccf9431475eb797086e1a9d97d45f84e59c7212b09d'
            'de32dcc6c9d8527cb08360a2703c1ca1e586a5b7cc12ea12fd07125795ea5104'
            '51e5de01a423b89c113d19918c731a060e6d9b018d086c97b3dde10818cbd1fe'
            '09fabd3927a57b9a1e0cda7dfe3a53e82eea5ae1fe1c47f778e751603b1c0549')
get_py2ver () {
    python2 -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}
prepare() {
    # cd "${srcdir}/${_pkgbase}-${pkgver}"

    2to3 -w "${srcdir}/${_pkgbase}-${pkgver}"/etc/dictpch/makepch.py 2>&1 > /dev/null

    patch -d "${srcdir}/${_pkgbase}-${pkgver}" -Np1 -i "${srcdir}/fix_compile_time_install_clad.patch"
    patch -d "${srcdir}/${_pkgbase}-${pkgver}" -Np1 -i "${srcdir}/adding_directories_needed_to_use_libxml.patch"
    patch -d "${srcdir}/${_pkgbase}-${pkgver}" -Np1 -i "${srcdir}/rename_based_fix_for_rconfig_on_case_sensitive_systems.patch"

    # don't let ROOT play around with lib paths
    sed -i -e 's@SetLibraryPath();@@g' \
        "${srcdir}/${_pkgbase}-${pkgver}/rootx/src/rootx.cxx"

    # trust system to find GSL
    rm "${srcdir}/${_pkgbase}-${pkgver}/cmake/modules/FindGSL.cmake"

    cp -r "${_pkgbase}-${pkgver}" "${_pkgbase}-${pkgver}-cuda"
}

build() {
    ## ROOT
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    CFLAGS="${CFLAGS} -pthread" \
    CXXFLAGS="${CXXFLAGS} -pthread" \
    LDFLAGS="${LDFLAGS} -pthread -Wl,--no-undefined" \
    cmake -C "${srcdir}/settings.cmake" -DTARGET_ARCHITECTURE:STRING=generic -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    "${srcdir}/${_pkgbase}-${pkgver}"

    cd "${srcdir}/build"
    make

    ## ROOT with CUDA
    mkdir -p "${srcdir}/build-cuda"
    cd "${srcdir}/build-cuda"

    CFLAGS="${CFLAGS} -pthread" \
    CXXFLAGS="${CXXFLAGS} -pthread" \
    LDFLAGS="${LDFLAGS} -pthread -Wl,--no-undefined" \
    cmake -C "${srcdir}/settings-cuda.cmake" -DTARGET_ARCHITECTURE:STRING=generic -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    "${srcdir}/${_pkgbase}-${pkgver}-cuda"

    cd "${srcdir}/build-cuda"
    make
}

package_root-py2() {
    provides=('root' 'python2-pyroot')
    conflicts=('root' 'python-pyroot')
    optdepends+=('gcc-fortran: Enable the Fortran components of ROOT')
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install

    # fix python env call
    sed -e 's/@python@/python2/' -i "${pkgdir}/usr/lib/root/cmdLineUtils.py"

    # try to deal with weird PyROOT, PyMVA and JupyROOT stuff
    install -d "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages"
    ln -s "/usr/lib/root/ROOT.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/_pythonization.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/cmdLineUtils.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/cppyy.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/JsMVA/" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/JupyROOT/" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libPyROOT.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libPyMVA.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libJupyROOT.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"

    install -D "${srcdir}/rootd" \
        "${pkgdir}/etc/rc.d/rootd"
    install -D -m644 "${srcdir}/root.xml" \
        "${pkgdir}/usr/share/mime/packages/root.xml"

    install -D -m644 "${srcdir}/${_pkgbase}-${pkgver}/build/package/debian/root-system-bin.desktop.in" \
        "${pkgdir}/usr/share/applications/root-system-bin.desktop"

    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i "${pkgdir}/usr/share/applications/root-system-bin.desktop"

    install -D -m644 "${srcdir}/${_pkgbase}-${pkgver}/build/package/debian/root-system-bin.png" \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png"

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo '/usr/lib/root' > "${pkgdir}/etc/ld.so.conf.d/root.conf"

    rm -rf "${pkgdir}/etc/root/daemons"
}

package_root-cuda-py2() {
    pkgdesc='C++ data analysis framework and interpreter from CERN with GPU (CUDA) features enabled'
    provides=('root' 'python2-pyroot')
    conflicts=('root' 'python2-pyroot')
    depends+=('cuda')
    cd "${srcdir}/build-cuda"

    make DESTDIR="${pkgdir}" install

    # fix python env call
    sed -e 's/@python@/python2/' -i "${pkgdir}/usr/lib/root/cmdLineUtils.py"

    # try to deal with weird PyROOT, PyMVA and JupyROOT stuff
    install -d "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages"
    ln -s "/usr/lib/root/ROOT.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/_pythonization.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/cmdLineUtils.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/cppyy.py" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/JsMVA/" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/JupyROOT/" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libPyROOT.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libPyMVA.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"
    ln -s "/usr/lib/root/libJupyROOT.so" "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/"

    install -D "${srcdir}/rootd" \
        "${pkgdir}/etc/rc.d/rootd"
    install -D -m644 "${srcdir}/root.xml" \
        "${pkgdir}/usr/share/mime/packages/root.xml"

    install -D -m644 "${srcdir}/${_pkgbase}-${pkgver}-cuda/build/package/debian/root-system-bin.desktop.in" \
        "${pkgdir}/usr/share/applications/root-system-bin.desktop"

    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i "${pkgdir}/usr/share/applications/root-system-bin.desktop"

    install -D -m644 "${srcdir}/${_pkgbase}-${pkgver}-cuda/build/package/debian/root-system-bin.png" \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png"

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo '/usr/lib/root' > "${pkgdir}/etc/ld.so.conf.d/root.conf"

    rm -rf "${pkgdir}/etc/root/daemons"
}
