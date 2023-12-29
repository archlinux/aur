# Maintainer: Luke Arms <luke@arms.to>

pkgname=pretty-php
pkgver=0.4.46
pkgrel=1
pkgdesc="The opinionated PHP code formatter"
arch=('any')
license=('MIT')
url="https://github.com/lkrms/pretty-php"
depends=('php')
makedepends=('php-sodium' 'git' 'composer' 'pandoc')
source=("${pkgname}::git+https://github.com/lkrms/pretty-php.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    rm -rf build/dist
}

build() {
    _check_sodium
    cd "${srcdir}/${pkgname}"
    scripts/build.sh man "v${pkgver}"
}

check() {
    cd "${srcdir}/${pkgname}"
    local phar
    phar=$(_phar)
    echo "Checking output of \`$phar --version\`"
    "$phar" --version | grep -F "${pkgname} v${pkgver}-"
}

package() {
    cd "${srcdir}/${pkgname}"
    local phar man
    phar=$(_phar)
    man=$(_man)
    install -Dm755 "$phar" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_phar() {
    local phar=(build/dist/*.phar)
    [[ ${#phar[@]} -eq 1 ]] && [[ -x $phar ]] || return
    printf '%s\n' "$phar"
}

_man() {
    local man=(build/dist/*.1)
    [[ ${#man[@]} -eq 1 ]] && [[ -r $man ]] || return
    printf '%s\n' "$man"
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
