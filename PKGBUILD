# Maintainer: Kezi <keziolio123@gmail.com>

pkgname=xaxaxa-vna-git
pkgver=0.1.3
pkgrel=1
pkgdesc="a simple and cheap vector network analyzer's support software"
arch=('any')
url="https://github.com/xaxaxa-dev/vna"
license=('GPL2')
groups=()
depends=('eigen' 'fftw' 'qt5-charts')
makedepends=('git' 'make' 'gcc' 'automake' 'libtool')
provides=('')
conflicts=('')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()


_gitroot="https://github.com/xaxaxa-dev/vna.git"
_gitname="vna"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  autoreconf --install
  ./configure
  make
  cd libxavna/xavna_mock_ui/
  qmake
  make
  
  
  cd "$srcdir/$_gitname-build"
  cd vna_qt
  qmake
  make  
}

package() {
  cd "$srcdir/$_gitname-build/"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin

  cp libxavna/.libs/libxavna.so*  $pkgdir/usr/lib/
  cp libxavna/xavna_mock_ui/libxavna_mock_ui.so*  $pkgdir/usr/lib/
  cp vna_qt/vna_qt $pkgdir/usr/bin/
}
