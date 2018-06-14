pkgname=grumpy-irc-git
_pkgname=grumpy-irc
pkgver=v1.0.0.alpha.r205.g61d441a
pkgrel=1
pkgdesc="Modern, yet oldschool IRC client with distributed core, written in C++"
arch=('i686' 'x86_64')
url="https://github.com/grumpy-irc/grumpy"
license=('LGPL3')
depends=('qt5-base')
makedepends=('unzip' 'cmake' 'git')
conflicts=('grumpy-irc' 'libircclient')
provides=('grump-irc' 'libircclient')
source=("$_pkgname::git+$url" "https://patch-diff.githubusercontent.com/raw/grumpy-irc/libgp/pull/1.diff")
sha256sums=('SKIP'
            '74ba86bd7e648d8680708636488aea77e9f7313af1f5780d8292a3618e29b1c3')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
 cd "$srcdir/$_pkgname"
 git submodule update --init --recursive
 rm -rf build
 mkdir build
 cd src/sqlite
 unzip sqlite-amalgamation-3220000.zip
 mv sqlite-amalgamation-3220000/* .
 cd $srcdir/$_pkgname/src/libgp
 patch -Np1 -i $srcdir/1.diff
}

build() {

  cd "$srcdir/$_pkgname"
  cd build
  cmake ../src \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make -C build DESTDIR="$pkgdir" install
}
