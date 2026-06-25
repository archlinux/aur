# Maintainer: Anthony Trufanov <ant981228@gmail.com>
#
# AUR `cardmirror-bin` package — repackages the official upstream
# `.pacman` artifact from the GitHub Release for the matching tag.
#
# Prior versions of this PKGBUILD bootstrapped from the AppImage
# (extracted its squashfs into /opt/cardmirror and symlinked
# /usr/bin/cardmirror → /opt/cardmirror/AppRun). That broke at
# launch because AppRun is the AppImage runtime's launcher script
# — its path-resolution math (`HERE="$(dirname "$(readlink -f "$0")")"`)
# only works from inside the squashfs mount where `$APPDIR` is
# set. Extracted to a regular directory, the resolution produces
# an empty `${HERE}` and exec fails with "/cardmirror: No such
# file or directory."
#
# The `.pacman` upstream is already a fully-formed Arch package
# (XZ-tar with the expected /opt + /usr layout + .PKGINFO
# metadata; electron-builder produces it via fpm). We unpack its
# payload into $pkgdir and add the /usr/bin/cardmirror symlink
# directly to the package contents — pointing at the real
# Electron binary at /opt/CardMirror/cardmirror, NOT the
# AppImage's AppRun. The upstream's own .INSTALL script does this
# at install-time via update-alternatives; we bake it in as a
# package payload so no custom .install script is required.

pkgname=cardmirror-bin
# Original semver — matches the git tag without the leading `v`.
# Bump this and reset `pkgrel=1` when cutting a new release.
# Increment `pkgrel` (not `_origver`) for AUR-only changes
# (PKGBUILD fixes, dependency tweaks).
_origver=0.1.0-beta.1
# Arch packaging convention: pkgver can't contain `-`, so we
# convert hyphens to underscores (`0.1.0-alpha.8` → `0.1.0_alpha.8`).
pkgver=${_origver//-/_}
pkgrel=1
pkgdesc="ProseMirror-based debate evidence editor; round-trips Verbatim docx"
arch=('x86_64')
url="https://github.com/ant981228/cardmirror"
license=('custom:PolyForm-Noncommercial-1.0.0')
# Match electron-builder's pacman dependency list — see
# `apps/desktop/package.json` > `build.pacman.depends`.
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libnotify' 'libvpx'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy'
         'libxcrypt-compat')
provides=('cardmirror')
# `CardMirror` (capital C) is the package name electron-builder
# stamps into the upstream `.pacman` itself (from `productName`).
# Users who installed via direct `pacman -U cardmirror-*.pacman`
# end up with that package and would collide on disk with this
# AUR-bin's payload — declare the conflict so pacman offers to
# remove the upstream copy when installing this one.
conflicts=('cardmirror' 'cardmirror-git' 'CardMirror')
options=('!strip')
source=("https://github.com/ant981228/cardmirror/releases/download/v${_origver}/cardmirror-${_origver}.pacman")
# Alpha policy: SKIP until release sha256s stabilize. Once the
# binary publishing cadence is steady, swap in real hashes here
# so pacman / yay verifies downloads. (Run `updpkgsums` after
# editing `_origver` to refresh.)
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  # Extract the upstream .pacman's payload into $pkgdir. The
  # upstream package contains:
  #   /opt/CardMirror/            Electron app bundle
  #   /usr/share/applications/    .desktop file
  #   /usr/share/icons/...        multi-size PNG icons
  #   /usr/share/mime/...         mime registrations
  #   .PKGINFO / .MTREE / .INSTALL / .BUILDINFO
  #                               pacman metadata (excluded —
  #                               this AUR build writes its own)
  tar --xz -xf "cardmirror-${_origver}.pacman" -C "$pkgdir" \
    --exclude='.PKGINFO' --exclude='.MTREE' \
    --exclude='.BUILDINFO' --exclude='.INSTALL'

  # Launcher symlink. Upstream's .INSTALL post_install creates
  # /usr/bin/cardmirror via update-alternatives at install time;
  # we bake it directly into the package payload so the AUR
  # build doesn't need a custom .install script. Points to the
  # real Electron binary at /opt/CardMirror/cardmirror — NOT
  # the AppImage's AppRun (which is what the previous PKGBUILD
  # version pointed at, and broke for users because AppRun
  # depends on the AppImage runtime context).
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/CardMirror/cardmirror "$pkgdir/usr/bin/cardmirror"
}
