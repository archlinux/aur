# Mantainer: epitron <chris@ill-logic.com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=qupzilla-git
_pkgname=qupzilla
pkgver=2.1.2.r85.g54949f94
pkgrel=2
pkgdesc="A fast and flexible browser (inspired by Opera Classic). Based on QtWebEngine (Chromium's browser engine), with extra plugins."
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=('qt5-webengine' 'qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'openssl>=1.1.0')
makedepends=('git' 'qt5-tools')
provides=('qupzilla' 'qupzilla-qt5')
conflicts=('qupzilla' 'qupzilla-qt5' 'qupzilla-qt5-git')
optdepends=(
  'bash-completion: bash completion support'
  'kwallet: kf5 kwallet integration'
  'libgnome-keyring: gnome keyring integration'
  )
source=(
  "git+https://github.com/QupZilla/qupzilla.git"
  "git+https://github.com/QupZilla/qupzilla-plugins.git"
  )
sha256sums=(SKIP SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$_pkgname"

  export QUPZILLA_PREFIX="/usr/"
  export QUPZILLA_SRCDIR="$srcdir/qupzilla"
  export QUPZILLA_PLUGINS_SRCDIR="$srcdir/qupzilla-plugins/plugins"

  export USE_WEBGL=true
  export KDE_INTEGRATION=true
  export GNOME_INTEGRATION=true

  qmake
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir/" install

  # zsh completion
  install -Dm644 linux/completion/_qupzilla "$pkgdir/usr/share/zsh/site-functions/_qupzilla"
}
