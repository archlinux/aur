# Maintainer: Artem Klevtsov <a.a.klevtso@gmail.com>

pkgname=rstudio-desktop-git
_gitname=rstudio
pkgver=0.99.636
_gwtver=2.7.0
_ginver=1.5
pkgrel=1
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="https://www.rstudio.com/products/rstudio/"
license=('AGPL3')
depends=('boost-libs>=1.5' 'r>=2.11.1' 'hicolor-icon-theme' 'shared-mime-info' 'qt5-webkit' 'hunspell-en' 'mathjax' 'pandoc-bin')
makedepends=('git' 'cmake>=2.8' 'boost>=1.5' 'java-runtime' 'apache-ant' 'unzip' 'openssl' 'pango' 'libcups' 'qt5-svg' 'pam' 'wget')
optdepends=('git: for git support'
	    'subversion: for subversion suuport'
	    'openssh-askpass: for a git ssh access')
provides=('rstudio-desktop' 'rstudio-desktop-bin' 'rstudio-desktop-preview')
conflicts=('rstudio-desktop' 'rstudio-desktop-bin' 'rstudio-desktop-preview')
install="${pkgname}.install"

source=("git+https://github.com/rstudio/rstudio.git"
        "https://s3.amazonaws.com/rstudio-buildtools/gin-${_ginver}.zip"
        "https://s3.amazonaws.com/rstudio-buildtools/gwt-${_gwtver}.zip")
md5sums=('SKIP'
         '2409168cc18bf5f341e107e6887fe359'
         'a8f3704a597b392910ea060284f21a03')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags --abbrev=0 | sed 's|v||g'
}

prepare() {
    cd "${srcdir}/${_gitname}"
    install -d src/gwt/lib/{gin,gwt/$_gwtver}
    cp -r "${srcdir}/gwt-${_gwtver}/"* "src/gwt/lib/gwt/${_gwtver}"
    unzip -qfod "src/gwt/lib/gin/${_ginver}" "${srcdir}/gin-${_ginver}.zip"

    cd "${srcdir}/${_gitname}/dependencies/common"
    install -d dictionaries mathjax-23 pandoc libclang/{3.5,builtin-headers}

    msg "Downloading and installing packages"
    ./install-packages

    # Temporary fix for the Qt 5.5
    cd "${srcdir}/${_gitname}/src/cpp/desktop/3rdparty/qtsingleapplication"
    sed -i 's|#include <QTime>|#include <QDataStream>\n#include <QTime>|' qtlocalpeer.cpp
}

build() {
    rm -rf "${srcdir}/${_gitname}/build"
    mkdir "${srcdir}/${_gitname}/build"
    cd "${srcdir}/${_gitname}/build"
    cmake -DRSTUDIO_TARGET=Desktop \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio \
          -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5 ..
}

package() {
    cd "${srcdir}/${_gitname}/build"
    # Install the program
    make DESTDIR="${pkgdir}" install
    # Install the license
    install -Dm 644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    # Creaate symlinks
    install -d "${pkgdir}/usr/bin"
    ln -sf /usr/lib/rstudio/bin/rstudio "${pkgdir}/usr/bin/rstudio"
    rm -rf "${pkgdir}/usr/lib/rstudio/resources/dictionaries"
    ln -sf /usr/share/myspell/dicts "${pkgdir}/usr/lib/rstudio/resources/dictionaries"
    rm -rf "${pkgdir}/usr/lib/rstudio/resources/mathjax-23"
    ln -sf /usr/share/mathjax "${pkgdir}/usr/lib/rstudio/resources/mathjax-23"
    install -d "${pkgdir}/usr/lib/rstudio/bin/pandoc"
    ln -sf /usr/bin/pandoc "${pkgdir}/usr/lib/rstudio/bin/pandoc/pandoc"
    ln -sf /usr/bin/pandoc-citeproc "${pkgdir}/usr/lib/rstudio/bin/pandoc/pandoc-citeproc"
    # Remove empty directories
    rm -rf "${pkgdir}/usr/lib/rstudio/resources/libclang"
}
