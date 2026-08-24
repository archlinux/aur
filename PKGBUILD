# Maintainer: Clove Twilight <clovetwilight3@outlook.com>
#
# This is the source of truth for the AUR package `doughmination-music`.
# The release workflow (.github/workflows/release.yml, job `aur`) copies this
# file, rewrites `pkgver` / `_appimagefile` for the tag being released, fills
# the checksums with `updpkgsums`, regenerates .SRCINFO and pushes the result
# to the AUR — so edit it HERE, never in the AUR repo, or the next release
# will overwrite your change. `pkgrel` is likewise reset to 1 every release;
# a pkgrel-only bump means bumping it here and re-running the workflow.
#
# It repackages the published AppImage rather than building from source:
# building here would mean fetching the proprietary Discord Social SDK from
# our own CDN mid-build and compiling the whole Tauri/Rust tree on the user's
# machine. Note that Arch's naming guidelines would call this a `-bin`
# package; the unsuffixed name is a deliberate maintainer preference.
#
# The AppImage deliberately bundles no system libraries (see the "unbundle the
# GTK/WebKitGTK stack" step in the release workflow), so this really is just
# the app binary plus the Discord SDK — `depends` below is the whole runtime.

pkgname=doughmination-music
pkgver=2.2.0
pkgrel=1
pkgdesc="Desktop client for Doughmination Music, a self-hosted Pocket ID music library"
arch=('x86_64')
url="https://github.com/Clove-Web/pocket-id-music-player"
license=('LicenseRef-DASL-1.0')
depends=(
  # Linked by the app binary itself.
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'glib2'
  'gdk-pixbuf2'
  'cairo'
  'dbus'
  'gcc-libs'
  'glibc'
  # Linked by libdiscord_partner_sdk.so — all DT_NEEDED entries, so the app
  # fails to start outright if any are missing, not just Rich Presence.
  'alsa-lib'
  'libpulse'
  'libx11'
  'libatomic'
  # Owns the /usr/share/icons/hicolor hierarchy this package drops icons into.
  'hicolor-icon-theme'
  # Sign-in hands the OIDC flow to the system browser via tauri-plugin-opener,
  # which shells out to xdg-open.
  'xdg-utils'
)
# Prebuilt upstream binaries: nothing to strip, no debug package to split out.
options=('!strip' '!debug')

# Tauri names the artifact from `productName` + the version in
# tauri.conf.json, which is not necessarily the git tag — the workflow
# overwrites this line with the asset name it actually finds on the release.
_appimagefile="Doughmination.Music_1.0.0_amd64.AppImage"

source=(
  "$pkgname-$pkgver.AppImage::$url/releases/download/v$pkgver/$_appimagefile"
  "LICENCE-$pkgver.md::https://raw.githubusercontent.com/Clove-Web/pocket-id-music-player/v$pkgver/LICENCE.md"
)
# An AppImage is an ELF with a squashfs glued on; makepkg must not try to
# unpack it itself — prepare() uses the AppImage's own extractor.
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('d81b67e0ef31e26145e4c63d4856c7e0e4f4f7401807842dd9c19e446cef6f06'
            '93aa15616c8d2ad987372388e9cc1cd360501a98bc9cebd656acfa938368f538')

prepare() {
  chmod +x "$pkgname-$pkgver.AppImage"
  "./$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"

  # The binary finds libdiscord_partner_sdk.so through a `$ORIGIN/../lib`
  # RUNPATH (see apps/desktop/src-tauri/build.rs), so bin/ and lib/ have to
  # stay siblings under /opt — hence no plain /usr/bin install.
  install -Dm755 "usr/bin/$pkgname" "$pkgdir/opt/$pkgname/bin/$pkgname"
  install -Dm755 usr/lib/libdiscord_partner_sdk.so \
    "$pkgdir/opt/$pkgname/lib/libdiscord_partner_sdk.so"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 usr/share/applications/*.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  local icon dir
  for icon in usr/share/icons/hicolor/*/apps/"$pkgname".png; do
    dir="${icon#usr/share/icons/hicolor/}"
    dir="${dir%%/*}"
    # Tauri emits a "256x256@2" directory; hicolor's scaled-icon dirs are
    # named "...@2x", and anything else is ignored by the icon cache.
    [[ $dir == *@2 ]] && dir="${dir}x"
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$dir/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/LICENCE-$pkgver.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
}
