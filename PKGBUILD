# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salam-bin
_pkgname=salam
pkgver=0.5.2
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
sha256sums_x86_64=('a21861c105de46670883859ed02b5ff975f3195604c5ee5a8baff5236a9cae2d')
sha256sums_aarch64=('7b008698d7de5ec02d74f4c8b18d37cec9a69df08a8080008d11f8b6ece5791d')
sha256sums_armv7h=('0a7d13d61621d73caddbd18ad96fbf990cd17244e49094e067cb8ca4dfe1d59d')

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
