# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libclc-minimal-git
pkgver=23.0.0_r581483.5c5f736c661c
pkgrel=1
pkgdesc="companion package to llvm-minimal-git,  Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
provides=(libclc)
conflicts=(libclc)
makedepends=(llvm-minimal-git clang-minimal-git clang-opencl-headers-minimal-git spirv-llvm-translator-minimal-git cmake git python ninja )
source=("git+https://github.com/llvm/llvm-project.git"
        revert-10644a1-v2.patch
)
sha256sums=('SKIP'
            '3c17242360a2578222f843f983c1867b8c0ceefda5ae869f27f9260a3f73d46d')
options=(!lto !debug)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

prepare() {
  cd llvm-project
  local _commit_hash=$(echo $(pacman -Q llvm-minimal-git) | cut -d' ' -f2 |  cut -d'-' -f1 | cut -d'.' -f4)
  # makepkg installs deps after processing the body of the PKGBUILD. 
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
  patch -Np1 -i "$srcdir"/revert-10644a1-v2.patch
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

_targets=( amdgcn-amd-amdhsa-llvm spirv64-unknown-vulkan nvptx64-- nvptx64--nvidiacl nvptx64-nvidia-cuda spirv32-mesa-mesa3d spirv64-mesa-mesa3d )
build() {
    export CC=clang
    export CXX=clang++
    for t in "${_targets[@]}"
    do
      cmake \
        -B _build-"$t" \
        -S "$srcdir"/llvm-project/libclc  \
        -G Ninja \
        -D CMAKE_BUILD_TYPE=Release \
        -D LLVM_DIR=/usr/lib/cmake/llvm \
        -D LLVM_DEFAULT_TARGET_TRIPLE="$t" \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
      ninja $NINJAFLAGS -C _build-"$t"
    done
}

package() {
  for t in "${_targets[@]}"
  do
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C "_build-$t" install
  done
  
  install -Dm644 "$srcdir"/llvm-project/libclc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

