# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=4.1.4
pkgrel=1
_tag="${_pkgname}-${pkgver}"
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('pcsclite' 'ccid' 'python-pyotherside' 'yubikey-manager' 'qt5-quickcontrols')
makedepends=('swig' 'git')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3') # Dag Heyman <dag@yubico.com>
source=("git+https://github.com/Yubico/yubioath-desktop.git#tag=${_tag}"
'git+https://github.com/thp/pyotherside.git'
'git+https://github.com/Yubico/yubikey-manager.git'
'git+https://github.com/qtproject/qt-solutions')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
conflicts=('yubico-yubioath-desktop-git')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git config --file=.gitmodules submodule.vendor/pyotherside.url ../pyotherside/
  git config --file=.gitmodules submodule.vendor/yubikey-manager.url ../yubikey-manager/
  git config --file=.gitmodules submodule.ykman-gui/vendor/qt-solutions.url ../qt-solutions/

  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m0644 resources/yubioath.desktop "${pkgdir}/usr/share/applications/yubioath.desktop"
  install -D -m0644 resources/icons/yubioath.png "${pkgdir}/usr/share/pixmaps/yubioath.png"
}
