# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=openvaf-reloaded
pkgname=${_pkgname}-git
pkgver=r817.2e06643
pkgrel=2
pkgdesc="Continuation of OpenVAF - A Next-generation VerilogA Compiler - OSDI >= 4 support"
arch=(
  "x86_64"
  "aarch64"
)
# NOTE: Arpad's fork seems to be more like the dev version
# while the OpenVAF is a downstream of Arpad's fork++
# url="https://github.com/OpenVAF/OpenVAF-Reloaded"
url="https://github.com/arpadbuermen/OpenVAF"
license=('GPL-3.0-or-later')
depends=(
  "glibc"
  "gcc-libs"
  "llvm-libs"
)
makedepends=(
  "git"
  "cargo"
  "clang" 
  "llvm"
  "lld"
  "python"
)
provides=("openvaf-r")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}"
  "0001-feat-LLVM-support-v22.1.patch"
  "vacask::git+https://codeberg.org/arpadbuermen/VACASK#tag=_0.3.2"
)
b2sums=('SKIP'
        'c76c99ddd3df14f8deb6df93c097c5bbbfd2c455fce068df742b1f7e00c2db6b789b549647584e2e763dc00426e97bf896a03d986a425fd28ec9665551d51434'
        'a35e391017923a0c0b9c406df723674154bd3a4d433d8b8d40a143589efa7d6a8eb1a56b82758a16747e79380151fbbe156743b57d6195ed25fc90f038e5edf2')
# lld fails to link mimalloc when LTO is enabled...
options=(!lto)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
  cd "${_pkgname}"

  # Add the submodule(s)
  git submodule init
  # VACASK - for integration tests
  git config submodule."external/vacask".url "$srcdir/vacask"
  # Update submodule
  git -c protocol.file.allow=always submodule update --remote

  # Patch for LLVM 22.1
  patch -Np1 < ../"0001-feat-LLVM-support-v22.1.patch"

  export RUSTUP_TOOLCHAIN=stable
  # TODO: Removed --locked due to local patching atm
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # We need llvm major version
  local _llvm_ver=$(llvm-config --version)
  cargo build --frozen --release --features "llvm${_llvm_ver%%.*}"
}

check() {
  cd "${_pkgname}"
  # Use environment variables to control the extensiveness of the testing
  # default is to run none of the dev nor slow tests
  # RUN_DEV_TESTS=1 - Integration tests etc
  # RUN_SLOW_TESTS=1 - Slow/Large compilations?
  # ALL_TESTS=1 - Equivalent to RUN_DEV_TESTS=1 AND RUN_SLOW_TESTS
  if [[ "${ALL_TESTS}" > 0 ]]; then
    export RUN_DEV_TESTS=1
    export RUN_SLOW_TESTS=1
  fi
  # We need llvm major version
  local _llvm_ver=$(llvm-config --version)
  cargo test --frozen --features "llvm${_llvm_ver%%.*}"
}

package() {
  cd "${_pkgname}"
  # Executables
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/openvaf-r"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/verilogae"
  # FIXME: What's xtask?
  # install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/xtask"
  # Libs
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "target/release/libverilogae.so"
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "target/release/libverilogae_py.so"
  # License
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}

# vim: set ts=2 sw=2 et:
