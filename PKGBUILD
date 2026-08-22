# Maintainer: NorseHorse <NorseHorse@norsehor.se>
#
# quorumpony-bin installs the prebuilt portable tarball attached to each GitHub release, so there
# is no JDK dependency: the app ships its own jlink runtime.
#
# pkgver must name a tag whose release assets include QuorumPony-linux-x86_64.tar.gz and
# QuorumPony-linux-aarch64.tar.gz. QuorumPony's releases open as DRAFTS and are published by hand
# after the dmg is notarized and everything is signed, so a tag existing is NOT enough — push to
# the AUR only once the release is public, or every user's makepkg gets a 404.
#
# The sha256sums below are the v1.0.0 release values. When bumping pkgver, reset them and run
# `updpkgsums` once the new release assets are public (see packaging/aur/README.md).
pkgname=quorumpony-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Split a secret into printable cards - any K of N recover it, fully offline (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://quorumpony.com"
license=('Apache-2.0')
# fontconfig is Skiko's only native runtime dependency. QuorumPony has no smart-card or network
# code, so — unlike PGPony — there is no pcsclite/ccid dependency to declare.
depends=('fontconfig')
provides=('quorumpony')
conflicts=('quorumpony')
# The bundled runtime's .so files are already stripped, and strip corrupts the jlink image's
# integrity when it walks them again.
options=(!strip)
source=(
  "quorumpony.desktop::https://raw.githubusercontent.com/norsehorse-dev/QuorumPonyDesktop/v$pkgver/packaging/aur/quorumpony.desktop"
  "quorumpony.png::https://raw.githubusercontent.com/norsehorse-dev/QuorumPonyDesktop/v$pkgver/packaging/quorumpony.png"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/norsehorse-dev/QuorumPonyDesktop/releases/download/v$pkgver/QuorumPony-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/norsehorse-dev/QuorumPonyDesktop/releases/download/v$pkgver/QuorumPony-linux-aarch64.tar.gz")
sha256sums=('6e89a45b22224297f619b721f004893e0853d5df611421cdd1560eb8a9105356'
            '445b53ee279a874e8e063f824c521991b938240dc3418914102d2f5289f73b8c')
sha256sums_x86_64=('550125b772c194bd4a2db36fb86c03f0e2b53d951be7ded651f6e7b18c849a8a')
sha256sums_aarch64=('682a32d3aed1208d7258839fd1a2c10daaf3bfef6a57c87cd930598c7a0f0d6e')

package() {
  install -dm755 "$pkgdir/opt/quorumpony"
  cp -a "$srcdir/QuorumPony/." "$pkgdir/opt/quorumpony/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/quorumpony/bin/QuorumPony "$pkgdir/usr/bin/quorumpony"
  install -Dm644 "$srcdir/quorumpony.desktop" "$pkgdir/usr/share/applications/quorumpony.desktop"
  install -Dm644 "$srcdir/quorumpony.png" "$pkgdir/usr/share/pixmaps/quorumpony.png"
}
