# Maintainer: Bernardo P. G. <bernardopg@users.noreply.github.com>

pkgname=steam-game-idler-git
_pkgname=steam-game-idler
# pkgver is a placeholder — the real version is computed by pkgver() at build
# time from the upstream tauri.conf.json + the steam-game-idler submodule's
# commit history. The AUR publish workflow updates this line before pushing.
pkgver=5.0.5.r1716.g6efea011
pkgrel=1
pkgdesc='Idle Steam games and farm trading cards with Linux support'
arch=('x86_64')
url='https://github.com/bernardopg/SGI'
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'dotnet-sdk'
  'git'
  'nodejs'
  'pnpm'
  'rust'
)
provides=('steam-game-idler')
conflicts=('steam-game-idler')
options=('!lto' '!strip' '!debug')
source=('git+https://github.com/bernardopg/SGI.git#commit=a9ff482ce7924118e1def6df7eb8d6177f2ef2b3')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/SGI"
  git submodule update --init --recursive

  local appver rev hash
  appver='5.0.5'
  rev=$(git -C steam-game-idler rev-list --count HEAD)
  hash=$(git -C steam-game-idler rev-parse --short HEAD)

  printf '%s.r%s.g%s' "$appver" "$rev" "$hash"
}

prepare() {
  cd "$srcdir/SGI"
  git submodule update --init --recursive

  cd steam-game-idler
  pnpm install --frozen-lockfile

  # AUR builds have no embedded Steam API key; remove the production panic so the app
  # starts normally. API features will fail gracefully until the user sets the key in
  # Settings or launches with KEY=<steam_web_api_key> in the environment.
  sed -i \
    's/panic!("No obfuscated API key available in production build");/\/\/ no embedded key — user configures via Settings/' \
    src-tauri/src/lib.rs
}

build() {
  cd "$srcdir/SGI/steam-utility-multiplataform"
  dotnet publish src/SteamUtility.Cli/SteamUtility.Cli.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:DebugType=None \
    -p:DebugSymbols=false \
    -o "$srcdir/SGI/steam-game-idler/src-tauri/libs"

  cd "$srcdir/SGI/steam-game-idler"

  # pacman handles updates; disable Tauri updater artifact generation (requires a signing key)
  sed -i 's/"createUpdaterArtifacts": "[^"]*"/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json

  export NEXT_TELEMETRY_DISABLED=1
  export TAURI_CI=1
  # fat LTO requires 10+ GB RAM; thin LTO is the standard choice for packaged builds
  export CARGO_PROFILE_RELEASE_LTO=thin
  pnpm tauri build --bundles deb
}

package() {
  cd "$srcdir/SGI/steam-game-idler"

  local deb
  deb=$(find src-tauri/target/release/bundle/deb -type f -name '*.deb' | head -n1)

  if [[ -z "$deb" ]]; then
    echo 'Tauri did not produce a .deb bundle' >&2
    return 1
  fi

  mkdir -p "$srcdir/deb-extract"
  bsdtar -xf "$deb" -C "$srcdir/deb-extract"
  bsdtar -xf "$srcdir/deb-extract"/data.tar.* -C "$pkgdir"

  # .pdb files embed absolute $srcdir paths; not needed at runtime
  find "$pkgdir" -name '*.pdb' -delete

  # Tauri's .deb names paths after productName ("Steam Game Idler"), which embeds
  # spaces into /usr/bin/ and /usr/lib/. Rename to a shell-friendly lowercase form
  # so the binary is tab-completable and follows Linux packaging conventions.
  local branded='Steam Game Idler'
  local lower='steam-game-idler'

  if [[ -d "$pkgdir/usr/lib/$branded" ]]; then
    mv "$pkgdir/usr/lib/$branded" "$pkgdir/usr/lib/$lower"
  fi

  # Two upstream Linux bugs make the app misbehave when the binary lives in
  # /usr/bin/ and resources in /usr/lib/<app>/:
  #
  #   1. is_portable() in src-tauri/src/utils.rs treats `<exe_dir>/.installed`
  #      as the install marker. With the binary at /usr/bin/, the marker is
  #      never found and is_portable() returns true → the app then tries to
  #      write its cache to /usr/bin/cache/ (read-only) and stores window
  #      state next to the binary.
  #   2. get_lib_path() resolves SteamUtility.Cli relative to the binary as
  #      `<exe_dir>/libs/SteamUtility.Cli`, which becomes
  #      /usr/bin/libs/SteamUtility.Cli — wrong location.
  #
  # Move the actual ELF into /usr/lib/<lower>/ alongside .installed and libs/,
  # and replace /usr/bin/<lower> with a relative symlink. std::env::current_exe()
  # on Linux reads /proc/self/exe, which resolves through the symlink to the
  # real path under /usr/lib/<lower>/. After this, both helpers find what they
  # expect:
  #   - is_portable() finds /usr/lib/<lower>/.installed  → returns false
  #   - get_lib_path() returns /usr/lib/<lower>/libs/SteamUtility.Cli
  if [[ -f "$pkgdir/usr/bin/$branded" ]]; then
    install -Dm755 "$pkgdir/usr/bin/$branded" "$pkgdir/usr/lib/$lower/$lower"
    rm -f "$pkgdir/usr/bin/$branded"
    ln -sf "../lib/$lower/$lower" "$pkgdir/usr/bin/$lower"
  elif [[ -f "$pkgdir/usr/bin/$lower" && ! -L "$pkgdir/usr/bin/$lower" ]]; then
    install -Dm755 "$pkgdir/usr/bin/$lower" "$pkgdir/usr/lib/$lower/$lower"
    rm -f "$pkgdir/usr/bin/$lower"
    ln -sf "../lib/$lower/$lower" "$pkgdir/usr/bin/$lower"
  fi

  # Tauri emits a 256x256@2 directory (macOS HiDPI convention); rename to standard 256x256
  # so gtk-update-icon-cache does not reject the hicolor theme
  local icon_hi="$pkgdir/usr/share/icons/hicolor"
  if [[ -d "$icon_hi/256x256@2" && ! -d "$icon_hi/256x256" ]]; then
    mv "$icon_hi/256x256@2" "$icon_hi/256x256"
  else
    rm -rf "$icon_hi/256x256@2"
  fi

  # gtk-update-icon-cache rejects icon basenames containing spaces.
  find "$icon_hi" -type f -name "$branded.png" -execdir mv "$branded.png" "$lower.png" \;

  # Rewrite the .desktop: rename the file, fix Icon, fix Exec to point at the new
  # binary path, and strip the literal double-quotes that tauri-bundler places
  # around StartupWMClass and Exec values — those quotes break WM_CLASS matching
  # on most desktops and prevent the launcher from grouping windows correctly.
  # The runtime WM_CLASS is the productName, so we keep "Steam Game Idler" as
  # the StartupWMClass value (without quotes).
  local desktop_old="$pkgdir/usr/share/applications/$branded.desktop"
  local desktop_new="$pkgdir/usr/share/applications/$lower.desktop"
  if [[ -f "$desktop_old" ]]; then
    mv "$desktop_old" "$desktop_new"
    sed -i \
      -e "s|^Icon=.*|Icon=$lower|" \
      -e "s|^Exec=.*|Exec=/usr/bin/$lower|" \
      -e "s|^StartupWMClass=.*|StartupWMClass=$branded|" \
      "$desktop_new"
  fi

  # Tauri ships /usr/lib/<app>/ with mode d--x--x--x on some build hosts (a known
  # tauri-bundler quirk that breaks `ls` for non-root users). Force directories to
  # 755 and regular files to a readable mode so the package is well-formed.
  if [[ -d "$pkgdir/usr/lib/$lower" ]]; then
    chmod 755 "$pkgdir/usr/lib/$lower"
    find "$pkgdir/usr/lib/$lower" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/$lower" -type f -exec chmod a+r {} +
    if [[ -x "$pkgdir/usr/lib/$lower/libs/SteamUtility.Cli" ]]; then
      chmod 755 "$pkgdir/usr/lib/$lower/libs/SteamUtility.Cli"
    fi
  fi
}
