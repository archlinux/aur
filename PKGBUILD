# Maintainer: xpufx <github@xpufx.com>

pkgname=paseo-cli-beta
_pkgname=cli
_npmscope=@getpaseo
pkgver=0.7.0_beta.3
pkgrel=1
pkgdesc='Command-line interface for controlling Paseo AI coding agents (beta)'
arch=('x86_64' 'aarch64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('Apache-2.0')
depends=('nodejs' 'bash' 'glibc' 'gcc-libs')
makedepends=('npm')
provides=('paseo')
conflicts=('paseo' 'paseo-bin' 'paseo-cli-bun' 'paseo-cli')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmscope}/${_pkgname}/-/${_pkgname}-0.7.0-beta.3.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/getpaseo/paseo/v0.7.0-beta.3/LICENSE")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('9f1826e6e5cbd80efea18f9f56c43dc69e567512b8e4a890db1f1f26f6a156cc'
            '79d5aedce6aa0adc547336dc1bd34c5cc9308ba110fac7079ed97515ee573ad3')
options=('!strip')

package() {
    npm install \
        --omit=dev \
        --omit=optional \
        --no-audit \
        --no-fund \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr/lib/${pkgname}" \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    rm -f "${pkgdir}/usr/lib/${pkgname}/package.json" \
        "${pkgdir}/usr/lib/${pkgname}/package-lock.json"
    grep -rlZ '^#!.*node' "${pkgdir}/usr/lib/${pkgname}/node_modules" \
        | xargs -0 -r sed -i '1{/^#!/d}'
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type f -perm /111 -exec chmod 644 {} +

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/paseo" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/node /usr/lib/paseo-cli-beta/node_modules/@getpaseo/cli/bin/paseo "$@"
WRAPPER

    rm -rf "${pkgdir}/usr/lib/${pkgname}/etc" \
        "${pkgdir}/usr/etc"

    case "${CARCH}" in
        x86_64) _node_pty_prebuild=linux-x64 ;;
        aarch64) _node_pty_prebuild=linux-arm64 ;;
    esac
    while IFS= read -r -d '' _pty_prebuilds; do
        find "$_pty_prebuilds" -mindepth 1 -maxdepth 1 -type d \
            ! -name "${_node_pty_prebuild}" -exec rm -rf {} +
    done < <(find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d \
        -path '*/node-pty/prebuilds' -print0)


    chmod -R go-w "${pkgdir}/usr"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
