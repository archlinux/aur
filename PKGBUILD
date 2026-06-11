# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=openvaf-reloaded
pkgname=${_pkgname}-git
pkgver=r817.2e06643
pkgrel=3
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
  "llvm-libs"
  "libgcc"
  "libstdc++"
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
  "vacask::git+https://codeberg.org/arpadbuermen/VACASK#tag=_0.3.3"
)
b2sums=('SKIP'
        '3f8552e2714b535f5a08d2a95960c602909ae28d33723f3dc06f1bb9e82e8e5eeadd832b805901df6cdac728d9a82009088c9491c37cda650194a4dc74694a5c')

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

  # Patch for LLVM 22 support
  # See upstream: https://github.com/arpadbuermen/OpenVAF/pull/76/
  git cherry-pick -n 277e3aa4d07625ba3c5179bc353e781481564966

  # Patch for submodule hash
  # See upstream: https://github.com/arpadbuermen/OpenVAF/pull/77/
  git cherry-pick -n bd95c9078313249141cd03d06ac1358e8f8caab8

  # Add the submodule(s)
  git submodule init
  # VACASK - for integration tests
  git config submodule."external/vacask".url "$srcdir/vacask"
  # Update submodule
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
