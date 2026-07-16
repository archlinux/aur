# Maintainer: Simon Kreitmayer <simon.kreitmayer@skyphoenix-it.com>
pkgname=xeneon-edge-hub
pkgver=1.0.0alpha.2
pkgrel=1
pkgdesc="Native Linux widget dashboard for the Corsair Xeneon Edge and other secondary touchscreens (includes the companion Manager)"
arch=('x86_64')
url="https://github.com/skyphoenix-it/XeneonEdge_Linux"
license=('MIT' 'Apache-2.0')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-wayland' 'hicolor-icon-theme')
makedepends=('cmake' 'rust')
install="$pkgname.install"

# Release tag. pacman's pkgver forbids '-', so a prerelease needs the two spelled
# out separately (e.g. pkgver=1.0.0beta1 with _tag=v1.0.0-beta.1).
# NOT "v$pkgver": pacman orders 1.0.0_alpha.2 ABOVE 1.0.0 (verified with
# vercmp), which would block the GA upgrade forever — so pkgver drops the
# separator (1.0.0alpha.2 < 1.0.0) and the real tag is spelled out here.
_tag="v1.0.0-alpha.2"
_srcver="${_tag#v}"

# Source is the maintainer-uploaded release asset, NOT GitHub's auto-generated
# archive tarball. Two reasons, both load-bearing:
#   1. GitHub regenerates archive tarballs and has changed their bytes before,
#      which silently invalidates both the checksum and any signature over them.
#      A release asset is immutable once uploaded.
#   2. The maintainer signs the exact bytes published here (scripts/release.sh
#      produces the tarball and the .sig together from the tag), so validpgpkeys
#      below verifies something the maintainer actually attested to.
source=("$pkgname-$_srcver.tar.gz::$url/releases/download/$_tag/$pkgname-$_srcver.tar.gz"
        "$pkgname-$_srcver.tar.gz.sig::$url/releases/download/$_tag/$pkgname-$_srcver.tar.gz.sig")

# EdgeHub release key — SKYPhoenix IT <simon.kreitmayer@skyphoenix-it.com>.
# Full fingerprint, never the short id: short key ids are trivially forgeable, so
# anything that decides trust must pin all 40 hex digits. Public key is committed
# at packaging/edgehub-signing.pub; expiry/rotation is in docs/DISTRIBUTION.md.
#
# The key is NOT on a keyserver yet, so the usual `gpg --recv-keys` does not work
# and makepkg will fail with "unknown public key". Until it is published to
# keys.openpgp.org, users must import it directly:
#   curl -sL https://github.com/SimonKreitmayer.gpg | gpg --import
validpgpkeys=('2F0CAD36DC1D46F3347B7EF293CDC77EACF98990')

# SKIP is correct here rather than lazy: the detached signature above already
# authenticates the tarball, and a checksum sitting next to it in the same file
# adds no security an attacker who could edit this PKGBUILD couldn't also edit.
# Run `updpkgsums` when bumping pkgver if you want the redundant integrity check.
sha256sums=('77a4de6fa9833bc3527bf1757a92cd223b70f335392d35ad017fb9da08542777'
            'SKIP')

# NOTE: pkgver 0.1.0 predates release signing — v0.1.0 has no signed assets, so
# this PKGBUILD does not build as-is. It is staged for the first signed release
# (see scripts/release.sh); bump pkgver/_tag then. Deliberate: shipping a PKGBUILD
# nobody can verify would be worse than one that waits for signed input.

_srcdir="XeneonEdge_Linux-$_srcver"

build() {
  cd "$_srcdir"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DXENEON_VERSION_OVERRIDE="$pkgver-$pkgrel" \
    -Wno-dev
  cmake --build build -j"$(nproc)"
}

package() {
  cd "$_srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
