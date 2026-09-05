# Maintainer: cosct

pkgname=pdf-compressor
pkgver=0.5.0
pkgrel=1
pkgdesc='Local-first desktop PDF compressor built with Vue, Tauri, and Rust (GUI + headless CLI)'
arch=('x86_64')
url='https://github.com/cosct/pdf-compressor'
license=('MIT')
# Distro LTO injection (-flto=auto into CFLAGS/LDFLAGS) breaks the link:
# zlib-ng (built by the cc crate) comes out as LTO bytecode objects that the
# final rustc link cannot resolve. The workspace does its own ThinLTO.
options=(!lto)
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
)
optdepends=(
  'libnotify: desktop notifications for the right-click quick-compress mode'
)
makedepends=(
  'cargo'
  'nodejs'
  'pnpm'
  'pkgconf'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('331a665018cb725874b718b03cd7204b65f75cb2f34e38dd92667e1c95459879')

build() {
  cd "${pkgname}-${pkgver}"

  pnpm install --frozen-lockfile

  # Same pipeline as the deb/appimage bundles: `tauri build` runs the frontend
  # build (beforeBuildCommand) and compiles the release binary with the
  # custom-protocol feature (dist/ embedded) — the steps are not duplicated
  # here, so the bundle targets and this package cannot drift apart.
  pnpm exec tauri build --no-bundle

  # Headless CLI lives outside the Tauri shell.
  cargo build --release --locked -p pdf-core --bin pdf-compressor-cli
}

package() {
  cd "${pkgname}-${pkgver}"

  # The cargo target dir may be redirected machine-wide (build.target-dir in
  # ~/.cargo/config.toml) — resolve it via cargo metadata instead of assuming ./target.
  local _target
  _target=$(cargo metadata --format-version 1 --no-deps | sed -n 's/.*"target_directory":"\([^"]*\)".*/\1/p')
  [[ -z "$_target" ]] && _target=target

  install -Dm755 "${_target}/release/app" "${pkgdir}/usr/bin/pdf-compressor"
  install -Dm755 "${_target}/release/pdf-compressor-cli" "${pkgdir}/usr/bin/pdf-compressor-cli"
  install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pdf-compressor.png"
  install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pdf-compressor.png"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README.zh-CN.md "${pkgdir}/usr/share/doc/${pkgname}/README.zh-CN.md"

  install -Dm644 packaging/pdf-compressor.desktop "${pkgdir}/usr/share/applications/pdf-compressor.desktop"
  # KDE Dolphin right-click integration for PDFs (headless quick mode).
  install -Dm644 packaging/servicemenus/pdf-compressor.desktop "${pkgdir}/usr/share/kio/servicemenus/pdf-compressor.desktop"

  # GNOME Nautilus / Nemo "Scripts" menu entries. The Scripts folder is
  # per-user by design — copy these into ~/.local/share/nautilus/scripts/
  # (run packaging/nautilus/install.sh from a source checkout for the
  # automatic variant).
  install -dm755 "${pkgdir}/usr/share/${pkgname}/nautilus"
  for _script in packaging/nautilus/compress-*.sh; do
    install -m755 "${_script}" "${pkgdir}/usr/share/${pkgname}/nautilus/"
  done
}
