# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-03-17
# Contributor: egrupled

_gitname=zuluCrypt
_build=build
pkgname=zulucrypt
pkgver=5.7.1
pkgrel=1
pkgdesc="A cli and gui frontend to cryptsetup"
url="https://github.com/mhogomchungu/$_gitname/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('cryptsetup' 'qt5-base' 'libpwquality' 'libsecret' 'libxkbcommon-x11' )
optdepends=('kwalletmanager: retrieve volume keys from kde kwallet')
conflicts=('zulucrypt-git')
makedepends=('cmake' 'git')
source=("git+https://github.com/mhogomchungu/$_gitname.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$_gitname"
  msg "Making Build directory... $_build"
  if [[ -d "$_build" ]]; then
    rm -Rf "$_build"
  fi
  mkdir -p "$_build"
  cd "$_build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOGUI=false -DQT5=true -DHOMEMOUNTPREFIX=false -DCMAKE_BUILD_TYPE=release . ..
  make
}

package() {
  msg "changelog updated"
  cd "$_gitname"
  cp changelog ../../"$pkgname.changelog"
  cd "$_build"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/etc/modules-load.d"
  echo 'loop' > "$pkgdir/etc/modules-load.d/$pkgname.conf"
}

