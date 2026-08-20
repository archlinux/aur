# Maintainer: yjzyl9008@gmail.com
pkgname=vofa-next-git
_pkgname=vofa-NEXT
pkgver=r108.22b1f0f
pkgrel=1
pkgdesc="A next-generation serial assistant for embedded debugging, waveforms, and CAN/automotive diagnostics"
arch=('x86_64' 'aarch64')
url="https://github.com/Horldsence/vofa-NEXT"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'openssl'
  'libayatana-appindicator'
  'libsoup3'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'nodejs'
  'pnpm'
  'pkgconf'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  export CARGO_HOME="${srcdir}/cargo"
  export RUSTUP_TOOLCHAIN=stable
  export CC=gcc
  export CXX=g++
  unset RUSTFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  pnpm build
  cargo build --release --locked --manifest-path src-tauri/Cargo.toml --features tauri/custom-protocol
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "src-tauri/target/release/vofa-next" "${pkgdir}/usr/bin/vofa-next"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/vofa-next.desktop" <<EOF
[Desktop Entry]
Name=VOFA-NEXT
Comment=Next-generation Serial Assistant & Diagnostic Tool
Exec=vofa-next
Icon=vofa-next
Terminal=false
Type=Application
Categories=Development;Utility;
EOF

  if [ -f "icon.png" ]; then
    install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vofa-next.png"
  fi

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
