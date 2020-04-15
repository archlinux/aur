# Maintainer:  Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer-linux-git
_pkgname="${pkgname/-git/}"
_gitbranch=master
_gitauthor=whoozle
pkgver=continuous.r0.g14cdedc
pkgrel=1
pkgdesc="An interactive MTP client implemented in C++ using Qt toolkit"
arch=('i686' 'x86_64')
url="https://github.com/whoozle/android-file-transfer-linux"
license=(LGPL2.1)
depends=('qt5-base' 'fuse' 'hicolor-icon-theme' 'taglib')
makedepends=('cmake' 'git' 'ninja' 'mesa')
conflicts=('android-file-transfer')
source=("git+https://github.com/$_gitauthor/$_pkgname.git#branch=$_gitbranch")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}




prepare() {
  cd "$_pkgname"
  mkdir -p build
}



build() {
  cd "$_pkgname"
  
  cd build

  cmake -G Ninja .. \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS=-Wl,-O1,--sort-common,-z,relro,-z,now

  ninja
}

package() {
  cd "$_pkgname"/build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}



