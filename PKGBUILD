# Maintainer: Artem Klevtsov <a.a.klevtso@gmail.com>
# Maintainer: Stephen Martin <hwkiller@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=rstudio-desktop
_vermajor="2022"
_verminor="12"
_verpatch="0"
_versuffix="353"
_gitcommit="7d165dc"
_gitname=rstudio-rstudio-${_gitcommit}
pkgver=${_vermajor}.${_verminor}.${_verpatch}.${_versuffix}
_srcname=rstudio-${_vermajor}.${_verminor}.${_verpatch}-${_versuffix}
_gwtver=2.8.2
_ginver=2.1.2
_nodever=16.14.0
_pandocver="current"
_quarto="FALSE"

pkgrel=2
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('x86_64')
url="https://www.rstudio.com/products/rstudio/"
license=('AGPL3')
depends=('r>=3.3.0' boost-libs qt5-sensors qt5-svg qt5-webengine qt5-xmlpatterns postgresql-libs sqlite3 soci clang hunspell-en_US mathjax2 pandoc yaml-cpp)
makedepends=(git 'cmake>=3.1.0' boost desktop-file-utils jdk8-openjdk apache-ant unzip openssl libcups pam patchelf wget yarn)
optdepends=('git: for git support'
            'subversion: for subversion support'
            'openssh-askpass: for a git ssh access'
            'quarto: for Quarto projects support')

provides=('rstudio-desktop')
conflicts=('rstudio-desktop' 'rstudio-desktop-bin' 'rstudio-desktop-preview' 'rstudio-desktop-git')
source=("rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/archive/refs/tags/v${_vermajor}.${_verminor}.${_verpatch}+${_versuffix}.tar.gz"
        "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.gz"
        "qt.conf"
        "pandoc_version.patch"
        "boost_1.81.patch")

sha256sums=('e4f3503e2ad4229301360f56fd5288e5c8e769c490073dae7fe40366237ecce0'
            '2c69e7b040c208b61ebf9735c63d2e5bcabfed32ef05a9b8dd5823489ea50d6b'
            '723626bfe05dafa545e135e8e61a482df111f488583fef155301acc5ecbbf921'
            '286925c442c1818979714feeec1577f03ae8a3527d2478b0f55238e2272a0b9e'
            'f9ac8311181126f163898d9e02198765ac8b23ec70cb2ae0d910ac62017a9677')

noextract=("gin-${_ginver}.zip")

prepare() {
    cd ${srcdir}/${_srcname}
    # Do not use outdated version name of pandoc
    patch -p1 < ${srcdir}/pandoc_version.patch

    # Boost 1.81 - see here https://github.com/jgenco/jgenco-overlay/issues/4#issuecomment-1368061420
    patch -p1 < ${srcdir}/boost_1.81.patch

    cd "${srcdir}/${_srcname}/dependencies/common"
    install -d pandoc/${_pandocver}
 
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27
    ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/pandoc

    # Nodejs
    install -d node/${_nodever}
    cp -r "${srcdir}/node-v${_nodever}-linux-x64/"* node/${_nodever}
    cd "${srcdir}/${_srcname}/src/gwt/panmirror/src/editor"
    yarn config set ignore-engines true
    yarn install

    # Fix links for src/cpp/session/CMakeLists.txt
    cd "${srcdir}/${_srcname}/dependencies"
    ln -sfT /usr/share/myspell/dicts dictionaries
    ln -sfT /usr/share/mathjax2 mathjax-27
    #ln -sfT /usr/bin/pandoc pandoc
}

build() {

    # Quarto
    msg "Checking if Quarto is installed..."

    if (pacman -Q quarto >/dev/null) ; then
        msg "Enabling Quarto support..."
        _quarto="TRUE"
        cd "${srcdir}/${_srcname}/dependencies"
        install -d quarto/bin/tools
        ln -sfT /usr/bin/quarto quarto/bin/quarto
        ln -sfT /usr/bin/pandoc quarto/bin/tools/pandoc
    else
        msg "Use pandoc, because Quarto is not used..."
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
#   make -C build
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
