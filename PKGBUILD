# Maintainer: Luke Arms <luke@arms.to>

pkgname=pretty-php
pkgver=0.4.23
pkgrel=1
pkgdesc="The opinionated code formatter for PHP"
arch=('any')
license=('MIT')
url="https://github.com/lkrms/pretty-php"
depends=('php')
makedepends=('php-sodium' 'git' 'composer' 'jq')
source=("${pkgname}::git+https://github.com/lkrms/pretty-php.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    composer install --no-plugins --no-interaction
}

build() {
    _check_sodium
    cd "${srcdir}/${pkgname}"
    scripts/build.sh "v${pkgver}"
}

check() {
    cd "${srcdir}/${pkgname}"
    local phar
    phar=$(_phar)
    echo "Checking output of \`$phar --version\`"
    "$phar" --version | grep -F "pretty-php v${pkgver}-"
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

_check_sodium() {
    if ! php -m | grep -Fx sodium >/dev/null; then
        local dir=${srcdir}/php.ini.d
        mkdir -p "$dir"
        echo 'extension=sodium' >"$dir/sodium.ini"
        # If PHP_INI_SCAN_DIR is already in the environment, honour it, empty or
        # otherwise
        if [[ -n ${PHP_INI_SCAN_DIR+1} ]]; then
            export PHP_INI_SCAN_DIR=${PHP_INI_SCAN_DIR:+$PHP_INI_SCAN_DIR:}$dir
            return
        fi
        export PHP_INI_SCAN_DIR=:$dir
    fi
}
