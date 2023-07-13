# Maintainer: Luke Arms <luke@arms.to>

pkgname=pretty-php
pkgver=0.4.15
pkgrel=1
pkgdesc="The opinionated formatter for modern, expressive PHP"
arch=('any')
license=('MIT')
url='https://github.com/lkrms/pretty-php'
depends=('php' 'composer')
makedepends=('git' 'jq')
source=("${pkgname}::git+https://github.com/lkrms/pretty-php.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    composer install --no-plugins --no-interaction
}

build() {
    cd "${srcdir}/${pkgname}"
    scripts/build.sh --latest --phar
}

check() {
    cd "${srcdir}/${pkgname}"
    local phar
    phar=$(_phar)
    echo "Checking output of \`$phar --version\`"
    "$phar" --version | grep -Fq "pretty-php v${pkgver}-"
}

package() {
    cd "${srcdir}/${pkgname}"
    local phar
    phar=$(_phar)
    install -Dm755 "$phar" "${pkgdir}/usr/bin/pretty-php"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_phar() {
    local phar
    phar=$(jq -r \
        '.assets[] | select(.type == "phar") | .path' \
        build/dist/manifest.json)
    printf 'build/dist/%s' "$phar"
}
