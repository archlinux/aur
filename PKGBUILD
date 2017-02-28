# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madanalysis5
pkgver=1.5_patch1
pkgrel=2
pkgdesc="MadAnalysis 5 is a framework for phenomenological investigations at particle colliders"
url="https://launchpad.net/madanalysis5"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2'
         'tcsh')
optdepends=('delphes'
            'fastjet'
            'python2-matplotlib'
            'root'
            'root'
            'zlib')
makedepends=("expect")
source=("https://launchpad.net/madanalysis5/trunk/v${pkgver%%_*}/+download/MA5_v${pkgver}.tgz"
        "python2.patch"
        "no_check.patch"
        "mg5-ma5-fix.patch"
        "ma5.exp")
sha256sums=('8db144d9d14ca8dfe549ad2419e45c9cf4dcf638a84f99d1dcda6cf57fa1c88d'
            'bd2dec07df0a6fb21b7a420d0d769ebd397a2b2a286a44b4b92dac6700c5d8db'
            '3676bb6ca83b98f00cc3d423690736c107f1c84bdced25420938e046ce0cbaac'
            '2ade85747136f13b32b2ba09db90d6281c95b76d08e1189a8735b469dc5d6ac0'
            '53e89bfc493faf732ab51d57d4d1268ddd65bcaec73fc71a08e8c42f11ef2571')

prepare() {
    warning "Optional dependencies should be installed first if they are to be recognized by MadAnalysis 5"

    msg2 "Fixing python references for python2"
    patch -p 1 < python2.patch

    msg2 "Bringing forward fix for MadGraph-MadAnalysis interface bug"
    patch -d ${pkgname} -p 0 < mg5-ma5-fix.patch
}

build() {
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
    mkdir -p "${pkgdir}/opt"
    cp -a "${srcdir}/${pkgname}" "${pkgdir}/opt/"

    # Create symbolic links in /usr/bin to ma5
    mkdir -p "${pkgdir}/usr/bin"
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

# Local Variables:
# mode: sh
# End:
