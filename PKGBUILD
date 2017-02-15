# Maintainer: Artem Klevtsov <a.a.klevtso@gmail.com>

pkgname=rstudio-desktop-git
_gitname=rstudio
pkgver=1.1.74
_gwtver=2.7.0
_ginver=1.5
_clangver=3.8.0
pkgrel=1
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="https://www.rstudio.com/products/rstudio/"
license=('AGPL3')
depends=('boost-libs>=1.5' 'r>=2.11.1' 'hicolor-icon-theme' 'shared-mime-info' 'hunspell-en' 'mathjax' 'pandoc'  'qt5-webkit' 'qt5-svg' 'clang')
makedepends=('git' 'cmake>=2.8' 'boost>=1.5' 'java-runtime=8' 'apache-ant' 'unzip' 'openssl' 'pango' 'libcups' 'pam' 'wget')
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
    msg "Extracting dependencies"
    cd "${srcdir}/${_gitname}/src/gwt"
    install -d lib/{gin,gwt}
    install -d lib/gin/${_ginver}
    install -d lib/gwt/${_gwtver}
    unzip -qo "${srcdir}/gin-${_ginver}.zip" -d lib/gin/${_ginver}
    cp -r "${srcdir}/gwt-${_gwtver}/"* lib/gwt/${_gwtver}

    cd "${srcdir}/${_gitname}/dependencies/common"
    install -d dictionaries pandoc libclang/{3.5,builtin-headers}

    ln -sfT "/usr/share/mathjax" mathjax-26
    ln -sfT "/usr/bin/pandoc" pandoc/pandoc
    ln -sfT "/usr/bin/pandoc-citeproc" pandoc/pandoc-citeproc
    ln -sfT "/usr/lib/libclang.so" libclang/3.5/libclang.so
    ln -sfT "/usr/lib/clang/$_clangver/include" libclang/builtin-headers/3.5

    msg "Downloading and installing R packages"
    bash install-packages
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
}
