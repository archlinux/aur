# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=rstudio-desktop
_vermajor=2024
_verminor=04
_verpatch=1
_versuffix=748
_gitcommit=3ada7c6
_gitname=rstudio-rstudio-${_gitcommit}
pkgver=${_vermajor}.${_verminor}.${_verpatch}.${_versuffix}
_srcname=rstudio-${_vermajor}.${_verminor}.${_verpatch}-${_versuffix}
_pandocver="current"
_sociver="4.0.3"
_quarto="FALSE"

pkgrel=4
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('x86_64')
url="https://github.com/rstudio/rstudio"
license=('AGPL-3.0-only')
depends=('r>=3.3.0' 'boost-libs' 'qt5-sensors' 'qt5-svg' 'qt5-webengine' 'qt5-xmlpatterns' 'postgresql-libs' 'sqlite3' 'clang' 'hunspell-en_US' 'mathjax2' 'pandoc' 'yaml-cpp')
makedepends=('git' 'cmake>=3.29' 'boost' 'ninja' 'desktop-file-utils' 'jdk8-openjdk' 'apache-ant' 'unzip' 'openssl' 'libcups' 'pam' 'patchelf' 'wget' 'yarn')
optdepends=('git: for git support'
            'subversion: for subversion support'
            'openssh-askpass: for a git ssh access'
            'quarto: for Quarto projects support')

source=("rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/archive/refs/tags/v${_vermajor}.${_verminor}.${_verpatch}+${_versuffix}.tar.gz"
        "git+https://github.com/quarto-dev/quarto.git#branch=release/rstudio-cherry-blossom"
        "https://github.com/SOCI/soci/archive/refs/tags/v${_sociver}.tar.gz"
        "qt.conf"
        "0002-allow_system_node.patch")

sha256sums=('5c1190ae22e3a25740727ff1f341ef568f47359a0d1358958ec22f7e5b59b75b'
            'SKIP'
            '4b1ff9c8545c5d802fbe06ee6cd2886630e5c03bf740e269bb625b45cf934928'
            '723626bfe05dafa545e135e8e61a482df111f488583fef155301acc5ecbbf921'
            'ad4bd3076ff2bff7d075e3928a7e55c618fa744e3bf5d3d387bf70e01ff96c2f')

options=('!emptydirs' '!debug')

prepare() {
    cd ${srcdir}/${_srcname}
    msg "Do not use outdated version name of pandoc"
    sed -i '/PANDOC_VERSION/s/2.18/current/' "${srcdir}/${_srcname}/CMakeGlobals.txt"

    msg "Suppress _FORTIFY_SOURCE mismatch warnings"
    sed -i 's/D_FORTIFY_SOURCE=2/D_FORTIFY_SOURCE=3/' "${srcdir}/${_srcname}/src/cpp/CMakeLists.txt"

    # Add option to use system node
    patch -p3 < ${srcdir}/0002-allow_system_node.patch

    cd "${srcdir}/${_srcname}/dependencies/common"
    install -d pandoc/${_pandocver}
 
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27
    ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/pandoc

    # Fix links for src/cpp/session/CMakeLists.txt
    cd "${srcdir}/${_srcname}/dependencies"
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27

    # Bundled SOCI libs
    ln -sfT "${srcdir}/soci-${_sociver}" "soci-${_sociver}"

    # Panmirror is picked up from Quarto repo
    ln -sfT "${srcdir}/quarto" "${srcdir}/${_srcname}/src/gwt/lib/quarto"
}

build() {
    # Quarto set up
    if (pacman -Q quarto >/dev/null 2>/dev/null) ; then
        _quarto="TRUE"
        msg "Quarto is installed, include it to build"
        cd "${srcdir}/${_srcname}/dependencies"
        install -d quarto/bin/tools
        ln -sfT /usr/bin/quarto quarto/bin/quarto
        ln -sfT /usr/bin/pandoc quarto/bin/tools/pandoc
    else
        _quarto="FALSE"
        msg "Quarto is not installed, use Pandoc"
        cd "${srcdir}/${_srcname}/dependencies"
        install -d pandoc/${_pandocver}/bin/tools
        ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/bin/tools/pandoc
    fi

    cd "${srcdir}/${_srcname}/dependencies/soci-${_sociver}"
    msg "Building SOCI libs..."

    local _CMAKE_SOCI_OPTIONS=(
      -DCMAKE_POLICY_DEFAULT_CMP0063="NEW"
      -DCMAKE_POLICY_DEFAULT_CMP0074="NEW"
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true
      -DCMAKE_CXX_VISIBILITY_PRESET="$COMPILE_VISIBILITY"
      -DSOCI_TESTS=OFF
      -DSOCI_CXX11=ON
      -DSOCI_EMPTY=OFF
      -DWITH_BOOST=ON
      -DWITH_POSTGRESQL=ON
      -DWITH_SQLITE3=ON
      -DWITH_DB2=OFF
      -DWITH_MYSQL=OFF
      -DWITH_ORACLE=OFF
      -DWITH_FIREBIRD=OFF
      -DWITH_ODBC=OFF
    )

    cmake -G Ninja -S "${srcdir}/${_srcname}/dependencies/soci-${_sociver}" -B build "${_CMAKE_SOCI_OPTIONS[@]}"
    cmake --build build --target all

    export LDFLAGS="${LDFLAGS} -L${srcdir}/${_srcname}/dependencies/soci-${_sociver}/build/lib"

    cd ${srcdir}
    msg "Downloading and installing R packages..."
    export R_LIBS_USER="${srcdir}/${_srcname}/dependencies/R"
    _JOBS="$(grep -oP -- "-j\s*\K[0-9]+" <<< "${MAKEFLAGS}")" || _JOBS="1"
    mkdir -p "${R_LIBS_USER}"
    for RPKG in rmarkdown renv testthat xml2 yaml; do
        RINSTALLCMD="if("'!'"require($RPKG, quietly = TRUE)) { options(Ncpus = ${_JOBS} ); install.packages('$RPKG', lib='$R_LIBS_USER', repos='https://cran.rstudio.com/') }"
        echo "> $RINSTALLCMD"
        Rscript -e "$RINSTALLCMD"
    done

    export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:${PATH}
    export RSTUDIO_TOOLS_ROOT="${srcdir}/${_srcname}/dependencies"
    export RSTUDIO_NODE_PATH=/usr/
    export RSTUDIO_VERSION_MAJOR=${_vermajor}
    export RSTUDIO_VERSION_MINOR=${_verminor}
    export RSTUDIO_VERSION_PATCH=${_verpatch}
    export RSTUDIO_VERSION_SUFFIX="+${_versuffix}"
    export GIT_COMMIT=${_gitcommit}
    export PACKAGE_OS=$(uname -om)

    # node-gyp or node have a bug that prevents building with "text file busy"
    # if the kernel is too fast, so we have to disable IO_URING support. This
    # is cleary a hack and needs to be removed as soon as possible
    # nodejs/node#48444 is the necro bumped thread
    # originally from docker
    # https://github.com/nodejs/node/issues/48444
    export UV_USE_IO_URING=0

    # -DCMAKE_INSTALL_PREFIX seems ignored for sub-dependencies, 
    # which results as empty '/usr/local/bin' in package
    # Following override works for cmake >3.29
    export CMAKE_INSTALL_PREFIX=/usr/lib/rstudio
    
    local _CMAKE_RSTUDIO_OPTIONS=(
      -DRSTUDIO_TARGET=Desktop
      -DCMAKE_BUILD_TYPE=Release
      -DRSTUDIO_USE_SYSTEM_BOOST=yes
      -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake
      -DBoost_NO_BOOST_CMAKE=ON
      -DQUARTO_ENABLED=${_quarto}
      -DRSTUDIO_USE_SYSTEM_NODE=yes
      -DRSTUDIO_BUNDLE_QT=FALSE
    )
    cmake -G Ninja -S "${srcdir}/${_srcname}" -B build "${_CMAKE_RSTUDIO_OPTIONS[@]}"
    cmake --build build
}

package() {

    # Install the program
    DESTDIR="${pkgdir}" cmake --install build

    # Install the license
    install -Dm 644 "${srcdir}/${_srcname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/rstudio/bin/rstudio" "${pkgdir}/usr/bin/rstudio"

    # BUGFIX: qt5-webengine isn't init'ing properly. Likely an Rstudio bug.
    install -Dm 644 "${srcdir}/qt.conf" "${pkgdir}/usr/lib/qt/libexec/qt.conf"
}
