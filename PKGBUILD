# Maintainer: Axel Valens (chomiam) <axel.valens@gmail.com>
pkgname=noos-agent
pkgver=0.1.0
pkgrel=1
pkgdesc="Hybrid Local AI Desktop Workbench (llama.cpp ROCm/CUDA/Vulkan, Stable Diffusion, Multi-Agent Orchestrator & Web Skills)"
arch=('x86_64' 'aarch64')
url="https://gitea.cloud-box.ovh/chomiam/noos-agent"
license=('MIT')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
  'git'
  'pkgconf'
)
optdepends=(
  'llama.cpp: Local GGUF LLM inference engine (llama-server / llama serve)'
  'rocm-hip-runtime: AMD ROCm GPU hardware acceleration'
  'cuda: NVIDIA CUDA GPU hardware acceleration'
  'vulkan-icd-loader: Vulkan GPU acceleration for stable-diffusion.cpp'
  'cmake: Automated local compilation of stable-diffusion.cpp'
  'grim: Wayland desktop screenshot capture for the vision agent'
  'scrot: X11 desktop screenshot capture for the vision agent'
  'github-cli: GitHub PR, Issue & Actions workflow integration'
)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://gitea.cloud-box.ovh/chomiam/noos-agent/archive/v${pkgver}.tar.gz")
sha256sums=('bd837a1767d7bf9f54b2bf84b7bea5bcea0dded99151660c5b298575a45f0fb9')

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  bun install --frozen-lockfile
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  bun run build
  cargo build --frozen --release -p noos-agent
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p noos-agent-core
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/noos-agent" "${pkgdir}/usr/bin/noos-agent"
  install -Dm644 "packaging/noos-agent.desktop" "${pkgdir}/usr/share/applications/noos-agent.desktop"
  install -Dm644 "noos-svg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/noos-agent.svg"
  install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/noos-agent.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/noos-agent.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noos-agent.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
