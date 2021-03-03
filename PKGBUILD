# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

pkgname=pandoc-static-git
_pkgname="${pkgname%-static-git}"
pkgver=2.11.4.r33.gb79aba6ea
pkgrel=1
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
url='https://pandoc.org'
license=('GPL')
arch=('x86_64')
optdepends=('pandoc-citeproc: for citation rendering with pandoc-citeproc filter'
            'texlive-core: for pdf output')
conflicts=('haskell-pandoc' 'pandoc' 'pandoc-bin')
replaces=('haskell-pandoc' 'pandoc' 'pandoc-bin')
provides=("pandoc=${pkgver%.r*}")
makedepends=('stack>=1.7.0')
source=("git+https://github.com/jgm/pandoc.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#     cd "$_pkgname"
#     # TODO: find a better solution
#     sed -i "s|let env' = dynlibEnv ++ |let env' = dynlibEnv ++ [(\"LD_LIBRARY_PATH\", \"$PWD/dist/build\")] ++ |" test/Tests/Command.hs
# }

build() {
    cd "$_pkgname"

    stack setup
    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --flag 'pandoc:embed_data_files' \
        --fast
}

package() {
    cd "$_pkgname"
    find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
    install -Dm644 man/pandoc.1 "${pkgdir}"/usr/share/man/man1/pandoc.1
}
