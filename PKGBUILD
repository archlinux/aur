# Maintainer: mfw <espadonne@outlook.com>

pkgname=wolf-lang
pkgver=0.2.8
pkgrel=1
pkgdesc='The wolf systems language: the wolfgang compiler, its runtime and the C importer'
arch=('x86_64' 'aarch64')
url='https://github.com/wolffe-lang/wolf-lang'
license=('GPL-3.0-or-later')
# `cc` links every program `wolf build` produces, so gcc is a runtime
# dependency, not just a makedepend.
depends=('sh' 'gcc' 'gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'lld: faster linking — wolf prefers ld.lld and says so when it is absent'
    'clang: for `import c` beyond the headers gcc ships'
    'lupin: the reference interpreter wolf is differentially tested against'
)
provides=('wolf-lang')
# `wolf` is Return to Castle Wolfenstein in the AUR and installs
# /usr/bin/wolf. The compiler's command name is `wolf` by decree (D38),
# so the collision is real and is declared rather than discovered.
conflicts=('wolf-lang-bin' 'wolf')
install=wolf-lang.install
# No debug split: the remapped path prefix below makes the debug source
# paths meaningless, and nothing here ships sources.
options=('!debug')
# D57, and the reason this is a git source and not the release tarball:
# the build stamp is read from git AT BUILD TIME. `wolf --version` prints
# the bare version only when the tag `v$pkgver` points at HEAD; a GitHub
# archive tarball has no .git, so it builds a binary that answers
# `0.2.6+dev.unknown` — an unstamped binary claiming to be a release is
# exactly the provenance failure D57 exists to prevent.
source=("git+https://github.com/wolffe-lang/wolf-lang.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd wolf-lang
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd wolf-lang
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # prepare() fetched everything; keep the inner build off the network.
    export CARGO_NET_OFFLINE=true
    # Without this the staged `wolf` embeds $srcdir in its panic paths
    # and makepkg warns "Package contains reference to $srcdir"
    # (measured). Remap to a stable, meaningless prefix.
    export RUSTFLAGS="${RUSTFLAGS-} --remap-path-prefix=$srcdir=/usr/src/$pkgname"
    # `cargo xtask dist` is the only build that stamps: it reads HEAD's
    # short sha and the tag pointing at it and passes WOLF_COMMIT /
    # WOLF_RELEASE into the release build. It also stages the three files
    # that must travel together and smoke-tests the staged tree by
    # compiling and running corpus/hello.lu from it.
    cargo xtask dist
}

package() {
    cd "wolf-lang/target/dist/wolf-$pkgver-$(rustc -vV | sed -n 's/host: //p')"

    # `wolf` locates libwolf_rt.a strictly beside the running binary
    # (std::env::current_exe, no PATH fallback) and the importer worker
    # beside it or on PATH. A symlink in /usr/bin does NOT do it: on
    # macOS current_exe returns the symlink and the lookup misses, and
    # relying on Linux's /proc/self/exe resolving it is a platform
    # accident. The three files stay together in /usr/lib/wolf-lang and
    # /usr/bin/wolf execs into them, which replaces the process image so
    # current_exe is the real path on every host.
    install -Dm755 wolf "$pkgdir/usr/lib/$pkgname/wolf"
    install -Dm755 wolf-cimport-worker "$pkgdir/usr/lib/$pkgname/wolf-cimport-worker"
    install -Dm644 libwolf_rt.a "$pkgdir/usr/lib/$pkgname/libwolf_rt.a"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/%s/wolf "$@"\n' "$pkgname" > "$pkgdir/usr/bin/wolf"
    chmod 755 "$pkgdir/usr/bin/wolf"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The runtime library carries a linking exception: programs compiled
    # with wolf are the author's, under any license they choose.
    install -Dm644 LICENSE-EXCEPTION "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EXCEPTION"
}
