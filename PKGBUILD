# Maintainer: ReneganRonin <renegan.ronin@gmail.com>

pkgname=madanalysis5
_majorversion=1
_minorversion=8
_maintenanceversion=59
pkgver=${_majorversion}.${_minorversion}.${_maintenanceversion}
_patch=1
pkgrel=1
arch=('x86_64')
license=('MIT')
depends=('tcsh' 'perl' 'python2')
makedepends=('gcc' 'make')
optdepends=('delphes' 'zlib' 'fastjet' 'texlive-core' 'texlive-bin')
source=("https://launchpad.net/${pkgname}/trunk/v${_majorversion}.${_minorversion}/+download/MadAnalysis5_v${_majorversion}.${_minorversion}_patch${_patch}.tgz"
"python2.patch"
        "no_check.patch"
        "mg5-ma5-fix.patch"
        "ma5.exp")


md5sums=('19192c11544d3971bcf89c6f91e81538'
         '1b22af322bf9a845ff4e3aef70eb01db'
         '1769cc46742b2f91d35052f7f5ebb258'
         'c6e82ddb7d1639ce57e0556790c5e294'
         'a0b10f6f274b9e1d55b99cb63f265168')



prepare() {
    warning "Optional dependencies should be installed first if they are to be recognized by MadAnalysis 5"

    msg2 "Fixing python references for python2"
    patch -p 1 < python2.patch
}

build() {
    
    msg2 "Installing delphes to tools"
    cd ./madanalysis5/tools
    git clone https://github.com/delphes/delphes.git
    cd delphes
    make
    cd ../../../

    msg2 "Initializing MA5 first run"
    expect -f ma5.exp
    printf '\n'
    

    # Fix paths in certain files
    files=(
        tools/architecture.ma5
        tools/SampleAnalyzer/setup.sh
        tools/SampleAnalyzer/setup.csh
        tools/delphes/doc/Makefile.arch
        tools/SampleAnalyzer/Interfaces/Makefile_delphes
        tools/delphes/examples/ExternalFastJet/Makefile
    )
    for f in "${files[@]}"; do
        sed -i "s#${srcdir}/${pkgname}#/opt/${pkgname}#g" "${pkgname}/$f"
    done

    # Prevent MA5 from checking for new builds as they are built on first install
    patch -p 1 < no_check.patch

    msg2 "Compiling python source files"
    python2 -O -m compileall -qf "${srcdir}/${pkgname}" 2>&1 1>/dev/null || true
}

package() {
    
# Copy everything of /opt/madanalysis5 since expects a particular directory
    # structure.
    install -dm755 "${pkgdir}/opt"
    cp -a "${srcdir}/${pkgname}" "${pkgdir}/opt/"

    # Create symbolic links in /usr/bin to ma5
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/ma5" "${pkgdir}/usr/bin/"

    # Fix symbolic links within the package
    symlinks=(
        ClassesDict_rdict.pcm
        ExRootAnalysisDict_rdict.pcm
        FastJetDict_rdict.pcm
        libDelphes.so
        ModulesDict_rdict.pcm
    )
    for l in "${symlinks[@]}"; do
        ln -fs "/opt/${pkgname}/tools/delphes/$l" "${pkgdir}/opt/madanalysis5/tools/SampleAnalyzer/ExternalSymLink/Lib/"
    done
}
