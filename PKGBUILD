# Maintainer: Seyyed Ali Mohammadiyeh (Max Base) <MaxBaseCode@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=salam-bin
_pkgname=salam
pkgver=0.5.5
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
sha256sums_x86_64=('2f701caa7b37c376535e3ef8ca96a5c85748d94ed0082d49a9334d6dd3fbac98')
sha256sums_aarch64=('52f90a954a73885264c75aef5359c614b367b005789e4e6ce619079f12371a5c')
sha256sums_armv7h=('fc0e132cfe9a3b2a06e20d936554d84a0f1e0dd5687dad7816b413cd55d586a2')

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
