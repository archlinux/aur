# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=rstudio-desktop
_vermajor=2023
_verminor=12
_verpatch=0
_versuffix=369
_gitcommit=960e8fa
_gitname=rstudio-rstudio-${_gitcommit}
pkgver=${_vermajor}.${_verminor}.${_verpatch}.${_versuffix}
_srcname=rstudio-${_vermajor}.${_verminor}.${_verpatch}-${_versuffix}
_nodever=18.18.2
_pandocver="current"
_quarto="FALSE"

pkgrel=1
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('x86_64')
url="https://www.rstudio.com/products/rstudio/"
license=('AGPL3')
depends=('r>=3.3.0' 'boost-libs' 'qt5-sensors' 'qt5-svg' 'qt5-webengine' 'qt5-xmlpatterns' 'postgresql-libs' 'sqlite3' 'soci' 'clang' 'hunspell-en_US' 'mathjax2' 'pandoc' 'yaml-cpp')
makedepends=('git' 'cmake>=3.6.3' 'boost' 'desktop-file-utils' 'jdk8-openjdk' 'apache-ant' 'unzip' 'openssl' 'libcups' 'pam' 'patchelf' 'wget' 'yarn')
optdepends=('git: for git support'
            'subversion: for subversion support'
            'openssh-askpass: for a git ssh access'
            'quarto: for Quarto projects support')

source=("rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/archive/refs/tags/v${_vermajor}.${_verminor}.${_verpatch}+${_versuffix}.tar.gz"
        "https://github.com/quarto-dev/quarto/archive/refs/heads/release/rstudio-cherry-blossom.zip"
        "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.gz"
        "qt.conf"
        "pandoc_version.patch")

sha256sums=('6ee6acdd361b526fdc5fc922600cec0f04a7fe8304ae62e5a65d5fd4c55e824c'
            'df3a040f0cf4ce1892519082dd6822a8ca433e9e4f02d9394ab2931733f7e5a6'
            'a44c3e7f8bf91e852c928e5d8bd67ca316b35e27eec1d8acbe3b9dbe03688dab'
            '723626bfe05dafa545e135e8e61a482df111f488583fef155301acc5ecbbf921'
            '286925c442c1818979714feeec1577f03ae8a3527d2478b0f55238e2272a0b9e')

prepare() {
    cd ${srcdir}/${_srcname}
    # Do not use outdated version name of pandoc
    patch -p1 < ${srcdir}/pandoc_version.patch

    cd "${srcdir}/${_srcname}/dependencies/common"
    install -d pandoc/${_pandocver}
 
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27
    ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/pandoc

    # Nodejs
    install -d node/${_nodever}
    cp -r "${srcdir}/node-v${_nodever}-linux-x64/"* node/${_nodever}

    # Fix links for src/cpp/session/CMakeLists.txt
    cd "${srcdir}/${_srcname}/dependencies"
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27

    # Panmirror is picked up now from Quarto repo
    # Ideally: git clone --branch release/rstudio-cherry-blossom https://github.com/quarto-dev/quarto.git "${srcdir}/${_srcname}/src/gwt/lib/quarto"
    mkdir -p "${srcdir}/${_srcname}/src/gwt/lib/quarto"
    cp -r "${srcdir}/quarto-release-rstudio-cherry-blossom/"* "${srcdir}/${_srcname}/src/gwt/lib/quarto"
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
    export RSTUDIO_VERSION_MAJOR=${_vermajor}
    export RSTUDIO_VERSION_MINOR=${_verminor}
    export RSTUDIO_VERSION_PATCH=${_verpatch}
    export RSTUDIO_VERSION_SUFFIX="+${_versuffix}"
    export GIT_COMMIT=${_gitcommit}
    export PACKAGE_OS=$(uname -om)
    
    cmake -S "${srcdir}/${_srcname}" -B build \
          -DRSTUDIO_TARGET=Desktop \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio \
          -DRSTUDIO_USE_SYSTEM_BOOST=yes \
          -DRSTUDIO_USE_SYSTEM_YAML_CPP=yes \
          -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake \
          -DBoost_NO_BOOST_CMAKE=ON \
          -DQUARTO_ENABLED=${_quarto} \
          -DRSTUDIO_USE_SYSTEM_SOCI=yes \
          -DRSTUDIO_BUNDLE_QT=FALSE
}

package() {
    # Install the program
    make -C build DESTDIR="${pkgdir}" install

    # Install the license
    install -Dm 644 "${srcdir}/${_srcname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/rstudio/bin/rstudio" "${pkgdir}/usr/bin/rstudio"

    # BUGFIX: qt5-webengine isn't init'ing properly. Likely an Rstudio bug.
    install -Dm 644 "${srcdir}/qt.conf" "${pkgdir}/usr/lib/qt/libexec/qt.conf"
}
