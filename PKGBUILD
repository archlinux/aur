# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libclc-minimal-git
pkgver=23.0.0_r573751.66f06f54cb4d
pkgrel=2
pkgdesc="companion package to llvm-minimal-git,  Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
provides=(libclc)
conflicts=(libclc)
makedepends=(llvm-minimal-git clang-minimal-git clang-opencl-headers-minimal-git spirv-llvm-translator-minimal-git cmake git python ninja )
source=("git+https://github.com/llvm/llvm-project.git"
        revert-10644a1.patch
        libclc.pc.in
)
sha256sums=('SKIP'
            'b1503d1f26455b55d0da9e6aa5cf9f56a2a3db443151397f3018dbf449273982'
            'a4cfc362c5bbfcaae407496abbc5407454474ab1d2f9e4aa1ee12e81be1a0db6')
options=(!lto !debug)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

prepare() {
  cd llvm-project
  local _commit_hash=$(echo $(pacman -Q llvm-minimal-git) | cut -d' ' -f2 |  cut -d'-' -f1 | cut -d'.' -f4)
  # makepkg installs deps after processing the body of the PKGBUI:LD. 
  # This prevents using _commit_hash in the source= array unless llvm-minimal-git is installed before build starts.
  # best alternative seems to be to use git reset in prepare() .
  # example how the command works
  # pacman -Q llvm-minimal-git output =   llvm-minimal-git 17.0.0_r461863.8064caf83fb1-1
  # the first cut removes (pkgname) llvm-minimal-git
  # the 2nd cut removes (pkgrel) 1
  # the 3rd removes (revision count) r461863 so only (the commit hash) 8064caf83fb1 remains

  git reset --hard $_commit_hash
  
  # https://github.com/llvm/llvm-project/commit/10644a143922816b8326e8be0d1790220ba2cd6b.patch removes the libclc.pc needed by mesa
  # the commit can't be reverted cleanly, manually created a patch
  patch -Np1 -i "$srcdir"/revert-10644a1.patch
  cp "$srcdir"/libclc.pc.in libclc/libclc.pc.in
}

pkgver() {
    cd llvm-project/cmake/Modules

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             LLVMVersion.cmake)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

build() {
    export CC=clang
    export CXX=clang++
    cmake \
      -B _build \
      -S "$srcdir"/llvm-project/libclc  \
      -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D LLVM_EXTERNAL_LIT=/usr/bin/lit \
      -Wno-dev
    ninja $NINJAFLAGS -C _build


}

package() {
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install
  install -Dm644 "$srcdir"/llvm-project/libclc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

