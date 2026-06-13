# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>

pkgname=plasmasafe
pkgver=0.1.0.0
pkgrel=1
pkgdesc='KDE Plasma configuration backup and restore command-line tool'
arch=('x86_64')
url='https://github.com/yousefvand/plasmasafe'
license=('MIT')
depends=('ghc-libs' 'haskell-aeson' 'haskell-aeson-pretty' 'haskell-optparse-applicative')
makedepends=('ghc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yousefvand/plasmasafe/archive/refs/tags/v0.1.0.0.tar.gz")
sha256sums=('0dd8593c4c62bd753d53e02486c7ed006cd6acfe4ad08d912eae06941b399721')

_find_srcdir() {
    local d

    d="${srcdir}/${pkgname}-${pkgver}"
    if [[ -d "$d" ]]; then
        printf '%s\n' "$d"
        return 0
    fi

    d="${srcdir}/${pkgname}-v${pkgver}"
    if [[ -d "$d" ]]; then
        printf '%s\n' "$d"
        return 0
    fi

    find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -name "${pkgname}-*" | head -n 1
}

prepare() {
    cd "$(_find_srcdir)"

    # The project uses Cabal Simple build-type, but the release tree may not
    # include Setup.hs. Generate it locally inside the makepkg build directory.
    cat > Setup.hs <<'SETUP_EOF'
import Distribution.Simple
main = defaultMain
SETUP_EOF
}

build() {
    cd "$(_find_srcdir)"

    runhaskell Setup.hs configure         --prefix=/usr         --docdir="/usr/share/doc/${pkgname}"         --enable-executable-dynamic         --enable-shared         --enable-optimization=2

    runhaskell Setup.hs build
}

package() {
    cd "$(_find_srcdir)"

    runhaskell Setup.hs copy --destdir="${pkgdir}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
