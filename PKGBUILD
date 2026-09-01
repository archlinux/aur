# Maintainer: juddisjudd <ipajudd@gmail.com>
#
# Prebuilt ("-bin") AUR package: downloads the release .deb produced by the
# GitHub Actions release workflow and unpacks it. No Rust/bun toolchain needed
# on the user's machine.
#
# This copy lives in the app repo for reference. The package that AUR users
# actually install is published from a SEPARATE git repo:
#   ssh://aur@aur.archlinux.org/exilecompass-bin.git
# Keep the two in sync on each release (see packaging/aur/README.md).

pkgname=exilecompass-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="Path of Exile 2 game overlay (campaign guide, stash regex, build tracker)"
arch=('x86_64')
url="https://github.com/juddisjudd/exilecompass"
license=('MIT')
# Tauri v2 runtime libraries. webkit2gtk-4.1 pulls libsoup3/gtk3 transitively;
# xdotool is required by the global-shortcut plugin at runtime.
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'pango'
  'webkit2gtk-4.1'
  'xdotool'
)
# Provide/conflict the bare name so a future from-source `exilecompass` package
# and this one are mutually exclusive.
provides=('exilecompass')
conflicts=('exilecompass')
options=('!strip' '!debug')

# NOTE: confirm the exact asset filename on the release page before publishing —
# Tauri's .deb name can differ in casing from the AppImage. Adjust _debfile if so.
_debfile="ExileCompass_${pkgver}_amd64.deb"
source=("${_debfile}::${url}/releases/download/v${pkgver}/${_debfile}")
# 'SKIP' keeps the recipe release-agnostic. Prefer real sums per release with:
#   updpkgsums   (from the pacman-contrib package)
sha256sums=('1273c194db9b38f4a82299c59e048941ca2905caa7389e4ed37bfdd615ffb864')

package() {
  # makepkg auto-extracts the .deb (an ar archive) into $srcdir, leaving the
  # payload as data.tar.*. Unpack that into the package root.
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"
}
