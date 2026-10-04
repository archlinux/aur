# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salamlang
_pkgname=salam
pkgver=0.4.8
pkgrel=1
pkgdesc="General-purpose systems programming language with a built-in DSL"
arch=('x86_64' 'aarch64')
url="https://github.com/SalamLang/Salam"
license=('GPL-3.0-or-later')
depends=('zlib' 'zstd' 'libxml2')
makedepends=('clang' 'llvm' 'lld')
provides=("salam=${pkgver}")
conflicts=('salam-bin')
options=('!strip' '!debug')

# Salam's compiler is written in Salam, so the build needs an existing Salam.
_seedver=0.4.7
_rel="${url}/releases/download"

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1aaa7654e5da7c1760031dcd0b1ea8ac12e06d63ac3e07b98d695b91d705929')

source_x86_64=("salam-seed-${_seedver}-x86_64.tar.gz::${_rel}/v${_seedver}/salam-${_seedver}-linux-x86_64.tar.gz")
source_aarch64=("salam-seed-${_seedver}-aarch64.tar.gz::${_rel}/v${_seedver}/salam-${_seedver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('39bc9e0d626f9074abb3b0ce9412c60977b0f6b74a5a4e5c95948a4178e0a02a')
sha256sums_aarch64=('b313e01a561acd3a23b018f87e805311dca5b8f78152f24de16e9339f9faa16a')

_seeddir() {
    case "$CARCH" in
        x86_64)  echo "salam-linux-x86_64" ;;
        aarch64) echo "salam-linux-aarch64" ;;
    esac
}

build() {
    cd "${srcdir}/Salam-${pkgver}"
    sh tools/bash/build-selfhost.sh \
        --output="${srcdir}/Salam-${pkgver}/salam" \
        --seed="${srcdir}/$(_seeddir)/salam"
}

check() {
    cd "${srcdir}/Salam-${pkgver}"
    printf 'func main:\n    println "salam"\nend\n' > "${srcdir}/hello.salam"
    SALAM_STD="${srcdir}/Salam-${pkgver}/std" ./salam exec "${srcdir}/hello.salam" | grep -qx salam
}

package() {
    cd "${srcdir}/Salam-${pkgver}"

    install -Dm755 salam "${pkgdir}/usr/lib/${_pkgname}/salam"

    install -dm755 "${pkgdir}/usr/lib/${_pkgname}/std"
    cp -a std/. "${pkgdir}/usr/lib/${_pkgname}/std/"
    find "${pkgdir}/usr/lib/${_pkgname}/std" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr/lib/${_pkgname}/std" -type f -exec chmod 644 {} +

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
SALAM_HOME=/usr/lib/salam
export SALAM_STD="${SALAM_STD:-$SALAM_HOME/std}"
exec "$SALAM_HOME/salam" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
