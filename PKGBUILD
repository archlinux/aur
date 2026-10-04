# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salam-bin
_pkgname=salam
pkgver=0.4.8
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
sha256sums_x86_64=('55810d1dc85dde83b502ec96a97dd3d9ac94c4d4ad596be1517a368491b48d88')
sha256sums_aarch64=('bc8cca81ce7fa351b6f7c3e1ad9b470cb22fc20b5ced3993542692dfc76b4605')
sha256sums_armv7h=('eff14b228289baf75cee141bc187aef70ca415ef8e8c370b044fa715bc171045')

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
