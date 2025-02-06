# Maintainer: a821 at (nospam) mail de
# Contributor: Konstantin Gizdov <kgizdov at archlinux dot org>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Adam Ehlers Nyholm Thomsen<adament@adament.net>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=davix-git
pkgver=0.8.9.r0.gf5a141a6
pkgrel=1
pkgdesc="Client for data and file management over the WebDav, Amazon S3, Microsoft Azure and HTTP procols"
arch=('x86_64')
url="https://github.com/cern-fts/davix"
license=('LGPL-2.1-or-later')
depends=('libxml2' 'openssl' 'util-linux-libs' )
makedepends=('doxygen' 'boost' 'cmake' 'git' 'python' 'gtest')
source=("${pkgname}::git+${url}.git"
        "git+https://github.com/curl/curl.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^R_//;s/-/.r/;s/[_-]/./g'
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule."deps/curl".url "$srcdir/curl"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S $pkgname \
    -DLIB_SUFFIX="" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev
  cmake --build build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
