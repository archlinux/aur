# Maintainer: mfw <espadonne@outlook.com>

pkgname=wolf-lang-bin
_pkgname=wolf-lang
pkgver=0.2.6
pkgrel=1
pkgdesc='The wolf systems language: the wolfgang compiler, its runtime and the C importer (release archive)'
arch=('x86_64' 'aarch64')
url='https://github.com/wolffe-lang/wolf-lang'
license=('GPL-3.0-or-later')
# `sh` runs the /usr/bin/wolf exec script; `cc` (gcc) links every
# program `wolf build` produces, so gcc is a runtime dependency.
depends=('sh' 'gcc' 'gcc-libs' 'glibc')
optdepends=(
    'lld: faster linking — wolf prefers ld.lld and says so when it is absent'
    'clang: for `import c` beyond the headers gcc ships'
    'lupin-bin: the reference interpreter wolf is differentially tested against'
)
provides=("wolf-lang=$pkgver")
# `wolf` is Return to Castle Wolfenstein in the AUR and installs
# /usr/bin/wolf. The compiler's command name is `wolf` by decree (D38),
# so the collision is real and is declared rather than discovered.
conflicts=('wolf-lang' 'wolf')
install=wolf-lang-bin.install
# A -bin package redistributes the release's own bytes. makepkg would
# otherwise re-strip them (makepkg's tidy step does touch libwolf_rt.a)
# and split a debug package out of a binary with no sources,
# which namcap flagged as dangling .build-id symlinks. Both off.
options=('!strip' '!debug')
# The archives the release publishes, byte for byte. These are the same
# files the release page hands a human, so the D57 stamp inside them is
# the release job's own — `wolf --version` prints the bare version with
# no `+dev` suffix, which a from-tarball rebuild could not manage.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/wolf-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/wolf-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bb440e976142a0651c45b3569a3ec734b8b846a137d248286755c3ff3d54ef65')
sha256sums_aarch64=('63458b27f579d2463baa7cdc658c1c5b95a9d1ff0b073b671ff59498802f77d4')

package() {
    local _triple
    case "$CARCH" in
        x86_64)  _triple=x86_64-unknown-linux-gnu ;;
        aarch64) _triple=aarch64-unknown-linux-gnu ;;
    esac
    cd "wolf-$pkgver-$_triple"

    # `wolf` locates libwolf_rt.a strictly beside the running binary
    # (std::env::current_exe, no PATH fallback) and the importer worker
    # beside it or on PATH. A symlink in /usr/bin does NOT do it — on
    # macOS current_exe returns the symlink and the lookup misses, and
    # relying on Linux's /proc/self/exe resolving it is a platform
    # accident. The three files stay together and /usr/bin/wolf execs
    # into them, which replaces the process image so current_exe is the
    # real path on every host.
    install -Dm755 wolf "$pkgdir/usr/lib/$_pkgname/wolf"
    install -Dm755 wolf-cimport-worker "$pkgdir/usr/lib/$_pkgname/wolf-cimport-worker"
    install -Dm644 libwolf_rt.a "$pkgdir/usr/lib/$_pkgname/libwolf_rt.a"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/%s/wolf "$@"\n' "$_pkgname" > "$pkgdir/usr/bin/wolf"
    chmod 755 "$pkgdir/usr/bin/wolf"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The runtime library carries a linking exception: programs compiled
    # with wolf are the author's, under any license they choose.
    install -Dm644 LICENSE-EXCEPTION "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EXCEPTION"
}
