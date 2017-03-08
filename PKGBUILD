# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-mediate-git
_gitname=git-mediate
pkgver=r94.07b1a7b
pkgrel=1
pkgdesc="Resolve trivial conflicts automatically when merging branches in git repositories."
arch=(i686 x86_64)
url="https://github.com/Peaker/git-mediate"
license=(GPL)
provides=(git-mediate)
conflicts=(git-mediate resolve-trivial-conflicts)
replaces=(resolve-trivial-conflicts resolve-trivial-conflicts-git)
makedepends=(git cabal-install chrpath)
depends=(gmp)
source=(git+https://github.com/Peaker/git-mediate)
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
    install -m644 -D README.md "$pkgdir"/usr/share/doc/git-mediate/README.md
}

