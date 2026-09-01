# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=command-code
pkgver=1.40.0
pkgrel=1
pkgdesc='AI coding agent that continuously learns your coding taste'
arch=('x86_64')
url='https://commandcode.ai'
license=('LicenseRef-command-code')
depends=('nodejs>=22')
makedepends=('npm')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('080e81e51d22b059fc39bfaefaef7b16e73c29b19d8ef405ba7c68fd035d248512ca06e9757eb25bf3f926c3e83060c29101793549f43c5b21c6e810dd8b9451'
            '3a21c0ece6566af238a2f34cf9ca9a5453b992e828a09bbe1a9c5ce0fda8d7ba382bcbdf7b2eb5563009af6f8ba71f2dbeca7b66ac9bcb148ef0dca25788ad13')

package() {
    # Temporary workaround for CachyOS nodejs 26.7.0-2 broken with ada 4.0 (libada.so.3 missing)
    # see https://github.com/CachyOS/CachyOS-PKGBUILDS/issues/1793 — TODO: remove after cachyos-v3 rebuilds nodejs
    if ! node --version >/dev/null 2>&1; then
        msg2 "System node broken (libada.so.3), using fallback Node 22 for build"
        local _fallback_ver=22.23.2
        local _fallback_dir="${srcdir}/node-v${_fallback_ver}-linux-x64"
        if [[ ! -x "${_fallback_dir}/bin/node" ]]; then
            if ! command -v curl >/dev/null 2>&1; then
                error "curl required for fallback Node download but not found"
                return 1
            fi
            msg2 "Downloading fallback Node v${_fallback_ver}..."
            curl -fsSL "https://nodejs.org/dist/v${_fallback_ver}/node-v${_fallback_ver}-linux-x64.tar.xz" \
                | tar -xJ -C "${srcdir}" || {
                error "Failed to download/extract fallback Node"
                return 1
            }
        fi
        export PATH="${_fallback_dir}/bin:${PATH}"
        msg2 "Fallback node: $(node --version)  npm: $(npm --version)"
        if ! node --version >/dev/null 2>&1; then
            error "Fallback Node still broken"
            return 1
        fi
    fi

    npm install -g \
        --no-audit \
        --no-fund \
        --ignore-scripts \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    local entry
    entry="$(readlink -f "${pkgdir}/usr/bin/cmd")"
    entry="${entry#$pkgdir}"

    rm -f "${pkgdir}/usr/bin/cmd" \
          "${pkgdir}/usr/bin/cmdc" \
          "${pkgdir}/usr/bin/command-code" \
          "${pkgdir}/usr/bin/commandcode"

    for bin in cmd cmdc command-code commandcode; do
        install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${bin}" << WRAPPER
#!/bin/sh
if [ "\$1" = "update" ]; then
    echo "command-code is managed by your package manager. Upgrade via your AUR helper."
    exit 0
fi
if ! node --version >/dev/null 2>&1; then
    echo "command-code: system nodejs is broken (libada.so.3 missing, https://github.com/CachyOS/CachyOS-PKGBUILDS/issues/1793)" >&2
    echo "Workaround until CachyOS rebuilds nodejs: sudo pacman -S extra/nodejs" >&2
    exit 127
fi
COMMANDCODE_SKIP_UPDATES=1 exec ${entry} "\$@"
WRAPPER
    done

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
