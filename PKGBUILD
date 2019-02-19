_pkgname=azmq
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="C++ language binding library integrating ZeroMQ with Boost Asio"
arch=("any")
url="https://github.com/zeromq/azmq"
license=('custom:boost')
depends=('boost>=1.54' 'zeromq>=4.0')
makedepends=('git' 'cmake>=2.8' 'boost>=1.54' 'zeromq>=4.0')

_gitroot='https://github.com/zeromq/azmq.git'
_gitname=master

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

build() {
  cd "$srcdir/$_gitname-build"
  mkdir build && cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_CXX_FLAGS=-pthread \
        -D CMAKE_C_FLAGS=-pthread \
        ..
  make
}

check() {
  cd "$srcdir/$_gitname-build/build"
  make test
}

package() {
  cd "$srcdir/$_gitname-build"
  make -C build DESTDIR="$pkgdir/" install
  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE-BOOST_1_0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
