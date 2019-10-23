# Maintainer: Poscat <poscat At mail Dot poscat Dot moe>


pkgname=haskell-ide-engine-git
pkgver=r3043.38a6febb
pkgrel=2
pkgdesc="The engine for haskell ide-integration. Not an IDE"
arch=('x86_64')
url="https://github.com/haskell/haskell-ide-engine"
license=('custom:BSD3')
provides=('haskell-ide-engine')
makedepends=('git' 'stack' 'cabal-install' 'happy')
source=("${pkgname}::git://github.com/haskell/haskell-ide-engine.git")
noextract=()
md5sums=('SKIP')

# supported are '8.2.2' '8.4.2' '8.4.3' '8.4.4' '8.6.1' '8.6.2' '8.6.3' '8.6.4'
# '8.6.5' activated by default are the ones also used in a stackage snapshot
# removing versions you do not use will greatly reduce the compilation time of
# this package

_enabled_ghc_versions=('8.2.2' '8.4.3' '8.4.4' '8.6.3' '8.6.4' '8.6.5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init
}

build() {
    cd "${srcdir}/${pkgname}"
    for ver in "${_enabled_ghc_versions[@]}"; do
        stack --stack-yaml=stack-${ver}.yaml build
    done
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for ver in "${_enabled_ghc_versions[@]}"; do
        stack --stack-yaml=stack-${ver}.yaml --local-bin-path "${pkgdir}/usr/bin/" install \
        && mv "${pkgdir}/usr/bin/hie" "${pkgdir}/usr/bin/hie-${ver}"
    done
}

