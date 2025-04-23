# Maintainer: Sumit Pathak <sumitpathak2002@gmail.com>

pkgname=spicy-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="A parser generator and runtime for network protocol parsers (from Zeek Project) - Git version"
arch=('x86_64')
url="https://github.com/zeek/spicy"
license=('BSD')
depends=('bison' 'flex' 'cmake' 'gcc' 'make' 'python' 'libpcap' 'zlib')
makedepends=('git' 'python-setuptools' 'swig')
provides=('spicy')
conflicts=('spicy')
source=("${pkgname}::git+https://github.com/zeek/spicy.git")
md5sums=('SKIP')

# derive pkgver from the latest tag
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/r/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  # ensure submodules (e.g., 3rdparty/doctest) are present
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  # run the upstream configure wrapper (creates build/ and configures via CMake)
  ./configure --prefix=/usr
  # compile in the build directory
  make -C build
}

check() {
  cd "$srcdir/$pkgname/build"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  # reinstall into $pkgdir
  make -C build DESTDIR="$pkgdir" install
}

