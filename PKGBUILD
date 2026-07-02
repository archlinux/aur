# Maintainer: Rom Grk <rom7011@gmail.com>
pkgname=mariner-git
_pkgname=mariner
pkgver=0.0.1.r0.g0000000
pkgrel=1
pkgdesc="A GNOME Files alternative built with node-gtk (GTK4 + libadwaita)"
arch=('x86_64')
url="https://github.com/romgrk/mariner"
license=('GPL-3.0-or-later')
# Runtime: node-gtk 4.0.0 ported its native addon to the V8-14 internal-field
# API, so it builds and runs on current Node again — Arch's rolling `nodejs`
# (26) is fine. nodejs>=22.18 is the floor (also what unflagged TypeScript
# stripping needs). gtk4/libadwaita supply the typelibs; gobject-introspection-
# runtime supplies libgirepository, which the addon links against (not pulled
# in by gtk4).
# gvfs backs the trash:// view, volume monitoring, mounting and eject in the
# places sidebar; the local file operations work without it, the sidebar does not.
# ripgrep (content search), the archive tools unzip/zip (.zip & .jar), 7zip (.7z,
# also offered in the Compress dialog) and unarchiver (ships the `unar` binary,
# for .rar), plus xdg-user-dirs (localized Documents/Downloads/… sidebar places)
# are hard deps so a fresh install is full-featured out of the box; the app
# degrades gracefully without them, but we ship them rather than via optdepends.
# (tar is not listed — it is part of the mandatory `base` group.)
depends=('nodejs>=22.18' 'gtk4' 'libadwaita' 'gobject-introspection-runtime' 'gvfs'
         'ripgrep' 'unzip' 'zip' '7zip' 'unarchiver' 'xdg-user-dirs')
# Build: compiles the node-gtk native addon from source against system GTK.
makedepends=('git' 'npm' 'node-gyp' 'python' 'pkgconf' 'gobject-introspection' 'cairo' 'glib2')
# These enable secondary features and stay optional: gvfs-smb/gvfs-mtp are
# on-demand mount backends, and the terminal is a user choice (the app probes
# ptyxis, kgx, konsole, foot, alacritty, xterm too, so pinning one is wrong).
optdepends=('gvfs-smb: mount Windows/Samba network shares'
            'gvfs-mtp: mount phones and media players'
            'gnome-console: "Open Terminal Here" (or any of ptyxis, konsole, foot, alacritty, xterm)')
provides=('mariner')
conflicts=('mariner')
install="$_pkgname.install"
source=("$_pkgname::git+https://github.com/romgrk/mariner.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver
  ver="$(sed -n 's/[[:space:]]*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' package.json | head -n1)"
  printf '%s.r%s.g%s' "${ver:-0.0.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  # Build against /usr/bin/node — the exact binary the launcher pins at runtime —
  # so the compiled addon's ABI matches. Without this, a maintainer building
  # outside a clean chroot with an nvm/fnm/volta node on PATH compiles the addon
  # for that node's ABI (e.g. node-v127) while the launcher runs /usr/bin/node
  # (e.g. node-v147), and the package fails at startup with a missing
  # node-vNNN binding. In a clean chroot /usr/bin/node is already the only node.
  export PATH="/usr/bin:$PATH"
  # Install node-gtk@^4.0.0 from the npm registry and compile its native addon
  # against the system GTK rather than downloading a prebuilt binary — the
  # prebuilts do not track Arch's rolling Node ABI.
  export npm_config_build_from_source=true
  export npm_config_cache="$srcdir/.npm-cache"
  npm install --omit=dev --no-fund --no-audit
}

package() {
  cd "$srcdir/$_pkgname"
  local appdir="$pkgdir/usr/lib/$_pkgname"

  # The app runs its TypeScript sources directly (Node type-stripping), so the
  # whole src/ tree ships as-is alongside the built node_modules. style.css and
  # the search worker are resolved relative to these sources at runtime.
  install -d "$appdir"
  cp -r src "$appdir/"
  cp -r node_modules "$appdir/"
  install -Dm644 package.json "$appdir/package.json"

  # Launcher. Invokes /usr/bin/node explicitly (not a PATH `node`, which could be
  # an nvm/volta build tied to a different ABI than the native addon was compiled
  # against). --import needs an absolute path to the register hook because Node
  # resolves --import specifiers relative to the CWD, not the entry script.
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
exec /usr/bin/node \\
  --import /usr/lib/$_pkgname/node_modules/node-gtk/lib/esm/register.mjs \\
  /usr/lib/$_pkgname/src/main.ts "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  # Desktop integration: launcher entry, scalable icon, AppStream metadata.
  install -Dm644 data/com.github.romgrk.mariner.desktop \
    "$pkgdir/usr/share/applications/com.github.romgrk.mariner.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/com.github.romgrk.mariner.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.romgrk.mariner.svg"
  install -Dm644 data/com.github.romgrk.mariner.metainfo.xml \
    "$pkgdir/usr/share/metainfo/com.github.romgrk.mariner.metainfo.xml"
}
