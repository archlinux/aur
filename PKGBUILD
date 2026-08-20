# Maintainer: Kevin Stewart <kgstew96@gmail.com>
#
# pgpony-bin installs the prebuilt portable tarball attached to each GitHub release, so there is
# no JDK dependency: the app ships its own jlink runtime.
#
# pkgver must name a tag whose release assets include PGPony-linux-x86_64.tar.gz and
# PGPony-linux-aarch64.tar.gz. PGPony's releases open as DRAFTS and are published by hand after
# the dmg is notarized and everything is signed, so a tag existing is NOT enough — push to the
# AUR only once the release is public, or every user's makepkg gets a 404.
pkgname=pgpony-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="OpenPGP on the desktop - encrypt, decrypt, sign, verify, manage keys (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://pgpony.app"
license=('Apache-2.0')
# fontconfig is Skiko's; pcsclite is NOT optional garnish. javax.smartcardio dlopens
# libpcsclite at runtime and every hardware-key feature is dead without it — the same reasoning
# that puts pcscd,libpcsclite1 in the .deb's Depends via --linux-package-deps. RelayPony's
# PKGBUILD needs only fontconfig; copying it verbatim here would ship a package that installs
# cleanly and silently cannot see a security key.
depends=('fontconfig' 'pcsclite')
# The daemon is in pcsclite, but the USB CCID driver it talks to is a separate package, and
# without it pcscd runs and enumerates nothing.
optdepends=('ccid: USB smart-card reader driver, required for OpenPGP hardware keys')
provides=('pgpony')
conflicts=('pgpony')
# The bundled runtime's .so files are already stripped, and strip corrupts the jlink image's
# integrity when it walks them again.
options=(!strip)
source=(
  "pgpony.desktop::https://raw.githubusercontent.com/norsehorse-dev/PGPonyDesktop/v$pkgver/packaging/aur/pgpony.desktop"
  "pgpony.png::https://raw.githubusercontent.com/norsehorse-dev/PGPonyDesktop/v$pkgver/packaging/pgpony.png"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/norsehorse-dev/PGPonyDesktop/releases/download/v$pkgver/PGPony-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/norsehorse-dev/PGPonyDesktop/releases/download/v$pkgver/PGPony-linux-aarch64.tar.gz")
sha256sums=('91f9803d60a09b6e61527feb80a80d1c0b2f5807130906fe275d4edf1da23e7e'
            '8fa9b7b80a7061f68a96d9516c8b02ea56e7a2333410d64695c9b7eb4acb8c77')
sha256sums_x86_64=('f24999d91f652ce8965c06fc5a10aa9fcc81775290fecdeddb6f77ca18254db4')
sha256sums_aarch64=('5d86b83ef8936fd8780f8f62b4b0e054a2677aa56023302065ecb8c8edd8e86b')

package() {
  install -dm755 "$pkgdir/opt/pgpony"
  cp -a "$srcdir/PGPony/." "$pkgdir/opt/pgpony/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/pgpony/bin/PGPony "$pkgdir/usr/bin/pgpony"
  # The .desktop carries MimeType so a double-clicked .pgpony/.asc/.gpg opens PGPony, matching
  # what the .deb registers. The tarball and AppImage cannot do this — nothing installs a
  # desktop entry for them — so the AUR package and the .deb are the two Linux paths where file
  # associations actually work.
  install -Dm644 "$srcdir/pgpony.desktop" "$pkgdir/usr/share/applications/pgpony.desktop"
  install -Dm644 "$srcdir/pgpony.png" "$pkgdir/usr/share/pixmaps/pgpony.png"
}
