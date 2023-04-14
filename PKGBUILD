# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libclc-minimal-git
pkgver=17.0.0_r457905.5e53e1bbc34f
pkgrel=1
pkgdesc="companion package to llvm-minimal-git,  Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
provides=('libclc')
conflicts=('libclc')
makedepends=('llvm-minimal-git' 'cmake' 'ninja' 'git' 'python' 'spirv-llvm-translator-minimal-git' 'llvm-libs<16')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
              libclc.patch)
sha256sums=('SKIP'
            '567e7467923835c1790322b0049efc7dd1962a0600afed66adbdfa545f8a0a8c')

pkgver() {
    cd llvm-project/llvm

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

prepare() {
  patch --directory="llvm-project" --strip=1 --input="${srcdir}/libclc.patch"
}

build() {
    cmake \
      -B _build \
      -S "$srcdir"/llvm-project/libclc  \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev
  make -C _build

}

package() {
  make -C _build DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/llvm-project/libclc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

