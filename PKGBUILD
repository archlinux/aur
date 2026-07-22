# Maintainer: Marc Straube <email@marcstraube.de>

# Playback is closed-source and Epilogue ships it for Linux only as a prebuilt
# single-file Flatpak bundle (and an AppImage). There is no source release to
# build from, so this package wraps the official .flatpak bundle: package()
# stages the bundle into the filesystem, and the install scriptlet registers
# it with the system-wide Flatpak installation on install/upgrade and removes
# it again on uninstall. Flathub is added as a remote so the required runtime
# (org.kde.Platform//6.8) can be pulled — installing therefore needs network
# access, which is inherent to single-file Flatpak bundles.

_appid=co.epilogue.Playback
pkgname=playback-flatpak
# Pinned to 1.9.0: Playback 1.10.0 upgraded the bundled mGBA libretro core and
# now calls retro_load_external_save, which the shipped mgba.linux.so does not
# export — the app SIGSEGVs the moment a GB/SN Operator is connected. 1.9.0 is
# the last release whose app code and core match. Bump to 1.10.x once Epilogue
# fixes the regression. (1.9.0 shipped as Flatpak only; there is no AppImage.)
pkgver=1.9.0
pkgrel=1
pkgdesc='Retro cartridge software for the Epilogue GB/GBA/SN Operator (official Flatpak bundle)'
arch=('x86_64' 'aarch64')
url='https://www.epilogue.co/software/playback'
license=('LicenseRef-proprietary')
depends=('flatpak')
makedepends=('imagemagick')        # renders smaller icon sizes from the 512px source
conflicts=('playback-appimage')
options=('!strip' '!debug')        # payload is an opaque OSTree bundle, nothing to strip
install="$pkgname.install"

_baseurl="https://releases.epilogue.co/desktop/playback/$pkgver/release/linux"
source=("$pkgname.desktop"
        "$_appid.png")
source_x86_64=("$pkgname-$pkgver-x86_64.flatpak::$_baseurl/$_appid.amd64.flatpak")
source_aarch64=("$pkgname-$pkgver-aarch64.flatpak::$_baseurl/$_appid.arm64.flatpak")
sha256sums=('b2ecf29507a7972111caf9959fc12fdb8f56510cb4db4461a46829bfb44d318d'
            '06d4ef6af6e87aaa0e363a4ab9ffd53c8dc211adf884adf120628860ab99f427')
sha256sums_x86_64=('4e62c01fb2098cc71484b4819d27bc0cb99ce418dfe9aa7f4ddd24ae279ae82c')
sha256sums_aarch64=('190c4a77f42494c6ff4c98420effd3252d4a6a010aa9b1c427a7dbf167e2892f')
# A .flatpak bundle is an opaque OSTree archive; never let makepkg unpack it.
noextract=("$pkgname-$pkgver-x86_64.flatpak"
           "$pkgname-$pkgver-aarch64.flatpak")

package() {
  # Stage the bundle where the install scriptlet expects it. $CARCH resolves to
  # the arch makepkg is building for, so only the matching bundle is shipped.
  install -Dm644 "$srcdir/$pkgname-$pkgver-$CARCH.flatpak" \
    "$pkgdir/usr/lib/$pkgname/$_appid.flatpak"

  # Convenience launcher so `playback` stays a plain command instead of forcing
  # `flatpak run co.epilogue.Playback`. This is why we conflict with
  # playback-appimage, which ships the same /usr/bin/playback path.
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec flatpak run %s "$@"\n' "$_appid" \
    > "$pkgdir/usr/bin/playback"
  chmod 755 "$pkgdir/usr/bin/playback"

  # Desktop entry + icon in /usr/share (always on XDG_DATA_DIRS), so the launcher
  # shows in menus even when the Flatpak exports dir is not wired into the
  # session — which is the norm here. Same desktop-file id as the Flatpak's own
  # export, so there is no duplicate entry if that dir later joins the search
  # path. The icon (pacman-managed; hicolor's alpm hook refreshes the cache) is a
  # verbatim copy of the one the Flatpak ships.
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_appid.desktop"

  # Playback ships only a 512px icon; render the common smaller sizes too, so
  # launchers that don't downscale a lone 512px icon (many wlroots menus) still
  # show one. hicolor's alpm hook rebuilds the icon cache on install.
  install -Dm644 "$srcdir/$_appid.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_appid.png"
  local px
  for px in 32 48 64 128 256; do
    magick "$srcdir/$_appid.png" -resize "${px}x${px}" "$srcdir/icon-$px.png"
    install -Dm644 "$srcdir/icon-$px.png" \
      "$pkgdir/usr/share/icons/hicolor/${px}x${px}/apps/$_appid.png"
  done
}
