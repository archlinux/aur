# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

shopt -s extglob

pkgname=pandoc-static-git
_pkgname="${pkgname%-static-git}"
pkgver=3.2.r112.g2b60b1a1b
pkgrel=1
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
url='https://pandoc.org'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('gmp' 'zlib')
optdepends=('texlive-core: for pdf output')
conflicts=('haskell-pandoc' 'pandoc' 'pandoc-bin')
replaces=('haskell-pandoc' 'pandoc' 'pandoc-bin')
provides=("pandoc=${pkgver%%*([a-z]).r*}")
makedepends=('git' 'stack')
source=("git+https://github.com/jgm/pandoc.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long --match 'pandoc-cli-*' \
        | sed 's/^pandoc-cli-//;s/^v//' \
        | awk -F- \
        'BEGIN { OFS="" }
        {
            revcount=$(NF-1)
            sha=$NF
            NF=(NF-2)
            printf "%s.r%s.%s\n", $0, revcount, sha
        }'
}

prepare() {
    cd "$_pkgname"
    stack config set resolver lts-22.22 # ghc-9.6.5
}

build() {
    cd "$_pkgname"

    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --flag 'pandoc:embed_data_files' \
        --fast
}

check() {
    cd "$_pkgname"

    stack build --test
}

package() {
    cd "$_pkgname"
    find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
    install -Dm644 pandoc-cli/man/pandoc.1 \
        "${pkgdir}"/usr/share/man/man1/pandoc.1
}
