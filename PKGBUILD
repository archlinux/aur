# Maintainer: Quark Contributors <https://github.com/0xnullsect0r/Quark>
pkgname=quark
pkgver=1.2.2
pkgrel=1
pkgdesc="Train and run your own Llama 4-style MoE coding LLM on your own hardware"
arch=('x86_64')
url="https://github.com/0xnullsect0r/Quark"
license=('MIT')
depends=('gtk3' 'openssl' 'hicolor-icon-theme')
makedepends=('rust' 'cargo')
optdepends=(
  'cuda: NVIDIA GPU acceleration'
)
provides=('quark' 'quark-chat' 'quark-code')
conflicts=('quark-git' 'quark-bin')
# Disable LTO: ring 0.17's hand-written C/ASM sources are compiled by the `cc`
# crate inside ring's build.rs.  Arch's system LTO injects -flto=auto into
# CFLAGS, causing the ring native archive to contain LTO bitcode that the
# linker cannot resolve.
options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xnullsect0r/Quark/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69be744f93adac8f3d42ad33b5aeb72b2561529a4eb844648f1b3629a931648f')

build() {
  cd "Quark-${pkgver}"

  # Strip any -flto flags injected by the system LTO option (see above).
  export CFLAGS="$(echo "${CFLAGS:-}" | sed 's/-flto[^ ]*//g; s/  */ /g; s/^ //; s/ $//')"
  export CXXFLAGS="$(echo "${CXXFLAGS:-}" | sed 's/-flto[^ ]*//g; s/  */ /g; s/^ //; s/ $//')"
  export RUSTFLAGS="-C lto=off"

  cargo build --release --workspace --features backend-cpu
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
