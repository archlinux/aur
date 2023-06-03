# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fastgron-git'
_pkgname='fastgron'
pkgver=0.4.12.r4.g993365e
pkgrel=1
pkgdesc='High-performance JSON to GRON (greppable, flattened JSON) converter (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/adamritter/fastgron'
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
noextract=("$_pkgname")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build \
  && cd build \
  && cmake ..
}

build() {
  cd "$_pkgname/build"

  make
}

check() {
  cd "$_pkgname/build"

  make test
}

package() {
  cd "$_pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "build"

  env DESTDIR="$pkgdir" cmake --install . --prefix '/usr'
}

# eof
