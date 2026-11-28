# Maintainer: BlackCatOfficialytb <quanvm0501alt1@tutamail.com>
pkgname=twilightmc-git
pkgver=0.8.0.r0.g0000000
pkgrel=1
pkgdesc="TwilightMC launcher - Rust/Tauri Minecraft launcher & client (built from main)"
arch=('x86_64' 'aarch64')
url="https://github.com/BlackCatOfficialytb/TwilightMC-OSS"
license=('AGPL-3.0-or-later' 'Apache-2.0')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'nodejs'
  'npm'
  'pkgconf'
)
optdepends=(
  'java-runtime: required to launch Minecraft instances'
  'jre21-openjdk: recommended Java runtime for modern Minecraft versions'
)
provides=('twilightmc' 'twilight' 'twilight-ui')
conflicts=('twilightmc' 'twilightmc-bin' 'twilightmc-star-bin' 'twilightmc-bolide-bin' 'twilightmc-snapshot-bin')
options=('!lto')

# Nguồn chính GitHub; nếu GitHub sập có thể đổi sang:
# git+https://tangled.org/quanvm0501.tngl.sh/twilightmc-oss.git#branch=main
source=("twilightmc-oss::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/twilightmc-oss"
  local _ver _rev _sha
  _ver="$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' Cargo.toml | head -n1)"
  _rev="$(git rev-list --count HEAD)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "${_ver}" "${_rev}" "${_sha}"
}

prepare() {
  cd "${srcdir}/twilightmc-oss"
  # Gắn sẵn remote dự phòng Tangled và đồng bộ nếu cần
  git remote add tangled "https://tangled.org/quanvm0501.tngl.sh/twilightmc-oss.git" 2>/dev/null || true
  git fetch tangled main --quiet || true

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  npm --prefix crates/twilight-ui/ui ci
}

build() {
  cd "${srcdir}/twilightmc-oss"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/target"
  npm --prefix crates/twilight-ui/ui run build
  cargo build --frozen --release -p twilight-cli -p twilight-ui
}

package() {
  cd "${srcdir}/twilightmc-oss"
  install -Dm755 "${srcdir}/target/release/twilight" "${pkgdir}/usr/bin/twilight"
  install -Dm755 "${srcdir}/target/release/twilight-ui" "${pkgdir}/usr/bin/twilight-ui"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/twilightmc.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=TwilightMC
Comment=Ultra-fast, zero-bloat Rust + Tauri v2 Minecraft launcher & client
Exec=twilight-ui %U
Icon=twilightmc
Terminal=false
Categories=Game;
DESKTOP

  install -Dm644 crates/twilight-ui/ui/public/logo.png "${pkgdir}/usr/share/pixmaps/twilightmc.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for _doc in LICENSE.md LICENSE_AGPL LICENSE_APACHE CREDITS.md; do
    [[ -f "${_doc}" ]] && install -Dm644 "${_doc}" "${pkgdir}/usr/share/licenses/${pkgname}/${_doc}"
  done

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _doc in README.md VERSION.md; do
    [[ -f "${_doc}" ]] && install -Dm644 "${_doc}" "${pkgdir}/usr/share/doc/${pkgname}/${_doc}"
  done
}
