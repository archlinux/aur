# Maintainer: Clove Twilight <clovetwilight3@outlook.com>
#
# This is the source of truth for the AUR package `doughmination-music`.
# The release workflow (.github/workflows/release.yml, job `aur`) copies this
# file, rewrites `pkgver` / `_appimagefile` for the tag being released, fills
# the checksums with `updpkgsums`, regenerates .SRCINFO and pushes the result
# to the AUR — so edit it HERE, never in the AUR repo, or the next release
# will overwrite your change. `pkgrel` is managed by that job too: reset to 1
# for a new `pkgver`, and incremented past whatever the AUR already carries
# when the same `pkgver` is published again (a re-run rebuilds the AppImage,
# and a new checksum under an unchanged pkgver-pkgrel leaves AUR helpers
# validating a fresh download against their cached, stale sums). So a
# pkgrel-only bump just means re-running the workflow for the tag.
#
# It repackages the published Electron AppImage rather than building from
# source (Arch's guidelines would call that a `-bin` package; the unsuffixed
# name is a deliberate maintainer preference). The AppImage bundles its own
# Chromium/Electron runtime; `depends` below is only the system libraries
# Chromium dlopen()s at runtime.

pkgname=doughmination-music
pkgver=3.1.1
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
sha256sums=('cbf7b2ab35ce29935d253bb904cd4f720b8c87263afb74cdb62fac4e636f45d8'
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

  # --appimage-extract writes squashfs-root (and every directory under it) as
  # 0700, and `cp -a src/.` stamps the source directory's mode onto the
  # destination — so this tree ships root-only unless we normalise it, and the
  # /usr/bin symlink below is unusable for every non-root user.
  find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +

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
  # electron-builder actually drops the entry at the AppImage root, beside
  # AppRun — usr/share/applications is where it *would* live in a normal
  # filesystem tree, so check both rather than betting on one.
  if [ -z "$desktop" ]; then
    desktop=$(find squashfs-root -maxdepth 1 -name '*.desktop' | head -1)
  fi
  # Not optional: this entry carries MimeType=x-scheme-handler/doughmination,
  # which is what registers the app as the handler for the doughmination://
  # OIDC sign-in callback. Silently skipping it ships a package that cannot
  # complete a login, so fail the build instead.
  if [ -z "$desktop" ]; then
    echo "::error:: no .desktop found in the AppImage — sign-in callback would not register" >&2
    return 1
  fi
  install -Dm644 "$desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/$pkgname %u|" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  if [ -d squashfs-root/usr/share/icons ]; then
    # `cp -a icons "$dest/"` REPLACES $dest with a copy of icons when $dest
    # does not exist yet, which lands the theme at /usr/share/hicolor and
    # leaves /usr/share itself mode 0700. Create the parent first so icons/
    # is copied *into* it, then normalise the 0700 dirs as above.
    install -dm755 "$pkgdir/usr/share"
    cp -a --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir/usr/share/"
    find "$pkgdir/usr/share/icons" -type d -exec chmod 755 {} +
  fi

  install -Dm644 "$srcdir/LICENCE-$pkgver.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
}
