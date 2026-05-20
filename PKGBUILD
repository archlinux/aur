# Maintainer: VanHoney Ltd.
pkgname=ion-nemesis-cli
pkgver=2.1.0
pkgrel=2
pkgdesc="Local-first iON Data Security Systems Nemesis Engine CLI"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/iON-Data-Systems-powered-by-the-NEMESIS-ENGINE"
license=('custom')
depends=(
  'gcc-libs'
  'openssl'
  'sqlite'
  'libimobiledevice'
  'ifuse'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'ollama: local LLM runtime for Psyche/Nemesis analysis'
  'python: transcription and diarization helper scripts'
  'ffmpeg: media probing and transcription preparation'
)
source=("${pkgname}::git+${url}.git#branch=nemesis-cli-aur-ready")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}/core"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}/core"
  cargo build --release --locked --bins
}

check() {
  cd "${srcdir}/${pkgname}/core"
  cargo test --locked
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 core/target/release/ion "${pkgdir}/usr/bin/ion"
  install -Dm755 core/target/release/minios "${pkgdir}/usr/bin/minios"
  install -Dm755 core/target/release/minios-export "${pkgdir}/usr/bin/minios-export"
  install -Dm755 core/target/release/pcr-packet "${pkgdir}/usr/bin/pcr-packet"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 hermes_transcribe.py "${pkgdir}/usr/share/${pkgname}/hermes_transcribe.py"
  install -Dm755 run_transcribe_diarize.py "${pkgdir}/usr/share/${pkgname}/run_transcribe_diarize.py"
  install -Dm755 run_diarize_only.py "${pkgdir}/usr/share/${pkgname}/run_diarize_only.py"
}
