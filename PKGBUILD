# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salam-bin
_pkgname=salam
pkgver=0.5.4
pkgrel=1
pkgdesc="General-purpose systems programming language with a built-in DSL (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SalamLang/Salam"
license=('GPL-3.0-or-later')
provides=("salam=${pkgver}")
conflicts=('salam')
options=('!strip' '!debug')

_url="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_url}/salam-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_url}/salam-${pkgver}-linux-aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${_url}/salam-${pkgver}-linux-armhf.tar.gz")
sha256sums_x86_64=('2d07247c88118fd8da5c706129e941b0c68bfc368302507b55089287b3a184a9')
sha256sums_aarch64=('2df4e2007ed57f3f5a7f0c97169199840a33f401c279812bc89e4d7409cdadbc')
sha256sums_armv7h=('7e2aab5393fa17b815379a5f263bdcc3f4a3ee730d8ef39e49875f4174c4934e')

_srcdir() {
    case "$CARCH" in
        x86_64)  echo "salam-linux-x86_64" ;;
        aarch64) echo "salam-linux-aarch64" ;;
        armv7h)  echo "salam-linux-armhf" ;;
    esac
}

package() {
    local d
    d="$(_srcdir)"
    cd "${srcdir}/${d}"

    # The compiler resolves std/ relative to its own binary, so the two stay
    # together under /usr/lib and /usr/bin/salam is a wrapper.
    install -Dm755 salam "${pkgdir}/usr/lib/${_pkgname}/salam"

    install -dm755 "${pkgdir}/usr/lib/${_pkgname}/std"
    cp -a std/. "${pkgdir}/usr/lib/${_pkgname}/std/"
    find "${pkgdir}/usr/lib/${_pkgname}/std" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr/lib/${_pkgname}/std" -type f -exec chmod 644 {} +

    if [ -d sysroots ]; then
        cp -a sysroots "${pkgdir}/usr/lib/${_pkgname}/sysroots"
    fi

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
SALAM_HOME=/usr/lib/salam
export SALAM_STD="${SALAM_STD:-$SALAM_HOME/std}"
exec "$SALAM_HOME/salam" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}
