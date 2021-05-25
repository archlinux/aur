# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

shopt -s extglob

pkgname=pandoc-static-git
_pkgname="${pkgname%-static-git}"
pkgver=2.14rc.r12.g54ab7a0a3
pkgrel=1
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
url='https://pandoc.org'
license=('GPL')
arch=('x86_64')
optdepends=('pandoc-citeproc: for citation rendering with pandoc-citeproc filter'
            'texlive-core: for pdf output')
conflicts=('haskell-pandoc' 'pandoc' 'pandoc-bin')
replaces=('haskell-pandoc' 'pandoc' 'pandoc-bin')
provides=("pandoc=${pkgver%%*([a-z]).r*}")
makedepends=('stack>=1.7.0')
source=("git+https://github.com/jgm/pandoc.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    eval "$(git for-each-ref --shell --sort=creatordate \
        --format 'git tag --force %(refname:lstrip=-1)rc %(refname)' \
        'refs/**/rc/*' | tail -n1)"
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
