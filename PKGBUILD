# Maintainer: yogh-io <info@yogh.nl>
pkgname=diffstalker-grammars
pkgver=0.0.0
pkgrel=1
pkgdesc="Tree-sitter grammars and outline queries for diffstalkerd's in-file symbol search"
arch=('any')
url="https://github.com/yogh-io/diffstalker"
license=('MIT')
# Data only: wasm blobs and .scm query files. Nothing is compiled, nothing is
# executed at build time, and there is no dependency on node or bun - the
# daemon that reads these is the optdepend, not the other way round.
depends=()
makedepends=()
optdepends=('diffstalker-git: the daemon that reads these grammars')

# The published npm tarball, not the git repo. The .wasm files are deliberately
# not committed upstream (2.4 MB on every clone of a VCS package), so a source
# build would have to fetch them anyway - this way makepkg does the download and
# the checksum, which is the same guarantee upstream's vendor script provides,
# expressed in the tool Arch already trusts.
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/diffstalkerd-grammars/-/diffstalkerd-grammars-$pkgver.tgz")
sha256sums=('132bc445be6e9291e4e3b72c6c07e90c28c1a4b4247c4c48b58b43c78f041ee6')

# Where diffstalkerd looks. The systemd unit sets
# DIFFSTALKER_GRAMMARS_DIR to exactly this path; a pacman-owned install has no
# node_modules, so package resolution can never find these on its own.
_grammardir=/usr/share/diffstalker/grammars

package() {
    cd "$srcdir/package"

    install -dm755 "$pkgdir$_grammardir/queries"
    install -Dm644 ./*.wasm -t "$pkgdir$_grammardir"
    install -Dm644 queries/*.scm -t "$pkgdir$_grammardir/queries"

    # checksums.json is not packaging metadata - the daemon READS it at
    # startup, verifies every file against it, and refuses the whole set on a
    # mismatch. It also records the web-tree-sitter version these were built
    # for, which is how a daemon/grammars ABI skew is caught instead of
    # producing wrong symbols. Shipping without it disables outlines entirely.
    install -Dm644 checksums.json "$pkgdir$_grammardir/checksums.json"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
