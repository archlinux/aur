# Maintainer: HarryLoong <xiangzelong@radxa.com>
#
# Builds the DeepSeek Harness *desktop* application from the upstream repository.
# Upstream publishes desktop releases for macOS and Windows only, although the
# sources already contain the packaging target and the shell's Linux behaviour
# (wayland app id, native menus, DOM shortcut dispatch, non-portal folder dialogs);
# only the target wiring, the release settings for an unsigned build, and the two
# Linux-only runtime adjustments in linux-desktop.patch were missing. The installed
# result is the same shape as the macOS and Windows releases: the Electron shell plus
# a complete dsh runtime, with Node.js, pnpm, CPython and the Office libraries
# bundled, so nothing is required from the system at runtime beyond the shared
# libraries listed below.
#
# The build downloads the pinned Electron distribution, the Node.js and CPython
# runtimes, and the Python wheels the bundled payload locks (scripts/primary-runtime/
# lock.json). Those are unlisted sources this PKGBUILD cannot checksum; the
# repository pins every one of them by SHA-256 and the runtime downloader enforces
# the digest before use. A source build takes roughly 15-25 minutes and about 6 GB of
# scratch space.
#
# makepkg reports references to $srcdir inside resources/app.asar. Those are CSS-module
# virtual paths the client bundler writes into `//#region` comments; the same comments
# carry the packaging host's paths in the macOS and Windows releases. Nothing resolves
# them at runtime -- the application locates every file relative to its own directory.

pkgname=deepseek-harness-desktop
_tag=dsh-v0.1.7-rc.2
pkgver=0.1.7rc.2
pkgrel=1
pkgdesc='DeepSeek Harness desktop application (Electron shell and bundled dsh runtime)'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'libcups'
  'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
optdepends=(
  'zenity: native directory dialogs for local directory selection'
  'kdialog: native directory dialogs on Plasma'
)
makedepends=('git' 'nodejs' 'pnpm' 'python')
options=('!strip' '!debug')
source=(
  "$pkgname::git+https://github.com/deepseek-ai/deepseek-harness.git#tag=$_tag"
  'linux-desktop.patch'
  'deepseek-harness-linux.env'
)
sha256sums=(
  'SKIP'
  'a089870dbfb2a5bbc7e19ffc06bedeeba6d0220a4b11d69c3bebbe37a7846763'
  'c9783ffd57bf481f89ec59beb6047c7cf40098e4790c6098bf60370c408a4c7d'
)

prepare() {
  cd "$pkgname"

  # makepkg reuses this working copy for a re-run (and --noextract skips the reset):
  # restore the tracked files and drop the file the patch adds, so the patch below
  # always applies to a clean tree.
  git checkout -- .
  rm -f apps/desktop/scripts/linux-runtime-adjustments.ts

  # Linux desktop target, unsigned release settings, and the Electron-safe sharp
  # build plus the LibreOfficeKit engine probe fix the ASAR layout needs.
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/linux-desktop.patch"

  # The Linux target reads its release settings from a dotenv file beside the app.
  install -Dm644 "$srcdir/deepseek-harness-linux.env" apps/desktop/.env.linux
}

build() {
  cd "$pkgname"

  # The repository pins its own pnpm through packageManager; the system package bootstraps it.
  pnpm install --frozen-lockfile

  # Assemble the unpacked application: the Electron shell, the dsh runtime with its
  # production dependency closure, and the bundled Node.js/pnpm/CPython payload. The
  # target runs its own packed-runtime smoke checks -- native module loading, a real
  # image decode, a PTY, ripgrep, and a DOCX/XLSX/PPTX to PDF conversion through the
  # bundled Python -- and fails the build when any of them fails.
  pnpm --filter @deepseek-ai/dsh-desktop run package:dir
}

package() {
  cd "$pkgname"
  local appdir=apps/desktop/.desktop-build/targets/linux-x64/artifacts/linux-unpacked
  local desktop=deepseek-ai-dsh-desktop

  # Arch layout: private application payload under /usr/lib, entry point in /usr/bin.
  install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
  cp -a "$appdir/." "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
# Chromium's sandbox uses unprivileged user namespaces, which Arch enables by default;
# pass --no-sandbox only if the kernel reports them as unavailable.
exec /usr/lib/deepseek-harness-desktop/deepseek-harness "$@"
EOF

  # The file name matches the application's Wayland app id, so desktop shells and
  # window lists can map a running window back to this entry and its icon.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$desktop.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=DeepSeek Harness
Comment=DeepSeek Harness desktop application
Exec=$pkgname %U
Icon=deepseek-harness
Terminal=false
StartupNotify=true
StartupWMClass=$desktop
Categories=Development;
Keywords=AI;agent;deepseek;harness;dsh;
MimeType=x-scheme-handler/dsh;
EOF

  install -Dm644 apps/desktop/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/deepseek-harness.png"
  # The same artwork as a vector, which is what icon themes prefer at every size.
  install -Dm644 apps/desktop/resources/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/deepseek-harness.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
