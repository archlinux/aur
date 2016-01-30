# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=resolve-trivial-conflicts-git
_gitname=resolve-trivial-conflicts
pkgver=r70.84d10f2
pkgrel=1
pkgdesc="Resolve trivial conflicts automatically when merging branches in git repositories."
arch=(i686 x86_64)
url="https://github.com/ElastiLotem/resolve-trivial-conflicts"
license=(GPL)
provides=(resolve-trivial-conflicts)
conflicts=(resolve-trivial-conflicts)
makedepends=(git cabal-install chrpath)
depends=(gmp)
source=(git+https://github.com/ElastiLotem/resolve-trivial-conflicts)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    # No tagged commits. ヽ(´ー｀)ノ
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

build() {
    cd "$_gitname"
    cabal update
    cabal sandbox init
    cabal install --dependencies-only
    cabal configure --prefix /usr --disable-executable-dynamic
    cabal build
}

package() {
    cd "$_gitname"
    # Cabal 1.22 currently has an issue where it injects the paths to library dependencies
    # even into statically built executables. Since this will add /tmp locations to the
    # RPATH, we kill them manually until Cabal 1.23 is released.
    find dist -type f -perm -+x -exec chrpath -d {} \;
    cabal copy --destdir "$pkgdir"
    install -m644 -D README.md "$pkgdir"/usr/share/doc/resolve-trivial-conflicts/README.md
}

