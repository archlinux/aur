#Maintainer: sukanka <su975853527 AT gmail.com>

_pkgname=jasp
_pkgver=0.19.1
pkgname=jasp-desktop
pkgver=0.19.1
_ColumnEncoder_ver=0.19.0
pkgrel=2
pkgdesc="A complete statistical package for both Bayesian and Frequentist statistical methods"
arch=('x86_64' 'aarch64')
url="https://github.com/jasp-stats/jasp-desktop"
license=('AGPL-3.0-or-later')
makedepends=("cmake" 'boost' 'jsoncpp'
    'openssl'
    'autoconf'
    'zlib'
    'bison'
    'flex'
    'jags'
    'gcc-fortran'
    'qtcreator'
    'git'
    'patchelf'
    'ninja'
)
depends=('r'
    'qt6-5compat'
    'readstat'
    'libarchive'
    'r-rinside'
    'qt6-base'
    'qt6-webengine'
    'qt6-shadertools'

    # jaspBase
    "r-jaspbase"
    "r-jaspgraphs"
    "r-jasptools"

    #jaspCommon
    "r-jaspdescriptives"
    "r-jaspttests"
    "r-jaspanova"
    "r-jaspmixedmodels"
    "r-jaspregression"
    "r-jaspfrequencies"
    "r-jaspfactor"

    #jaspExtra
    "r-jaspaudit"
    "r-jaspbain"
    "r-jaspbsts"
    "r-jaspcircular"
    "r-jaspcochrane"
    "r-jaspdistributions"
    "r-jaspequivalencettests"
    "r-jaspjags"
    "r-jasplearnbayes"
    "r-jasplearnstats"
    "r-jaspmachinelearning"
    "r-jaspmetaanalysis"
    "r-jaspnetwork"
    "r-jasppower"
    "r-jaspprocess"
    "r-jaspprophet"
    "r-jasppredictiveanalytics"
    "r-jaspreliability"
    "r-jasprobustttests"
    "r-jaspsem"
    "r-jaspsummarystatistics"
    "r-jaspsurvival"
    "r-jasptimeseries"
    "r-jaspvisualmodeling"
    "r-jaspacceptancesampling"
    "r-jaspqualitycontrol"
)
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jasp-stats/jasp-desktop/archive/refs/tags/v${pkgver}.tar.gz"
    'jasp.sh'
    "jaspColumnEncoder-${_pkgver}.tar.gz::https://github.com/jasp-stats/jaspColumnEncoder/archive/refs/tags/v${_ColumnEncoder_ver}.tar.gz"
)
sha256sums=('c6395a4327f94346c61822ee8647d061972d52b2bf1dadad1c8c38a11f396cba'
            'e0714d980e7549b4c7dcbae50370e95b6ad2e7f0cf21a534ceb3a5a83ee583fd'
            'd9e74e0ff2b7c6d15c109717c212480f9021f86fdd0c326088143476ba051033')

prepare() {
    cp -ar jaspColumnEncoder-${_ColumnEncoder_ver}/* ${pkgname}-${pkgver}/Common/jaspColumnEncoder
    cd $srcdir/${pkgname}-${pkgver}

    find Tools/CMake -name *.cmake -print0 | xargs -0 sed -i "s|/usr/local|/usr|g"
    sed -i "s|lib='\${R_LIBRARY_PATH}'|lib='${srcdir}/usr/lib/R'|g" Tools/CMake/R.cmake

    # Do NOT install modules here, they are listed in dependencies
    find Modules/ -name '*.in' -print0 | xargs -0 sed -i '1,$d;1a print("I am OK!")'
}

build() {
    local cmake_args=(
        -GNinja
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr/lib/${pkgname}
        -DCMAKE_INSTALL_LIBDIR=lib
        # -DCUSTOM_R_PATH=/usr/lib/R
        -DLINUX_LOCAL_BUILD=OFF
        -DFLATPAK_USED=OFF
        -DINSTALL_R_MODULES=OFF
        -DBUILD_TESTS=OFF
        -DGITHUB_PAT=None

    )
    # export GITHUB_PAT="None"
    install -d build ${srcdir}/usr/lib/R
    cmake -S ${pkgname}-${pkgver} -B build "${cmake_args[@]}"
    ninja -C build
}

package() {
    cd $srcdir/build
    DESTDIR=${pkgdir} ninja install
    install -Dm755 $srcdir/jasp.sh ${pkgdir}/usr/bin/jasp

    cd ${pkgdir}/usr/lib/${pkgname}
    mv share ${pkgdir}/usr
    mv Resources ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname} ${pkgdir}/usr/lib/${pkgname}/Resources

    rm -rf lib64
    rm -rf Modules/{renv-cache,*.log}

    # fix RPATH
    patchelf --add-rpath /usr/lib/R/library/RInside/lib/ \
        ${pkgdir}/usr/lib/jasp-desktop/bin/JASPEngine
    sed -i "s|^Exec.*|Exec=jasp %f|g" \
        ${pkgdir}/usr/share/applications/org.jaspstats.JASP.desktop

    rm -rf ${pkgdir}/usr/lib/jasp-desktop/{renv-root,renv-cache,bin/org.jaspstats.JASP}
}
