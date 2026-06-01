pkgname=lmms-lab-writer
pkgver=0.1.3
pkgrel=2
pkgdesc="AI-native LaTeX editor desktop application"
arch=('x86_64')
url="https://github.com/EvolvingLMMs-Lab/lmms-lab-writer"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl' 'xdg-utils' 'opencode' 'texlive-bin' 'texlive-binextra' 'texlive-latex' 'texlive-latexrecommended' 'texlive-latexextra' 'texlive-fontsrecommended' 'texlive-langcjk')
makedepends=('git' 'nodejs' 'pnpm' 'rust' 'cargo' 'curl' 'wget' 'file' 'patchelf')
provides=('lmms-lab-writer')
conflicts=('lmms-lab-writer-bin')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EvolvingLMMs-Lab/lmms-lab-writer/archive/refs/tags/v0.1.3.tar.gz")
sha256sums=('d9b782533c6f237ea145e7c7eed36b431a256c97eeeafa01877a8698c58c66b9')

_source_dir() {
  local dir="${srcdir}/${pkgname}-${pkgver}"
  if [[ -d "${dir}" ]]; then
    printf '%s\n' "${dir}"
    return
  fi

  find "${srcdir}" -maxdepth 1 -type d -name "${pkgname}-*" | head -n 1
}

prepare() {
  cd "$(_source_dir)"

  export CARGO_HOME="${srcdir}/cargo-home"
  export PNPM_HOME="${srcdir}/pnpm-home"
  export PATH="${PNPM_HOME}:${PATH}"

  pnpm config set store-dir "${srcdir}/pnpm-store"
  pnpm config set network-timeout 300000
  pnpm config set fetch-retries 5
  pnpm config set fetch-retry-mintimeout 20000
  pnpm config set fetch-retry-maxtimeout 120000
  pnpm config set network-concurrency 8
  pnpm --filter @lmms-lab/writer-desktop... install --frozen-lockfile
}

build() {
  cd "$(_source_dir)"

  export CARGO_HOME="${srcdir}/cargo-home"
  export PNPM_HOME="${srcdir}/pnpm-home"
  export PATH="${PNPM_HOME}:${PATH}"

  pnpm --filter @lmms-lab/writer-desktop tauri build --ci --no-bundle
}

package() {
  cd "$(_source_dir)"

  install -Dm755 "apps/desktop/src-tauri/target/release/lmms-lab-writer" \
    "${pkgdir}/usr/bin/lmms-lab-writer"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "apps/desktop/src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lmms-lab-writer.png"
  install -Dm644 "apps/desktop/src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lmms-lab-writer.png"
  install -Dm644 "apps/desktop/src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lmms-lab-writer.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/lmms-lab-writer.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=LMMs-Lab Writer
Comment=AI-native LaTeX editor
Exec=lmms-lab-writer %U
Icon=lmms-lab-writer
Terminal=false
Categories=Office;Science;TextEditor;
StartupNotify=true
EOF
}
