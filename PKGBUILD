# Maintainer: Quark Contributors <https://github.com/0xnullsect0r/Quark>
pkgname=quark
pkgver=2.1.1
pkgrel=1
pkgdesc="Train and run your own Llama 4-style MoE coding LLM on your own hardware"
arch=('x86_64')
url="https://github.com/0xnullsect0r/Quark"
license=('MIT')
depends=('gtk3' 'openssl' 'hicolor-icon-theme' 'vulkan-icd-loader')
makedepends=('rust' 'cargo')
# One binary with every backend; the fastest one that works is picked at
# runtime (CUDA, then Vulkan, then CPU).
optdepends=(
  'cuda: fastest backend on NVIDIA GPUs (toolkit must not be newer than the driver)'
  'vulkan-driver: GPU acceleration on AMD, Intel and NVIDIA via Vulkan'
)
provides=('quark' 'quark-chat' 'quark-code')
conflicts=('quark-git' 'quark-bin')
# Disable LTO: ring 0.17's hand-written C/ASM sources are compiled by the `cc`
# crate inside ring's build.rs.  Arch's system LTO injects -flto=auto into
# CFLAGS, causing the ring native archive to contain LTO bitcode that the
# linker cannot resolve.
options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xnullsect0r/Quark/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('78cb93927675a9d0ecedfaf2c3afd1f4cccffd22d34c640d49a80416cfb4d4b3')

build() {
  cd "Quark-${pkgver}"

  # Strip any -flto flags injected by the system LTO option (see above).
  export CFLAGS="$(echo "${CFLAGS:-}" | sed 's/-flto[^ ]*//g; s/  */ /g; s/^ //; s/ $//')"
  export CXXFLAGS="$(echo "${CXXFLAGS:-}" | sed 's/-flto[^ ]*//g; s/  */ /g; s/^ //; s/ $//')"
  export RUSTFLAGS="-C lto=off"

  cargo build --release --workspace --features "backend-cpu backend-wgpu backend-cuda"
}

package() {
  cd "Quark-${pkgver}"

  install -Dm755 target/release/quark      "${pkgdir}/usr/bin/quark"
  install -Dm755 target/release/quark-chat "${pkgdir}/usr/bin/quark-chat"
  install -Dm755 target/release/quark-code "${pkgdir}/usr/bin/quark-code"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/quark.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.0
Type=Application
Name=Quark LLM
GenericName=LLM Trainer
Comment=Train and run your own Llama 4-style MoE coding LLM
Exec=quark %u
Icon=quark
Terminal=false
Categories=Development;Science;ArtificialIntelligence;
Keywords=llm;ai;ml;training;coding;transformer;
StartupNotify=true
DESKTOP

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
