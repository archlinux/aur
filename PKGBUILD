# Maintainer: Rotko Networks <hq@rotko.net>
#
# Canonical, in-repo source of truth for the AUR package. The release workflow
# (.github/workflows/release.yaml) copies this into the AUR repo on each tag,
# sets pkgver from the tag, and runs `updpkgsums` to fill sha256sums from the
# actual GitHub tarball. Do not hand-edit pkgver/sha256sums here.
pkgname=zish
pkgver=0.24.0
pkgrel=1
pkgdesc="fast, familiar POSIX/bash shell in Zig with kernel-enforced (Landlock+seccomp) sandboxing"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
# zish requires the Zig 0.16 std/build API (std.Io, module link_libc, etc.).
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0ccdab04658808655395276518e58b88dd58a8a4a6a7363a48a5a44fde30eb6d')

build() {
    cd "$pkgname-$pkgver"
    zig build --release=safe

    # Standard feats, staged into $srcdir by the build system that owns them:
    # build.zig decides which feats exist, which link libc, and the registry
    # layout. `-Dfeat-layout=registry` writes <root>/standard/<name>/{bin,feat.toml},
    # which is the shape the shell resolves. A feat's rubrics are compiled into
    # its binary, the same way the shared library is, so there is no data file
    # for a package to carry and no way to ship a feat without one.
    make feats ZISH_FEAT_ROOT="$srcdir/feats"
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

    # The standard feat set, at the path the shell derives from its own location
    # (/proc/self/exe -> <prefix>/share/zish/feats). Without this a fresh install
    # has an empty catalog, and it cannot bootstrap: `gf`, the feat that installs
    # feats, is itself one of them. A feat the user installs into ~/.zish/feats
    # shadows the shipped one — the search order already prefers the user root.
    install -d "$pkgdir/usr/share/zish/feats/standard"
    cp -a "$srcdir/feats/standard/." "$pkgdir/usr/share/zish/feats/standard/"
}
