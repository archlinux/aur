# Maintainer: FlowOSS <https://github.com/FlowOSS>
#
# FlowShot - screenshot + annotation for Linux (Wayland and X11).
# Prebuilt variant: repackages the .pkg.tar.zst that the project's release
# workflow builds in a clean Arch container (makepkg, full test suite,
# namcap) and publishes as a GitHub release asset, so installing is a
# download instead of a 10-25 minute compile.
#
# Notes:
#   - Prebuilt deliverables while sources are available require the `-bin`
#     suffix (AUR submission guidelines).
#   - Nothing is compiled here, so options=('!strip' '!lto' '!debug') keeps
#     makepkg from re-processing the binaries.
#   - No .install hook: pacman's own gtk-update-icon-cache and
#     update-desktop-database hooks fire on the installed file paths.
#
# The asset NAME and its b2sum are a public contract: the name embeds pkgver
# and pkgrel of the release recipe plus the `-Arch` distro marker, and the
# publish workflow rewrites pkgver + b2sums per release. Renaming the asset
# without updating this source URL breaks every user build.
#
# AUR submission naming: the `flowshot` pkgbase on the AUR is squatted by an
# unrelated install script; the -bin suffix (required by AUR rules for
# prebuilt packages anyway) is a submission-level workaround only. The
# software's package name is `flowshot` - this package provides+conflicts it
# (the standard takeover pattern), so installing it replaces anything else
# claiming the name. See flowshot-git/PKGBUILD.
pkgname=flowshot-bin
_pkgname=flowshot
pkgver=0.1.0
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland and X11 with mixed-DPI support (prebuilt binary)'
arch=('x86_64')
url='https://github.com/FlowOSS/flowshot'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'libgcc'
  'libpipewire-0.3.so'
  # dlopen'd or data-only, so invisible to ldd/namcap (namcap will warn
  # "may not be needed" for these; they are real runtime requirements):
  'wayland'
  'vulkan-icd-loader'
  'fontconfig'
  'ttf-font'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-desktop-portal: portal capture, global shortcuts and OpenURI'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma (KWin ScreenShot2)'
  'xdg-desktop-portal-hyprland: portal backend for Hyprland'
  'xdg-desktop-portal-wlr: portal backend for wlroots compositors (Sway)'
  'vulkan-driver: Vulkan implementation for the GPU-accelerated overlay'
  'gnome-shell-extension-appindicator: system tray icon under GNOME'
)
provides=("flowshot=$pkgver")
conflicts=('flowshot' 'flowshot-git')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst")
# Filled with the real b2sum of the published asset by the publish workflow.
b2sums=('6c521cedd6371224c962b1c9d1bc9f3d374dedcbd6fc39ff7ec7dd14b5913ce84982be4fa7136855fe1c18ae8482ec08f7e6ff7e73b92b190153540a921b7699')
options=('!strip' '!lto' '!debug')

package() {
  # The asset IS an Arch package: unpack its payload tree, dropping the
  # package metadata members (makepkg regenerates this package's own).
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst" \
    -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL

  # Licenses must live under /usr/share/licenses/$pkgname for THIS package.
  if [[ -d "$pkgdir/usr/share/licenses/$_pkgname" ]]; then
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
