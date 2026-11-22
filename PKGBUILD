# Maintainer: Gaou Piou <i.am.piou@gmail.com>

pkgname=anycode-bin
pkgver=0.0.105
pkgrel=1
pkgdesc='Desktop workspace for AI coding agents (Claude Code, Codex and native)'
arch=('x86_64')
url='https://github.com/incadawr/anycode'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libdrm'
  'mesa'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'nss'
)
optdepends=(
  'libsecret: encrypted storage for provider API keys through the OS keyring'
  'xdg-utils: open external links from the app'
)
makedepends=('asar' 'imagemagick' 'nodejs')
provides=('anycode')
conflicts=('anycode')
options=('!strip' '!debug')

# Upstream publishes Linux only as an x86_64 AppImage. It is unpacked at build
# time instead of being run through FUSE, so the package installs like a normal
# application and does not need fuse2 at runtime. The bundled AppRun is kept as
# the launcher: it exports the bundled libraries, the icon/glib data paths and
# probes user namespaces to decide whether Electron needs --no-sandbox.
source=("AnyCode-${pkgver}.AppImage::https://github.com/incadawr/anycode/releases/download/v${pkgver}/AnyCode-${pkgver}.AppImage"
        'LICENSE'
        'anycode.desktop'
        'anycode.sh'
        'anycode-patches.mjs')
sha256sums=('1e8a5c4b35bddfe32aeb28007116d3776767f1b0b70f0965797dcbbd063cd551'
            'f65fd74511d34e143f022c7fdf7f8ee7d4ca9321d80e7390ce3f5147f0f94e34'
            'eb3d3a4a865f5cff62ff2a3a3bb77f5e660ee4f0376a90a9d8e238241034df81'
            'd2173b4ad832386fdef35329734ebf7900c4910460792039992b0ebc712cde83'
            '537c19f3f8ce446c381248850b3230a391bf1a5ed5dd0ed1a9101e742db1f9ab')

prepare() {
  chmod +x "${srcdir}/AnyCode-${pkgver}.AppImage"
  ( cd "${srcdir}" && "./AnyCode-${pkgver}.AppImage" --appimage-extract >/dev/null )

  # Downstream fixes until upstream covers them (see anycode-patches.mjs for
  # the details of each edit):
  #  - AnyCode's skill catalog (`$name` in Native tabs, Settings -> Skills)
  #    also reads <workspace>/.claude/skills and ~/.claude/skills, read-only.
  #  - Claude tabs load the user's own Claude Code setup: personal skills
  #    (~/.claude/skills, ~/.agents/skills), commands and agents
  #    (~/.claude/commands, ~/.claude/agents)
  #    through --add-dir on a shim of symlinks under
  #    ~/.cache/anycode-bin/claude-user-skills, and the plugins enabled in
  #    ~/.claude/settings.json through --plugin-dir. By default the rest of
  #    that settings file is not loaded: no user hooks, permission rules or
  #    MCP servers, so approvals stay with AnyCode.
  #  - Opt-in full parity with the plain CLI: start AnyCode with
  #    ANYCODE_CLAUDE_USER_SETTINGS=1 (e.g. in ~/.config/environment.d/) to add
  #    the `user` setting source and drop --strict-mcp-config. That also runs
  #    the user's hooks and lets their permission rules approve tools without
  #    asking AnyCode. Untrusted workspaces are never changed.
  #  - In Claude tabs the `/` menu lists project and personal commands and
  #    skills and plugin skills/commands, and inserts `/name`, which the
  #    Claude CLI expands (incadawr/anycode#87). Since 0.0.103 upstream lists
  #    project commands itself; a name it lists is not repeated.
  # Electron's asar integrity fuse is off in this build, so the archive can be
  # repacked. The bundle is renamed on every release, so every edit must match
  # exactly once; a changed upstream fails the build instead of shipping
  # silently unpatched.
  local resources="${srcdir}/squashfs-root/resources"
  local app="${srcdir}/app-asar"
  rm -rf "${app}"
  asar extract "${resources}/app.asar" "${app}"
  node "${srcdir}/anycode-patches.mjs" "${app}"

  # Upstream keeps these native/binary packages outside the archive. Repack with
  # the same set and verify it, since the app resolves them from
  # app.asar.unpacked at runtime. asar extract and asar pack write regular files
  # as 0644, which would leave the bundled ripgrep non-executable and make every
  # spawn of it fail with EACCES, so the original modes are carried over to both
  # the extracted copy and the repacked tree.
  local unpacked_modes
  unpacked_modes=$(cd "${resources}/app.asar.unpacked" && find . -type f -printf '%m %P\n' | sort)
  local mode path
  while read -r mode path; do
    chmod "${mode}" "${app}/${path}"
  done <<< "${unpacked_modes}"
  rm -rf "${resources}/app.asar" "${resources}/app.asar.unpacked"
  asar pack "${app}" "${resources}/app.asar" \
    --unpack-dir '{node_modules/node-pty,node_modules/@vscode/ripgrep,node_modules/@vscode/ripgrep-linux-x64}'
  while read -r mode path; do
    chmod "${mode}" "${resources}/app.asar.unpacked/${path}"
  done <<< "${unpacked_modes}"
  if [[ $(cd "${resources}/app.asar.unpacked" && find . -type f -printf '%m %P\n' | sort) != "${unpacked_modes}" ]]; then
    error "the repacked app.asar.unpacked differs from upstream's"
    return 1
  fi
  rm -rf "${app}"
}

package() {
  install -dm755 "${pkgdir}/opt/anycode"
  cp -a --no-preserve=ownership "${srcdir}/squashfs-root/." "${pkgdir}/opt/anycode/"

  # The AppImage is assembled with mode 700 directories, which would leave
  # /opt/anycode inaccessible to regular users. a+rX keeps the executable bits
  # it already has and makes the tree readable again.
  chmod -R a+rX "${pkgdir}/opt/anycode"

  # The AppImage ships legacy GTK2 tray libraries that this app never loads and
  # whose own dependencies (gtk2, dbus-glib, libdbusmenu) are not packaged
  # here. Drop them instead of shipping shared libraries with unmet deps.
  rm -f "${pkgdir}/opt/anycode/usr/lib/libappindicator.so.1" \
        "${pkgdir}/opt/anycode/usr/lib/libindicator.so.7" \
        "${pkgdir}/opt/anycode/usr/lib/libgconf-2.so.4"

  # node-pty bundles Windows-only build helpers whose Python scripts are never
  # used on Linux; removing them keeps python out of the dependency graph.
  rm -rf "${pkgdir}/opt/anycode/resources/app.asar.unpacked/node_modules/node-pty/deps/winpty/misc"

  install -Dm755 "${srcdir}/anycode.sh" "${pkgdir}/usr/bin/anycode"

  # Electron takes the Wayland app_id / X11 WM_CLASS from the app name in
  # package.json ("@anycode/desktop", which it sanitizes to "anycode-desktop"),
  # not from the executable or upstream's own .desktop file. Upstream's
  # StartupWMClass=AnyCode therefore never matches, so GNOME Shell treats the
  # window as an unassociated app: it gets a second, icon-less entry in the
  # shell instead of the installed icon. anycode.desktop carries the class the
  # binary actually reports; --class=anycode is ignored by this Electron build,
  # so the correct value has to be declared here.
  install -Dm644 "${srcdir}/anycode.desktop" \
    "${pkgdir}/usr/share/applications/anycode.desktop"

  # The AppImage only ships the icon at 1024x1024, but Arch's hicolor
  # index.theme stops at 512x512. A directory that is missing from the index is
  # never scanned, so installing the 1024px file alone leaves Icon=anycode
  # unresolvable and every desktop shows a generic placeholder. Derive the
  # sizes the index actually lists from the upstream original.
  local icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/AnyCode.png"
  local size
  for size in 48 64 128 256 512; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "${icon}" -resize "${size}x${size}" -strip \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/anycode.png"
  done

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
