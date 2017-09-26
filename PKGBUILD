# Mantainer: epitron <chris@ill-logic.com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=falkon-git
_pkgname=falkon
pkgver=2.1.99.r4444.02f7c68e
_pkgver=2.1.99 
pkgrel=1
pkgdesc="Cross-platform Qt Web Browser"
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=('qt5-webengine' 'qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'openssl>=1.1.0')
makedepends=('git' 'qt5-tools' 'kwallet' 'libgnome-keyring' 'extra-cmake-modules')
conflicts=('qupzilla' 'qupzilla-qt5' 'qupzilla-qt5-git' 'falkon')
optdepends=(
  'bash-completion: bash completion support'
  'kwallet: kf5 kwallet integration'
  'libgnome-keyring: gnome keyring integration'
  )
source=(
  "git://anongit.kde.org/falkon.git"
  )
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
}
build() {
  cd "$srcdir/build"
  cmake ../"$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DDISABLE_UPDATES_CHECK=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install

  # zsh completion
  install -Dm644 $srcdir/$_pkgname/linux/completion/_falkon "$pkgdir/usr/share/zsh/site-functions/_falkon"
}
