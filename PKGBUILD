# Maintainer: Rotko Networks <hq@rotko.net>
#
# Canonical, in-repo source of truth for the AUR package. The release workflow
# (.github/workflows/release.yaml) copies this into the AUR repo on each tag,
# sets pkgver from the tag, and runs `updpkgsums` to fill sha256sums from the
# actual GitHub tarball. Do not hand-edit pkgver/sha256sums here.
pkgname=zish
pkgver=0.14.0
pkgrel=1
pkgdesc="fast shell interpreter written in zig with built-in AI agent and GGUF inference"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
# zish requires the Zig 0.16 std/build API (std.Io, module link_libc, etc.).
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('32a788cae77e67138b7b87016a03c6aec8be13a20afad7fd80c411606e09c36e')

build() {
    cd "$pkgname-$pkgver"
    zig build --release=fast
}

# No check(): `zig build test` builds the test exe in Debug (all modules +
# debug info), which is heavy on RAM/disk; on a constrained builder Zig 0.16.0
# can abort ungracefully mid-write ("DWARF TODO: 'DiskQuota' ...") instead of
# reporting cleanly. Tests are run in CI (.github/workflows) with adequate
# resources; packaging shouldn't gate a user's install on it.

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "zig-out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 zish.1 "$pkgdir/usr/share/man/man1/zish.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
