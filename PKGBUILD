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
# It repackages the published Electron AppImage rather than building from
# source (Arch's guidelines would call that a `-bin` package; the unsuffixed
# name is a deliberate maintainer preference). The AppImage bundles its own
# Chromium/Electron runtime; `depends` below is only the system libraries
# Chromium dlopen()s at runtime.

pkgname=doughmination-music
pkgver=3.1.0
pkgrel=1
pkgdesc="Desktop client for Doughmination Music, a self-hosted Pocket ID music library"
arch=('x86_64')
url="https://github.com/Clove-Web/pocket-id-music-player"
license=('LicenseRef-DASL-1.0')
depends=(
  'gtk3'
  'nss'
  'nspr'
  'alsa-lib'
  'at-spi2-core'
  'libcups'
  'libxkbcommon'
  'libxtst'
  'libxss'
  'libnotify'
  'mesa'
  'libdrm'
  # Owns the /usr/share/icons/hicolor hierarchy this package drops icons into.
  'hicolor-icon-theme'
  # Sign-in hands the OIDC flow to the system browser (shell.openExternal ->
  # xdg-open).
  'xdg-utils'
)
options=('!strip' '!debug')

# electron-builder names this from apps/desktop/electron-builder.yml's
# `artifactName` (version-less). The workflow overwrites this line with the
# asset name it actually finds on the release, so a mismatch can't 404.
_appimagefile="Doughmination.Music_amd64.AppImage"

source=(
  "$pkgname-$pkgver.AppImage::$url/releases/download/v$pkgver/$_appimagefile"
  "LICENCE-$pkgver.md::https://raw.githubusercontent.com/Clove-Web/pocket-id-music-player/v$pkgver/LICENCE.md"
)
# An AppImage is an ELF with a squashfs glued on; makepkg must not try to
# unpack it itself — prepare() uses the AppImage's own extractor.
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('f97df32f56281c4354f657c653df691f2647aca5b3f5fef637af18c4d30c7562'
            '93aa15616c8d2ad987372388e9cc1cd360501a98bc9cebd656acfa938368f538')

prepare() {
  chmod +x "$pkgname-$pkgver.AppImage"
  "./$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  # electron-builder's AppImage keeps the whole app at the root of the mount:
  # the Electron binary (our `executableName`, == $pkgname), plus resources/,
  # locales/, *.pak, *.bin, *.so and chrome-sandbox. Electron needs those
  # adjacent, so install the tree under /opt and symlink into PATH.
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a --no-preserve=ownership squashfs-root/. "$pkgdir/opt/$pkgname/"

  # Drop the AppImage-only bits — the runtime doesn't use them, and the
  # usr/share tree is installed to real system paths below instead.
  rm -rf "$pkgdir/opt/$pkgname/usr" \
         "$pkgdir/opt/$pkgname/AppRun" \
         "$pkgdir/opt/$pkgname/AppRun.wrapped" \
         "$pkgdir/opt/$pkgname/.DirIcon"
  rm -f "$pkgdir/opt/$pkgname"/*.desktop

  if [ ! -x "$pkgdir/opt/$pkgname/$pkgname" ]; then
    echo "::error:: expected Electron binary /opt/$pkgname/$pkgname not found — AppImage layout changed" >&2
    ls -la "$pkgdir/opt/$pkgname" >&2
    return 1
  fi

  # Electron's sandbox helper must be setuid root.
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # .desktop from the AppImage (globbed — electron-builder's basename has
  # varied). Repoint Exec at the installed path; keep %u so the
  # doughmination:// sign-in callback is forwarded to the app.
  local desktop
  desktop=$(find squashfs-root/usr/share/applications -name '*.desktop' 2>/dev/null | head -1)
  if [ -n "$desktop" ]; then
    install -Dm644 "$desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i "s|^Exec=.*|Exec=/usr/bin/$pkgname %u|" \
      "$pkgdir/usr/share/applications/$pkgname.desktop"
  fi

  if [ -d squashfs-root/usr/share/icons ]; then
    cp -a --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir/usr/share/"
  fi

  install -Dm644 "$srcdir/LICENCE-$pkgver.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
}
