# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=haskell-commonmark
pkgname=($_pkgname-git ${_pkgname/haskell-}-git)
pkgver=0.0.0.r743.g54ad60d
pkgrel=1
pkgdesc='Pure Haskell commonmark parsing library, designed to be flexible and extensible'
url='https://github.com/jgm/commonmark-hs'
license=('GPL')
arch=('x86_64')
conflicts=("$_pkgname")
provides=("$_pkgname")
makedepends=('stack')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    git tag | grep -Fq 'v0.0.0' || git tag 'v0.0.0' f0175de
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    stack setup --install-ghc
}

build() {
    cd "$pkgbase"
    stack build --ghc-options='-fdiagnostics-color=always' --fast commonmark-cli
}

package_haskell-commonmark-git() {
    cd "$pkgbase"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" commonmark/LICENSE
}

package_commonmark-git() {
    cd "$pkgbase"
    find "./.stack-work/install" -type f -name commonmark -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" commonmark-cli/LICENSE
}
