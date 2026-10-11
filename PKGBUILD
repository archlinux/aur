# Maintainer: mfw <espadonne@outlook.com>

pkgname=wolf-lang
pkgver=0.2.27
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
#
# 0.2.27 (s204, ruling #59): the package ships wolf-std as std/ beside the
# binary. `cargo xtask dist` stages the commit crates/wolf_driver/STD-PIN
# names; build() is offline, so the checkout is a source here and dist is
# handed it through WOLF_DIST_STD_SRC, which it refuses unless its HEAD is
# the pin. A release that moves STD-PIN moves _stdpin with it.
_stdpin=87ba16208da8ea642dd463fa89ff3a1ec80ceba1
source=("git+https://github.com/wolffe-lang/wolf-lang.git#tag=v$pkgver"
        "wolf-std::git+https://github.com/wolffe-lang/wolf-std.git#commit=$_stdpin")
sha256sums=('SKIP'
            'SKIP')

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
    # compiling and running corpus/hello.lu from it, and a `use std.env`
    # program against the staged std/.
    export WOLF_DIST_STD_SRC="$srcdir/wolf-std"
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
    # 0.2.24 (kw12): the freestanding runtime travels beside libwolf_rt.a
    # when the toolchain could build it (the x86_64-unknown-none target);
    # `cargo xtask dist` skips it loudly otherwise, as with Arch's rust.
    if [[ -f libwolf_rt_none.a ]]; then
        install -Dm644 libwolf_rt_none.a "$pkgdir/usr/lib/$pkgname/libwolf_rt_none.a"
    fi
    # 0.2.27 (s204): the standard library beside the binary, where `wolf`
    # reads its default std root (std/STD-REV names the commit).
    cp -a std "$pkgdir/usr/lib/$pkgname/std"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/%s/wolf "$@"\n' "$pkgname" > "$pkgdir/usr/bin/wolf"
    chmod 755 "$pkgdir/usr/bin/wolf"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The runtime library carries a linking exception: programs compiled
    # with wolf are the author's, under any license they choose.
    install -Dm644 LICENSE-EXCEPTION "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EXCEPTION"
}
