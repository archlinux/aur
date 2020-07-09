# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libclc-git
pkgver=0.2.0_r359832.77f8f813a9a
pkgrel=1
epoch=1
groups=('mesagit')
pkgdesc="Library requirements of the OpenCL C programming language (git version)"
arch=('i686' 'x86_64')
url="http://libclc.llvm.org/"
license=('MIT')
provides=('libclc')
replaces=('libclc')
conflicts=('libclc')
makedepends=('clang-git' 'git' 'python' 'ninja' 'cmake')
options=('staticlibs')
source=('llvm-project-git::git+https://github.com/llvm/llvm-project.git')
md5sums=(SKIP)

pkgver() {
  cd llvm-project-git
  echo "0.2.0_r$(git rev-list --count master)"."$(git rev-parse --short HEAD)"
}

prepare() {
   cd llvm-project-git

  rm -rf build && mkdir build
}
build() {
  cd llvm-project-git/build

   cmake ../libclc -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATADIR=/usr/lib \
    -DLIBCLC_TARGETS_TO_BUILD="amdgcn--;r600--;nvptx--;nvptx64--;nvptx--nvidiacl;nvptx64--nvidiacl"

    ninja all
}

package() {
  cd "$srcdir/llvm-project-git/libclc"

  DESTDIR="$pkgdir" ninja -C ../build install
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
