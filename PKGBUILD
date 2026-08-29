# Maintainer: Rotko Networks <hq@rotko.net>
#
# Canonical, in-repo source of truth for the AUR package. The release workflow
# (.github/workflows/release.yaml) copies this into the AUR repo on each tag,
# sets pkgver from the tag, and runs `updpkgsums` to fill sha256sums from the
# actual GitHub tarball. Do not hand-edit pkgver/sha256sums here.
pkgname=zish
pkgver=0.17.3
pkgrel=1
pkgdesc="fast, familiar POSIX/bash shell in Zig with kernel-enforced (Landlock+seccomp) sandboxing"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
# zish requires the Zig 0.16 std/build API (std.Io, module link_libc, etc.).
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4208c6dba9b7fcb3b81842e91339d59ef1169a79ab31cb866374b989ba0298e5')

build() {
    cd "$pkgname-$pkgver"
    zig build --release=safe
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
