# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libclc-minimal-git
pkgver=24.0.0_r589763.bb17e718bc41
pkgrel=2
pkgdesc="OpenCL C library used by rusticl and including downstream patches by mesa"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
provides=(libclc)
conflicts=(libclc)
makedepends=(llvm-minimal-git clang-minimal-git clang-opencl-headers-minimal-git spirv-llvm-translator-minimal-git cmake git python ninja )
_fork="https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"
source=("git+https://github.com/llvm/llvm-project.git"
        revert-10644a1-v3.patch
        "01-libclc:add-__clc_mesa_libclc_version.patch::$_fork/-/commit/534609b129e3473b07f8d063c1c7259a07cce93b.patch"
        "02-libclc:disable-use-of-SPV_KHR_fma-extension.patch::$_fork/-/commit/0fdefef847d704b0162cacdbafe01350f4531a61.patch"
        "03-libclc:restore-old-fma-behavior.patch::$_fork/-/commit/f55c425b7277bc7178729a4c4335a5ec404d03dc.patch"
        "04-libclc:disable-fp16-version-of-atan2-and-atan2pi.patch::$_fork/-/commit/cd0452f7a695165706fe5df85073f86baa46abd4.patch"
        "05-libclc:Revert-libclc:-Update-hypot-implementation-PR185873.patch::$_fork/-/commit/931f02ef3281fa7bcf14362a7f90edec40825aaf.patch"
        "06-libclc:Revert-libclc:-Update-remquo-PR187998.patch::$_fork/-/commit/9b54a3b2c09228b3c3269c5c62ca2f3128ec6501.patch"
        "07-libclc:Partly-revert-libclc:-Update-trigpi-functions-PR187579.patch::$_fork/-/commit/1e379e04c3fc1457a80d47e0da2a6e242237094c.patch"
)
sha256sums=('SKIP'
            '4f215e748c4c1a59f621ae58d2685651c442e3e79fa77c4c0153bd201f02a4de'
            '92be6f10dcb269e2b2649c9614a1b58f228f5cad886d4b781f92c999bf25cf92'
            '610a395fe9abe050b893bea5f92d84aae6df7356768a8cba706386080043efd8'
            '7b54ce33e03634f1082d91fd998f807a1064f5bac479474ae91704acecc2c7ee'
            '98e68305aa73e62348d2510fe8c91350b75201e56b272f3cae99e9bc91302394'
            'e4487f8224a4f0fe5353135d6ddd3e2c904abfc160ae6b0e5e85982df6eaa8c2'
            '299fe7d29f75a37703d85e75caf665349ed29bb971b6d59dbed32d96ee1612d4'
            'dfa49da934bf7f7cd65be8610d386c7ee47ff89377774e6f5fc4d9497646bd73')
options=(!lto !debug)

# ninja tends to grab all available cores. the env var NINJAFLAGS is used to prevent this.
# # If users don't know what to set this to, just use NINJAFLAGS=""

prepare() {
  pushd llvm-project
  local _commit_hash=$(echo $(pacman -Q llvm-minimal-git) | cut -d' ' -f2 |  cut -d'-' -f1 | cut -d'.' -f4)
  # makepkg installs deps after processing the body of the PKGBUILD. This blocks using _commit_hash in the source= array.
  # best alternative seems to be to use git reset in prepare() .
  # example how the command works
  # pacman -Q llvm-minimal-git output =   llvm-minimal-git 17.0.0_r461863.8064caf83fb1-1
  # the first cut removes (pkgname) , the 2nd cut removes (pkgrel) and the 3rd removes (revision count) so only (the commit hash) 8064caf83fb1 remains
  git reset --hard $_commit_hash

  # https://github.com/llvm/llvm-project/commit/10644a143922816b8326e8be0d1790220ba2cd6b.patch removes the libclc.pc needed by mesa
  # the commit can't be reverted cleanly, manually created a patch
  patch -Np1 -i "$srcdir"/revert-10644a1-v3.patch
  popd
  
  # apply downstream patches from https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/tree/llvm_23
  pushd llvm-project/libclc
  patch -Np1 -i "$srcdir"/01-libclc:add-__clc_mesa_libclc_version.patch
  patch -Np1 -i "$srcdir"/02-libclc:disable-use-of-SPV_KHR_fma-extension.patch
  patch -Np1 -i "$srcdir"/03-libclc:restore-old-fma-behavior.patch
  patch -Np1 -i "$srcdir"/04-libclc:disable-fp16-version-of-atan2-and-atan2pi.patch
  patch -Np1 -i "$srcdir"/05-libclc:Revert-libclc:-Update-hypot-implementation-PR185873.patch
  patch -Np1 -i "$srcdir"/06-libclc:Revert-libclc:-Update-remquo-PR187998.patch
  patch -Np1 -i "$srcdir"/07-libclc:Partly-revert-libclc:-Update-trigpi-functions-PR187579.patch
  popd
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

_targets=( spirv32-unknown-unknown spirv64-unknown-unknown)
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
        -Wno-author
      ninja $NINJAFLAGS -C _build-"$t"
    done
}

package() {
  for t in "${_targets[@]}"
  do
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C "_build-$t" install
  done
  
  # move files to where mesa expects them and delete unwanted ones
  pushd "$pkgdir"/usr/share/clc/
  mv spirv32-unknown-unknown/libclc.spv spirv-mesa3d-.spv
  rm -rf spirv32-unknown-unknown
  mv spirv64-unknown-unknown/libclc.spv spirv64-mesa3d-.spv
  rm -rf spirv64-unknown-unknown
  popd
  
  install -Dm644 "$srcdir"/llvm-project/libclc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

