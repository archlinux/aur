# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=plezy-bin
pkgver=2.19.0
pkgrel=1
pkgdesc="Modern client for Plex, Jellyfin and Emby (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://plezy.app"
license=('GPL-3.0-or-later')
# Upstream's own pacman dependency list, taken from the manifest that produces
# the release packages (linux/packaging/build-packages.py) and kept in that
# shape on purpose: the .deb repackaged here is the same bundle upstream's
# .pkg.tar.zst carries. Almost everything the app links travels inside
# /opt/plezy/lib - including GTK, glib, libmpv and ffmpeg - so what is declared
# here is mostly what upstream deliberately does not bundle, because it is
# coupled to the running compositor and GPU driver. libmpv in particular has to
# be the bundled, Wayland-enabled build: a distro libmpv silently drops hwdec
# to vaapi-copy on the native video plane.
depends=('alsa-lib' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libdrm' 'libepoxy'
         'libevdev' 'libglvnd' 'libva' 'libx11' 'libxcb' 'libxext' 'mesa'
         'wayland')
provides=("plezy=${pkgver}")
conflicts=('plezy')
# prebuilt, and the runner finds its bundled libraries through the wrapper's
# LD_LIBRARY_PATH rather than an RPATH
options=('!strip' '!debug')
# Release tags carry no v prefix (2.16.0), so the tag is pkgver as-is.
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux-arm64.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
sha256sums_x86_64=('708d00c65689c39322b6023e2705bccac7627b1434bd5e877cf8bb9a07b12d21')
sha256sums_aarch64=('a66460be2f1b342cb607a19b168e308df1158ea4bc765e70cbb89ab203dfd4dc')

package() {
  # the Flutter bundle in /opt/plezy plus the /usr/bin wrapper, desktop entry
  # and icons upstream's .deb installs
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" --exclude './usr/share/doc' ./opt ./usr

  # upstream ships this one non-executable and fixes it up in the .deb's
  # postinst, which pacman never runs
  chmod 755 "$pkgdir/opt/plezy/lib/crashpad_handler"

  # GPL-3.0-or-later is a common license (/usr/share/licenses/common/GPL3) and
  # the .deb carries no license text of its own.

  # Upstream builds its release binaries with ENABLE_UPDATE_CHECK=true, so
  # unlike the [extra] package this one does check GitHub for new versions.
  # On Linux that only ever opens a dialog with a browser link - there is no
  # in-app install path to collide with pacman - and the dialog can be
  # dismissed per version or turned off in the app's settings.
}
