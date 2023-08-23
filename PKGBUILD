# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=stack-clean-old-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.4.7.r2.g7cd5b13
pkgrel=1
pkgdesc='Manage Haskell stack snapshot builds and ghc versions (static build)'
arch=('i686' 'x86_64')
url="https://github.com/juhp/${_pkgname}"
license=('BSD')
provides=("$_pkgname")
depends=('gmp')
makedepends=('stack')

# includes rebased version of PR#12
# https://github.com/juhp/stack-clean-old/pull/12
source=("git+$url.git"
0001-getStackSubdir-support-STACK_ROOT-env-variable.patch
0002-chore-Update-.stack-in-arg-parse-help.patch
)
sha256sums=('SKIP'
            'd2c83c24e59bcc752aeff9f0adb3bf3d29e1851b9ec188adea73eee8a10a060b'
            '8a256948f376d93735b093d7398d3fabf556c8fd041ec9e866c6c75780792551')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git am ../*.patch
}

build() {
    cd "$_pkgname"
    stack setup
    stack build
}

check() {
    cd "$_pkgname"
    stack test
}

package() {
    cd "$_pkgname"
    stack install --local-bin-path "${pkgdir}/usr/bin"
}
