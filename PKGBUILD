# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Versionless template. packaging/distros/arch/make-aur-package.sh renders the
# release version, pkgrel, and the asset's checksum into the AUR metadata, and
# refuses a source URL that does not expand to the asset name
# packaging/distros/arch/desktop-bin-asset.sh gives.
#
# The release asset is the file tree of the chan-desktop package, built from
# the same tag by the chan-desktop recipe on an Arch Linux Archive snapshot
# that trails the release by six weeks. A binary linked against older glibc
# and WebKitGTK keeps running on newer ones, so the snapshot sets the oldest
# system this package runs on, including derivatives whose mirrors trail Arch.

pkgname=chan-desktop-bin
pkgver=0.127.0
pkgrel=1
pkgdesc='Supercharged terminal emulator, desktop app (prebuilt)'
arch=('x86_64')
url='https://chan.app'
license=('Apache-2.0')
# The same runtime set as the chan-desktop recipe the binary comes from;
# scripts/check-build-matrix.py holds the two lists equal.
depends=(
    'gcc-libs'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'librsvg'
    'libsoup3'
    'systemd'
    'webkit2gtk-4.1'
    'xdg-utils'
)
provides=("chan=$pkgver" "chan-desktop=$pkgver")
conflicts=('chan' 'chan-desktop')
# makepkg already stripped the binary and split its debug symbols out when it
# built the chan-desktop package.
options=(!strip !debug)
# arch=() admits only x86_64, so makepkg refuses any other $CARCH before the
# URL is used.
source=("https://github.com/fiorix/chan/releases/download/v$pkgver/chan-desktop-bin-$pkgver-$pkgrel-$CARCH.tar.zst")
sha256sums=('c556d18fb40a329ef76760f3d8759bfbc788a8480deb20e4ebe3f6fe30adbe68')

package() {
    cp -a usr "$pkgdir/"
}
