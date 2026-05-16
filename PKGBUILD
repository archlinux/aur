# Maintainer: Anthony Trufanov <ant981228@gmail.com>
#
# AUR `cardmirror-bin` package — fetches the official x86_64
# AppImage from the GitHub release for the matching tag, extracts
# it, and installs the contents into /opt/cardmirror with a
# /usr/bin/cardmirror symlink + a .desktop entry.
#
# This is the AUR-bin pattern for Electron apps. The in-app
# auto-updater will also try to fetch new versions in the
# background; users who installed via this PKGBUILD typically
# prefer `yay -Syu` (which re-runs this PKGBUILD against a newer
# `_origver`) for updates.

pkgname=cardmirror-bin
# Original semver — matches the git tag without the leading `v`.
# Bump this and `pkgrel` when cutting a new release.
_origver=0.1.0-alpha.1
# Arch packaging convention: pkgver can't contain `-`, so we
# convert hyphens to underscores (`0.1.0-alpha.1` → `0.1.0_alpha.1`).
pkgver=${_origver//-/_}
pkgrel=1
pkgdesc="ProseMirror-based debate evidence editor; round-trips Verbatim docx"
arch=('x86_64')
url="https://github.com/ant981228/cardmirror"
license=('custom:PolyForm-Noncommercial-1.0.0')
# Electron's typical Linux runtime deps. `libxcrypt-compat` covers
# the libcrypt.so.1 lookup Electron's bundled libraries hit on
# modern Arch (Arch ships libcrypt.so.2 by default).
depends=('zlib' 'gtk3' 'nss' 'libxss' 'libxcrypt-compat')
provides=('cardmirror')
conflicts=('cardmirror' 'cardmirror-git')
options=('!strip')
source=("https://github.com/ant981228/cardmirror/releases/download/v${_origver}/cardmirror-${_origver}.AppImage")
# Alpha policy: SKIP until release sha256s stabilize. Once the
# binary publishing cadence is steady, swap in real hashes here so
# pacman / yay verifies downloads. (Run `updpkgsums` after editing
# `_origver` to refresh.)
sha256sums=('SKIP')
noextract=("cardmirror-${_origver}.AppImage")

package() {
  cd "$srcdir"
  local appimage="cardmirror-${_origver}.AppImage"
  chmod +x "$appimage"
  "./$appimage" --appimage-extract > /dev/null

  # AppImage payload → /opt/cardmirror. We keep the executable bit
  # on `AppRun`, which is the entry point we'll symlink into PATH.
  install -dm755 "$pkgdir/opt/cardmirror"
  cp -a squashfs-root/. "$pkgdir/opt/cardmirror/"

  # Launcher symlink. `AppRun` is the AppImage entry point and
  # sets up the LD search path before exec'ing the real binary.
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/cardmirror/AppRun "$pkgdir/usr/bin/cardmirror"

  # Desktop entry. The AppImage ships a `.desktop` file at the
  # squashfs root; we install it under /usr/share/applications and
  # rewrite the `Exec=` line so the menu launcher uses our
  # /usr/bin/cardmirror symlink rather than the AppImage's
  # internal AppRun path.
  install -Dm644 squashfs-root/cardmirror.desktop \
    "$pkgdir/usr/share/applications/cardmirror.desktop"
  sed -i 's|^Exec=.*|Exec=cardmirror %U|' \
    "$pkgdir/usr/share/applications/cardmirror.desktop"

  # Icon, if shipped at squashfs root. Newer electron-builder
  # places it under usr/share/icons/hicolor/... in the AppImage;
  # we replicate that into $pkgdir if present.
  if [ -d squashfs-root/usr/share/icons ]; then
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"
  fi
}
