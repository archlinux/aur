# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salam-bin
_pkgname=salam
pkgver=0.4.4
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
sha256sums_x86_64=('2431e1a24c4fbcd2aa16768317da92353100f45af506cb91c7c3748e6e788372')
sha256sums_aarch64=('29cb317f462dfa8f48de34bab3b6b51d3bf1169a3ed6e680992f2bbf1c807261')
sha256sums_armv7h=('b02ed12962e333abfa600e6e72a811fd2688f8f618c1c899b9ba5199e8d92f09')

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
