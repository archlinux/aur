# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=paseo-cli-bun
_pkgname=cli
_npmscope=@getpaseo
pkgver=0.2.0
pkgrel=1
pkgdesc='Command-line interface for controlling Paseo AI coding agents, using Bun runtime'
arch=('x86_64' 'aarch64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('AGPL-3.0-or-later')
depends=('bun' 'bash')
makedepends=('npm')
provides=('paseo')
conflicts=('paseo' 'paseo-bin' 'paseo-cli')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmscope}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/getpaseo/paseo/v${pkgver}/LICENSE")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('5f4e37907e651c0f24d44bb994c63ef1f820f7a6da966c259093c60dd2dabc69'
            '2d29a730f15470509f7a36e63a024c2f121958471474dfcd6b272c99586fc337')
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
exec /usr/bin/bun /usr/lib/paseo-cli-bun/node_modules/@getpaseo/cli/bin/paseo "$@"
WRAPPER

    rm -rf "${pkgdir}/usr/lib/${pkgname}/etc" \
        "${pkgdir}/usr/etc"

    case "${CARCH}" in
        x86_64) _node_pty_prebuild=linux-x64 ;;
        aarch64) _node_pty_prebuild=linux-arm64 ;;
    esac
    find "${pkgdir}/usr/lib/${pkgname}/node_modules/node-pty/prebuilds" \
        -mindepth 1 -maxdepth 1 -type d \
        ! -name "${_node_pty_prebuild}" -exec rm -rf {} +


    chmod -R go-w "${pkgdir}/usr"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
