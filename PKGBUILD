# Maintainer: Jure Varlec <jure.varlec@ad-vega.si>
_pkgname=qarv
pkgname=qarv-git
pkgver=20150207
pkgrel=1
pkgdesc="Qt GUI and API interfaces to ethernet cameras via Aravis"
arch=( i686 x86_64 )
url="https://gitorious.org/adv/${_pkgname}"
license=('GPL3')
depends=( qt4 aravis ffmpeg opencv gstreamer )
makedepends=( git cmake doxygen graphviz )
checkdepends=()
optdepends=()
provides=( ${_pkgname} )
conflicts=( ${_pkgname} )
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://gitorious.org/adv/${_pkgname}.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull --rebase origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git checkout $_gitname
    cd -
  fi

  msg "Git checkout done."
  msg "Starting make..."

  cd $srcdir
  [ -d build ] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ "$srcdir/$_gitname/"
  make doc
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  local docdest="$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$docdest"
  cp "$srcdir/$_gitname/"{README,NEWS,AUTHORS} "$docdest"
  cp -r apidoc/html "$docdest/api"
}

# vim:set ts=2 sw=2 et:
