# Maintainer: graysky <graysky AT proton DOT me>
# Contributor: y0sif <https://github.com/y0sif>

# CUDA device architectures. 120a-real is Blackwell (RTX 50-series); add more
# entries, e.g. "86-real;89-real;120a-real", to cover other cards. Leave empty
# and ggml picks "native", which needs an NVIDIA card visible to nvcc while
# building. CUDA 13 dropped Maxwell/Pascal/Volta, so sm_50/60/61/70 are gone.
_cuda_arch=

pkgbase=whisrs
pkgname=(whisrs whisrs-cuda whisrs-vulkan)
pkgver=0.1.29
pkgrel=1
pkgdesc='Linux-first voice-to-text dictation tool, written in Rust'
arch=(x86_64)
url='https://github.com/y0sif/whisrs'
license=(MIT)
depends=(gcc-libs alsa-lib libxkbcommon)
makedepends=(cargo clang cmake cuda vulkan-headers vulkan-icd-loader shaderc)
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('2b1dd2849f21a04e1b5e719702731a6e76049fefb68f77f2a55f947e7fea8d53')

prepare() {
  cd $pkgbase-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_cuda_env() {
  # makepkg doesn't source profile.d, so nvcc and the host compiler cuda pins
  # (NVCC_CCBIN) aren't visible without this.
  # cuda.sh calls append_path, which only /etc/profile defines.
  append_path() { [[ ":$PATH:" == *":$1:"* ]] || PATH="${PATH:+$PATH:}$1"; }
  [[ -r /etc/profile.d/cuda.sh ]] && source /etc/profile.d/cuda.sh
  unset -f append_path
  export CUDA_PATH=/opt/cuda
  export PATH="/opt/cuda/bin:$PATH"
  # whisper-rs-sys forwards CMAKE_* env vars to cmake.
  if [[ -n ${_cuda_arch} ]]; then
    export CMAKE_CUDA_ARCHITECTURES="${_cuda_arch}"
  fi
  # makepkg's CFLAGS/CXXFLAGS never reach nvcc's host compiler, so the .cu
  # host code needs its hardening here. This replaces whisper-rs-sys's own
  # value, so -fPIC must stay. No commas inside a flag: -Xcompiler splits on them.
  export CMAKE_CUDA_FLAGS="-Xcompiler=-fPIC,-fstack-protector-strong,-fstack-clash-protection,-fcf-protection,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3"
}

build() {
  cd $pkgbase-$pkgver
  export RUSTUP_TOOLCHAIN=stable

  # One target dir per flavor: the GPU backend is a compile-time feature of
  # the bundled whisper.cpp, so each needs its own build of it.
  CARGO_TARGET_DIR=target-cpu cargo build --frozen --release
  (_cuda_env; CARGO_TARGET_DIR=target-cuda cargo build --frozen --release --features cuda)
  CARGO_TARGET_DIR=target-vulkan cargo build --frozen --release --features vulkan
}

_package() {
  cd $pkgbase-$pkgver

  install -Dm755 target-$1/release/whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 target-$1/release/whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_whisrs() {
  pkgdesc+=' (CPU)'
  conflicts=('whisrs-git')
  _package cpu
}

package_whisrs-cuda() {
  pkgdesc+=' (NVIDIA CUDA)'
  depends+=('cuda' 'nvidia-utils')
  provides=('whisrs')
  conflicts=('whisrs' 'whisrs-git')
  _package cuda
}

package_whisrs-vulkan() {
  pkgdesc+=' (Vulkan)'
  depends+=('vulkan-icd-loader' 'vulkan-driver')
  provides=('whisrs')
  conflicts=('whisrs' 'whisrs-git')
  _package vulkan
}
