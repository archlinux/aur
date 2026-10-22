# Maintainer: Cranyozen <cranyozen@outlook.com>
# suzuri is NOT in the AUR; this PKGBUILD packages the official prebuilt
# Linux release tarball so that paru/pacman can manage it.

pkgname=suzuri-bin
pkgver=0.5.8
pkgrel=1
pkgdesc='Writing environment built on Zed: Obsidian-style live preview, Typst/LaTeX preview, PDF pane'
arch=('x86_64' 'aarch64')
url='https://github.com/harrywang/suzuri'
license=('GPL-3.0-or-later' 'Apache-2.0')

depends=('alsa-lib'
         'gcc-libs'
         'glib2'
         'glibc'
         'libglvnd'
         'libx11'
         'libxcb'
         'libxkbcommon'
         'libxkbcommon-x11'
         'vulkan-driver'
         'vulkan-icd-loader'
         'wayland'
         'zlib')

optdepends=('libpulse: PulseAudio audio backend'
            'typst: Typst live preview compiler'
            'tectonic: LaTeX live preview compiler (alternative to TeX Live)'
            'openbsd-netcat: SSH remote development support'
            'clang: improved C/C++ language support'
            'cmake: building C/C++ projects'
            'gopls: improved Go language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support'
            'typescript-language-server: improved TypeScript/JavaScript support'
            'org.freedesktop.secrets: to keep you logged into your Suzuri account')

provides=('suzuri')
conflicts=('suzuri' 'suzuri-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/suzuri-v${pkgver}/suzuri-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/suzuri-v${pkgver}/suzuri-linux-aarch64.tar.gz")
sha256sums_x86_64=('d1447ed9f52730eb25809e4f23d890aa4538d70eabc46012d4c14e0704f43811')
sha256sums_aarch64=('71c389c8c2b7a8fd07455d89672cad7a1bde83e373bb2539dc865822d2170a8f')

package() {
  cd 'suzuri.app'

  # Keep the upstream app-directory layout: the launcher resolves its main
  # binary through '../libexec/zed-editor' relative to its own path.
  # Installing under /usr/lib/suzuri (and not /usr/lib/zed) keeps this package
  # installable alongside extra/zed, which owns /usr/lib/zed/zed-editor.
  install -Dm755 'bin/suzuri' "${pkgdir}/usr/lib/suzuri/bin/suzuri"
  install -Dm755 'libexec/zed-editor' "${pkgdir}/usr/lib/suzuri/libexec/zed-editor"

  # Wrapper: hand updates to the package manager. The editor polls GitHub for
  # releases and self-installs unless ZED_UPDATE_EXPLANATION is set in the
  # environment; it also turns "Check for Updates" into an informational
  # prompt. See crates/auto_update/src/auto_update.rs.
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/suzuri" <<'EOF'
#!/bin/sh
export ZED_UPDATE_EXPLANATION='Suzuri is managed by your package manager. Update with: paru -Syu'
exec /usr/lib/suzuri/bin/suzuri "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/suzuri"

  # Desktop entry.
  #
  # A compositor resolves a window's icon by matching its app_id against a
  # desktop file name. Through 0.5.4 those two disagreed on the dev channel
  # (app_id 'dev.zed.Zed-Dev' vs file 'app.suzuri.Suzuri.desktop'), so this
  # package renamed the file to compensate. Suzuri 0.5.5 fixed the runtime side
  # (ReleaseChannel::app_id() now returns 'app.suzuri.Suzuri'), so the rename is
  # gone. Keep whichever name upstream ships, derived from the tarball rather
  # than hard-coded, and only make the Exec paths absolute.
  mapfile -t desktops < <(find share/applications -maxdepth 1 -name '*.desktop')
  if (( ${#desktops[@]} != 1 )); then
    echo "error: expected exactly 1 .desktop file, found ${#desktops[@]}" >&2
    return 1
  fi
  desktop="${pkgdir}/usr/share/applications/${desktops[0]##*/}"
  install -Dm644 "${desktops[0]}" "$desktop"
  sed -i -e 's|^Exec=suzuri |Exec=/usr/bin/suzuri |' \
         -e 's|^TryExec=suzuri$|TryExec=/usr/bin/suzuri|' \
    "$desktop"

  # Icons into hicolor so the desktop entry's plain 'Icon=suzuri' resolves.
  install -Dm644 'share/icons/hicolor/512x512/apps/suzuri.png' \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/suzuri.png"
  install -Dm644 'share/icons/hicolor/1024x1024/apps/suzuri.png' \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/suzuri.png"

  # Licenses (licenses.md carries the bundled theme/component licenses)
  install -Dm644 'licenses.md' "${pkgdir}/usr/share/licenses/${pkgname}/licenses.md"
}
