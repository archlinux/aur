# Maintainer: Artem Klevtsov <a.a.klevtso@gmail.com>

pkgname=rstudio-desktop-git
_gitname=rstudio
pkgver=0.99.212
pkgrel=1
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="http://www.rstudio.org/"
license=('AGPL3')
depends=('boost-libs>=1.5' 'r>=2.11.1' 'hicolor-icon-theme' 'shared-mime-info' 'qt5-webkit')
makedepends=('git' 'cmake>=2.8' 'boost>=1.5' 'java-runtime' 'apache-ant' 'unzip' 'openssl' 'pango' 'libcups' 'qt5-svg' 'pam' 'wget')
optdepends=('git: for git support'
	    'subversion: for subversion suuport'
	    'openssh-askpass: for a git ssh access')
provides=('rstudio-desktop' 'rstudio-desktop-bin')
conflicts=('rstudio-desktop' 'rstudio-desktop-bin')
install="${pkgname}.install"

source=('git+https://github.com/rstudio/rstudio.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  # Get the version number
  git describe --tags --abbrev=0 | sed 's|v||g'
}

prepare() {
  cd "${srcdir}/${_gitname}/dependencies/common"
  msg "Downloading and installing gwt"
  ./install-gwt
  msg "Downloading and installing dictionaries"
  ./install-dictionaries
  msg "Downloading and installing mathjax"
  ./install-mathjax
  msg "Downloading and installing pandoc"
  ./install-pandoc
  msg "Downloading and installing libclang"
  ./install-libclang
  msg "Downloading and installing packages"
  ./install-packages
}

build() {
  # Unset user Rprofile.r variable for building
  if [ -n $R_PROFILE_USER ]; then
    unset R_PROFILE_USER
  fi
  # Configure with cmake in a new buld directory as recommended in the rstudio INSTALL file
  rm -rf "${srcdir}/${_gitname}/build"
  mkdir "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"
  # Configure cmake 
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
  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
