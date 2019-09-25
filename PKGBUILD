# Maintainer: Nazar Mishturak <nazarmx@gmail.com"
# Contributor: hexchian <i at hexchain dot org>

pkgname=crun-git
pkgver=0.9.1.r35.g423bc44
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('GPL3')
arch=('x86_64')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp')
makedepends=('libtool' 'python3' 'go-md2man')
source=(
  "$pkgname::git+https://github.com/containers/crun.git"
  "libocispec::git+https://github.com/containers/libocispec.git"
  "runtime-spec::git+https://github.com/opencontainers/runtime-spec.git"
  "image-spec::git+https://github.com/opencontainers/image-spec.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd $srcdir/libocispec
  git submodule init
  git config submodule.runtime-spec.url $srcdir/runtime-spec
  git config submodule.image-spec.url $srcdir/image-spec
  git submodule update
  cd $srcdir/$pkgname
  git submodule init
  git config submodule.libocispec.url $srcdir/libocispec
  git submodule update
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install
}
