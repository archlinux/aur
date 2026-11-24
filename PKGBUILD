# Maintainer: hanami117 <hello at getuzumaki dot app>
#
# Draft for the AUR package `uzumaki`, built from the release's source tarball.
# Fill in at release time (packaging/release.sh prints these values):
#   - pkgver        the release version, without the v
#   - _build        the upstream build number (the BUILD file; 1 for a new version)
#   - sha256sums    the tarball's checksum (uzumaki-<version>.tar.gz.sha256 on the release)
#   - pkgrel        1 for a new version. One more for a change to this PKGBUILD only (the same
#                   tarball), and for a new upstream build of the same version.
# Then: makepkg --printsrcinfo > .SRCINFO, test (makepkg -si, namcap PKGBUILD *.pkg.tar.zst,
# extra-x86_64-build), and push PKGBUILD + .SRCINFO to ssh://aur@aur.archlinux.org/uzumaki.git.
#
# Layout (like install.sh, but system-wide):
#   /usr/lib/uzumaki/uzumaki, uzu      the binaries; /usr/bin/uzumaki and /usr/bin/uzu link to them
#   /usr/lib/uzumaki/bridge/           the playback bridge with castLabs Electron in node_modules
#                                      (the app finds it beside its binary: bridge.rs, bridge_in_libdir)
#   /usr/lib/uzumaki/cliairplay        the AirPlay helper (Music Assistant's airplay-cli, GPL-3.0),
#                                      built from source at the tag _cliairplay; the app finds it
#                                      beside its binary (airplay/src/helper.rs, find)
#   /usr/share/applications, /usr/share/icons/hicolor, /usr/share/licenses/uzumaki
#   /usr/share/uzumaki/icons/<variant>/<size>.png   the App icon choices (source for app_icon.rs)
# Built with UZUMAKI_CHANNEL=aur (build() below): the app's update notice says "Update with your
# package manager: yay -Syu uzumaki" and never offers a download, and its daily update check reports
# the channel "aur" (app/src/update.rs).
#
# Checked on Arch (0.1.0): makepkg from the release tarball (715 files, chrome-sandbox setuid root).
# Still to check, with namcap and devtools installed:
#   [ ] extra-x86_64-build (clean chroot), not only makepkg on the dev machine
#   [ ] namcap PKGBUILD and namcap on the built *.pkg.tar.zst (dlopen'd libraries are expected
#       to be missing from its output; every listed depend must be a real package)
# And in a live session after pacman -U:
#   [ ] a Wayland AND an X11 session: window, Vulkan drawing, keyboard and mouse input, tray icon,
#       media keys; playback (sign in, play a song; the Widevine CDM downloads on first use)
#   [ ] Settings -> Appearance -> App icon: a pick writes only under ~/.local/share
#       (icons/hicolor/*/apps and applications/*.desktop); `pacman -Qkk uzumaki` stays clean;
#       Dark removes those overrides again
#   [ ] the update notice for a package install says to update with the package manager
# makepkg warns "Package contains reference to $srcdir": env!("CARGO_MANIFEST_DIR") paths in the
# binary, the source tree fallbacks a development build uses for its bridge and icons. Harmless.
# The Widevine CDM is not in this package: Chromium downloads it from Google on first use.

pkgname=uzumaki
pkgver=0.4.4
# The upstream build: 1 is tag v<version>, a rebuild of the same version is v<version>-<build>
# (tarball uzumaki-<version>-<build>.tar.gz, still unpacking to uzumaki-<version>/).
_build=1
if ((_build > 1)); then _rel=$pkgver-$_build; else _rel=$pkgver; fi
pkgrel=1
pkgdesc='Native desktop client for Apple Music, GPU-rendered in Rust (needs a subscription)'
# castLabs Electron is fetched for the build machine's architecture; only x86_64 is tested.
arch=('x86_64')
url='https://getuzumaki.app'
# Uzumaki: GPL-3.0-or-later. cliairplay (/usr/lib/uzumaki/cliairplay): GPL-3.0 (its LICENSE, no "or later" notice).
license=('GPL-3.0-or-later' 'GPL-3.0-only')
# Run time. The app (Rune/winit/wgpu) loads Vulkan, xkbcommon and the Wayland and X11 client
# libraries with dlopen, so namcap cannot see them: they are listed by hand so both a Wayland and
# an X11 session work. rodio: ALSA; MPRIS and the tray: D-Bus. The rest is castLabs Electron's
# own needs (what Arch's electron packages depend on).
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11' # winit's X11 backend dlopens libxkbcommon-x11.so.0 and panics without it
  'libxkbfile'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'pango'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-driver: GPU drawing (vulkan-radeon, vulkan-intel or nvidia-utils)'
  'libsecret: Chromium can store its cookies encrypted with the keyring'
  'ffmpeg: animated album artwork (without it the covers stay still)'
)
# cargo is provided by rust and by rustup (rustup users need a default toolchain). git: npm
# fetches castLabs Electron from its git repository.
# gcc, g++, make, objdump (cliairplay): base-devel.
makedepends=('cargo' 'npm' 'git' 'pkgconf')
options=('!lto')
source=("$pkgname-$_rel.tar.gz::https://github.com/hanami117/uzumaki/releases/download/v$_rel/uzumaki-$_rel.tar.gz")
# The tarball's sha256 (packaging/release.sh prints it; uzumaki-<version>.tar.gz.sha256 on the release).
# Keep this line alone: the release workflow rewrites exactly `sha256sums=('...')`.
sha256sums=('cbe5d7fafc2818f89b697d8effef9ed0fcfeaa6f6fa83be8da2c2779e54c69f9')
# The AirPlay helper cliairplay at the tag scripts/airplay/build-cliairplay.sh pins (a test in
# airplay/tests/packaging.rs keeps the two equal), with the libraop submodules its build reads
# (libraop's prebuilt codec, mDNS and OpenSSL 3 archives; their own nested submodules, the codec and
# OpenSSL sources, are not needed). prepare() points the submodules at these clones, so build()
# needs no network. Each submodule ends at the commit its parent pins, whatever branch is fetched.
# Git, not snapshot tarballs: the commits then follow the tag by themselves, and `git describe` gives
# the helper its version (a tarball build reports the stale literal in cliairplay.c). The first build
# fetches about 820 MB of git history (libraop, libopenssl and libcodecs carry prebuilt archives);
# makepkg keeps the mirrors in $SRCDEST and later builds fetch only what changed.
_cliairplay=v0.5.10
source+=(
  "airplay-cli::git+https://github.com/music-assistant/airplay-cli.git#tag=$_cliairplay"
  'libraop::git+https://github.com/philippe44/libraop.git'
  'crosstools::git+https://github.com/philippe44/crosstools.git'
  'dmap-parser::git+https://github.com/philippe44/dmap-parser.git'
  'libcodecs::git+https://github.com/philippe44/libcodecs.git'
  'libmdns::git+https://github.com/philippe44/libmdns.git'
  'libopenssl::git+https://github.com/philippe44/libopenssl.git'
)
sha256sums+=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_submodules() {
  local dir=$1; shift
  local m
  for m in "$@"; do
    git -C "$dir" submodule init "$m"
    git -C "$dir" config "submodule.$m.url" "$srcdir/$m"
  done
  git -C "$dir" -c protocol.file.allow=always submodule update --quiet "$@"
}

prepare() {
  _submodules airplay-cli libraop
  _submodules airplay-cli/libraop crosstools dmap-parser libcodecs libmdns libopenssl

  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # castLabs Electron (bridge/.npmrc allows its git dependency). Its zip goes to a cache inside
  # $srcdir, not ~/.cache/electron.
  cd bridge
  export electron_config_cache="$srcdir/electron-cache"
  npm ci --no-audit --no-fund
  # npm may skip the package's own install script: fetch the binary explicitly.
  node node_modules/electron/install.js
  test -x node_modules/electron/dist/electron
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Read at compile time: the update notice points at the package manager, the check says "aur".
  export UZUMAKI_CHANNEL=aur
  cargo build --frozen --release -p uzumaki -p uzumaki-ctl
  # Into target/cliairplay/cliairplay; links libstdc++/libatomic statically (needs only glibc).
  CLIAIRPLAY_SRC="$srcdir/airplay-cli" scripts/airplay/build-cliairplay.sh
}

package() {
  cd "$pkgname-$pkgver"
  local lib="$pkgdir/usr/lib/$pkgname"

  install -Dm755 target/release/uzumaki "$lib/uzumaki"
  install -Dm755 target/release/uzu "$lib/uzu"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/uzumaki" "$pkgdir/usr/bin/uzumaki"
  ln -s "/usr/lib/$pkgname/uzu" "$pkgdir/usr/bin/uzu"
  install -Dm755 target/cliairplay/cliairplay "$lib/cliairplay"

  # The bridge, as install.sh copies it.
  install -dm755 "$lib/bridge"
  install -m644 bridge/main.js bridge/preload.js bridge/signin.js bridge/airplay.js bridge/package.json \
    bridge/package-lock.json bridge/.npmrc "$lib/bridge/"
  cp -a --no-preserve=ownership bridge/node_modules "$lib/bridge/"
  # Electron's zip has group-writable files (rwxrwxr-x); root-owned files shouldn't be.
  chmod -R go-w "$lib/bridge"
  # Chromium's sandbox helper, as Electron ships it: root-owned and setuid. Chromium uses it only
  # where unprivileged user namespaces are off (linux-hardened, some sysctl setups); elsewhere it
  # uses the namespace sandbox. Without it there Electron refuses to start ("SUID sandbox helper
  # binary was found, but is not configured correctly").
  chmod 4755 "$lib/bridge/node_modules/electron/dist/chrome-sandbox"

  install -Dm644 "assets/io.github.hanami117.uzumaki.desktop" \
    "$pkgdir/usr/share/applications/io.github.hanami117.uzumaki.desktop"
  local icon size
  for icon in assets/icons/hicolor/*/apps/io.github.hanami117.uzumaki.png; do
    size=$(basename "$(dirname "$(dirname "$icon")")")
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/io.github.hanami117.uzumaki.png"
  done
  # The variants behind Settings -> Appearance -> App icon, as install.sh lays them out. The app
  # never writes here: a non-default choice puts user overrides in ~/.local/share (icons and a
  # copy of the desktop entry marked X-Uzumaki-Override=true); Dark removes them again.
  local variant
  for variant in assets/icons/variants/*/; do
    install -dm755 "$pkgdir/usr/share/$pkgname/icons/$(basename "$variant")"
    install -m644 "$variant"*.png "$pkgdir/usr/share/$pkgname/icons/$(basename "$variant")/"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 packaging/CLIAIRPLAY_LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/CLIAIRPLAY_LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
