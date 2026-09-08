# Maintainer: mfw <espadonne@outlook.com>

pkgname=lobo-bin
_pkgname=lobo
pkgver=0.1.0
pkgrel=1
pkgdesc='A web server written in wolf: nginx-compatible configuration, prefork workers (release archive)'
# x86_64 ONLY, and that is a named refusal rather than an omission.
# lobo is a wolf program and wolf's NATIVE tier serves linux x86-64 and
# macOS arm64; on linux aarch64 wolf's codegen refuses by name, so there
# is no aarch64 lobo to package. The release publishes exactly two
# archives for that reason. When the aarch64 tier lands, this becomes
# arch=('x86_64' 'aarch64') plus a source_aarch64/sha256sums_aarch64
# pair and nothing else -- which is why the arch-suffixed arrays below
# are used for a single architecture.
arch=('x86_64')
url='https://github.com/wolffe-lang/lobo'
license=('GPL-3.0-or-later')
# One static-ish binary: the wolf runtime is linked in, so unlike `wolf`
# itself (which hunts libwolf_rt.a beside current_exe) nothing has to sit
# next to it. Its ELF NEEDED list is exactly libgcc_s.so.1, libc.so.6 and
# the loader -- no TLS library, no zlib -- so these two are the whole of it.
depends=('gcc-libs' 'glibc')
optdepends=(
    'curl: to fetch a page from the server you just started'
    'nginx: lobo is differentially tested against it; the configs are interchangeable'
)
provides=("lobo=$pkgver")
# `lobo` and `lobo-bin` were both free in the AUR and in the official
# repos when this was written (2026-09-08) -- unlike `wolf`, which is
# Return to Castle Wolfenstein. The conflict declared here is only with
# the source package, if one is ever added.
conflicts=('lobo')
install=lobo-bin.install
# A -bin package redistributes the release's own bytes. The archive's
# binary carries debug_info and is deliberately unstripped; makepkg would
# otherwise re-strip it and split a debug package out of a binary whose
# sources are not here (namcap flagged that as dangling .build-id symlinks
# on the sibling -bin packages). Both off.
options=('!strip' '!debug')
# The archive the release publishes, byte for byte. This is the same file
# the release page hands a human, and its digest was verified three ways
# before it was written down: the published .sha256 sidecar, an
# unauthenticated re-download hashed locally, and the GitHub asset digest.
# The archive is built FROM THE PIN by lobo's own release workflow, not
# from whatever wolf the runner had, so `lobo -v` inside it is honest.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lobo-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7a99ae243b7a9cda0f778f5705612e4f2b02528ec86623d24070f780014dc0bc')

package() {
    cd "lobo-$pkgver-x86_64-unknown-linux-gnu"

    install -Dm755 lobo "$pkgdir/usr/bin/lobo"

    # conf/ and html/ are a TEMPLATE, not a live prefix. lobo takes `-p`
    # the way nginx does and the stock config's paths (logs/, html/) are
    # relative to it, so a copy under /etc with an empty /var tree would
    # be inventing a service layout 0.1.0 does not have -- and the config
    # would resolve `root html;` against the wrong prefix. The template
    # ships read-only under /usr/share/lobo and lobo-bin.install shows how
    # to make a working copy from it.
    install -Dm644 conf/lobo.conf "$pkgdir/usr/share/$_pkgname/conf/lobo.conf"
    install -Dm644 html/index.html "$pkgdir/usr/share/$_pkgname/html/index.html"

    # BUILD names the toolchain, the source commit and the pins that made
    # this binary; it is the paper trail behind `lobo -v`.
    install -Dm644 BUILD "$pkgdir/usr/share/doc/$pkgname/BUILD"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 GETTING-STARTED.md "$pkgdir/usr/share/doc/$pkgname/GETTING-STARTED.md"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
    install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
