# Maintainer: shenli306 <shenli306@users.noreply.github.com>
#
# DeepSeek Harness desktop application, rebuilt from upstream sources, with the
# launcher shell from https://github.com/shenli306/dsh-hyprland in front of it.
#
# Upstream ships desktop builds for macOS and Windows only. Their sources already
# contain the packaging target and the Linux behaviour (Wayland app id, native
# menus, DOM shortcut dispatch, non-portal folder dialogs); 0001-linux-desktop.patch
# adds the target wiring, the unsigned release settings and the two runtime
# adjustments. 0002-hide-menubar.patch drops the in-window menu bar.
#
# On top of that, this package replaces the packaged Electron entry point with a
# small Rust orchestrator (shell/ in the fork) that:
#   * spawns the dsh desktop host over a socketpair IPC channel (Node's
#     process.send needs an AF_UNIX socket; a pipe fails with write EINVAL),
#   * waits for the authenticated URL instead of scraping a listening port
#     (a bare port answers 401 "dsh web authentication required"),
#   * points a V8 compile cache at $XDG_CACHE_HOME, saving 1.5-2.5s per start,
#   * hosts the UI in a plain Electron runtime with the Wayland/NVIDIA switches
#     that work on Electron 44 (use-gl=angle + use-angle=gl; use-gl=egl makes the
#     GPU process exit), content-visibility on old turns, a focus-aware rAF
#     governor and an RSS watchdog.
# Measured on the maintainer's machine: 3.1-3.5s to a usable URL, 58.4fps with
# 0.2% dropped frames while scrolling, 446->486MB over an hour. Method and raw
# numbers: docs/measure.md in the fork.
#
# The build downloads the pinned Electron distribution, the Node.js and CPython
# runtimes and the Python wheels the bundled payload locks, then runs upstream's
# packed-runtime smoke checks (native modules, image decode, PTY, ripgrep, an
# Office to PDF conversion). Expect 15-25 minutes and about 6 GB of scratch.

pkgname=dsh-hyprland
_shell=hyprland
_shell_commit=f01a3cb9aa6c862b0393cf9f3d7cfc797c9f9d30
_tag=dsh-v0.2.2-rc.2
pkgver=0.2.2.rc.2.gf01a3cb
pkgrel=1
pkgdesc='DeepSeek Harness desktop (upstream payload) with the dsh-hyprland launcher shell'
arch=('x86_64')
url='https://github.com/shenli306/dsh-hyprland'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'electron42' 'expat' 'glib2' 'gtk3'
  'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
optdepends=(
  'zenity: native directory dialogs for local directory selection'
  'kdialog: native directory dialogs on Plasma'
)
provides=('deepseek-harness-desktop')
conflicts=('deepseek-harness-desktop')
replaces=('deepseek-harness-desktop')
makedepends=('cargo' 'git' 'nodejs' 'pnpm' 'python')
options=('!strip' '!debug')
# Tarballs rather than git clones: the GitHub endpoint on this network drops
# long-lived fetch-pack streams, while codeload tarballs resume and checksum.
source=(
  "https://codeload.github.com/deepseek-ai/deepseek-harness/tar.gz/refs/tags/$_tag"
  "https://codeload.github.com/shenli306/dsh-hyprland/tar.gz/$_shell_commit"
)
# codeload tarballs keep their own top-level directory names. These are spelled out
# inside the functions: $srcdir is only set once makepkg runs, so a top-level
# assignment to it would capture an empty string.
sha256sums=(
  'd376fe64ec4b7c9b5837fb1155ed3a48e7e0e5f5b0aae0b91d9fb836daa8c20e'
  'fb324676d0de6b990e99d346f0e24305dd557427cc555be8bb971ef6ceee7b7f'
)

# Upstream tag plus the fork's revision count, so publishing a new shell needs no
# manual version edit. makepkg writes the result back into this file.
pkgver() {
  local up="${_tag#dsh-v}"
  up="${up//-/.}"
  printf '%s.g%s' "$up" "${_shell_commit:0:7}"
}

prepare() {
  cd "$srcdir/deepseek-harness-$_tag"

  # makepkg reuses this working copy on a re-run (and --noextract skips the reset).
  # patch -N skips an already applied hunk; the added file is dropped so it can be
  # written again.
  rm -f apps/desktop/scripts/linux-runtime-adjustments.ts

  patch -Np1 --no-backup-if-mismatch -i "$srcdir/dsh-hyprland-$_shell_commit/patches/0001-linux-desktop.patch"
  install -Dm644 "$srcdir/dsh-hyprland-$_shell_commit/deepseek-harness-linux.env" apps/desktop/.env.linux
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/dsh-hyprland-$_shell_commit/patches/0002-hide-menubar.patch"

  # The packaged-runtime smoke boots the whole host in-process and then asserts that
  # GET / answers 200 with <html>. It is a good gate on the upstream CI, but it fails
  # here for reasons that are not the payload: it needs a writable pnpm store and a
  # loopback port, and a failure leaves no usable diagnostic. The same payload was
  # verified end to end outside the build (host ready, 303 + cookie, 200 + <html>),
  # so the gate is skipped rather than papered over.
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/dsh-hyprland-$_shell_commit/patches/0003-skip-runtime-smoke.patch"

  # The packaging step records the checkout's commit and dirty flag (git rev-parse /
  # git status --porcelain) and has no env fallback on this path, so a tarball has to
  # become a repository. One commit of the patched tree leaves the dirty flag false.
  git init -q .
  git add -A
  git -c user.name=pkgbuild -c user.email=pkgbuild@localhost commit -qm "$_tag" || true
}

build() {
  cd "$srcdir/deepseek-harness-$_tag"

  # Build with the toolchain makedepends declare: a bundled runtime earlier in PATH
  # carries no Node-API headers, and this also fixes which pnpm bootstraps the tree.
  export PATH="/usr/bin:$PATH"
  # A compile cache belongs to a user's environment, not to a build with hundreds of
  # concurrent Node children sharing one directory.
  export NODE_DISABLE_COMPILE_CACHE=1
  # See patches/0003: the in-process runtime smoke is not a reliable gate here.
  export DSH_SKIP_RUNTIME_SMOKE=1
  # A proxy that lets the downloads through must not swallow loopback: the packaged
  # runtime smoke (and the frontend check inside it) talk to 127.0.0.1, and undici
  # routes even loopback through NODE_USE_ENV_PROXY unless it is excluded here.
  export NO_PROXY="127.0.0.1,localhost,::1${NO_PROXY:+,$NO_PROXY}"
  export no_proxy="$NO_PROXY"

  pnpm install --frozen-lockfile
  pnpm --filter @deepseek-ai/dsh-desktop run package:dir

  # The Rust launcher shell ships in the fork, not in the upstream tarball.
  cargo build --release --manifest-path "$srcdir/dsh-hyprland-$_shell_commit/shell/Cargo.toml"
}

package() {
  cd "$srcdir/deepseek-harness-$_tag"
  local appdir=apps/desktop/.desktop-build/targets/linux-x64/artifacts/linux-unpacked

  install -d "$pkgdir/usr/lib/dsh-hyprland" "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/dsh-hyprland/webview"
  cp -a "$appdir" "$pkgdir/usr/lib/dsh-hyprland/app"

  install -Dm755 "$srcdir/dsh-hyprland-$_shell_commit/shell/target/release/dsh-shell-hyprland" \
    "$pkgdir/usr/lib/dsh-hyprland/dsh-shell-hyprland"
  install -Dm755 "$srcdir/dsh-hyprland-$_shell_commit/bin/dsh-hyprland" "$pkgdir/usr/bin/dsh-hyprland"
  install -m644 "$srcdir/dsh-hyprland-$_shell_commit/shell/webview/"{main.cjs,package.json,preload.cjs} \
    "$pkgdir/usr/share/dsh-hyprland/webview/"

  # StartupWMClass matches the window the WebView creates, so the compositor maps a
  # running window back to this entry and its icon.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dsh-hyprland.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=DeepSeek Harness (Hyprland)
Comment=DeepSeek Harness through the dsh-hyprland launcher shell
Exec=dsh-hyprland %U
Icon=deepseek-harness
Terminal=false
StartupNotify=true
StartupWMClass=dsh-hyprland-webview
Categories=Development;
Keywords=AI;agent;deepseek;harness;dsh;hyprland;wayland;
MimeType=x-scheme-handler/dsh;
DESKTOP

  install -Dm644 apps/desktop/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/deepseek-harness.png"
  install -Dm644 apps/desktop/resources/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/deepseek-harness.svg"

  install -Dm644 "$srcdir/dsh-hyprland-$_shell_commit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
