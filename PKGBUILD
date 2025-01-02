# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=caddy-custom
pkgver=2.9.0
pkgrel=1
pkgdesc='Caddy web server with plugins'
url='https://github.com/caddyserver/caddy'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
makedepends=('go' 'xcaddy')
provides=('caddy')
conflicts=('caddy')
backup=('etc/caddy/Caddyfile')
source=("plugin-list"
        "caddy.sysusers"
        "caddy.tmpfiles"
        "caddy-dist-v${pkgver}.tar.gz::https://github.com/caddyserver/dist/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP'
            '1dbef6bd4a096fcbab353a6bec0f6e34f8b6d2470e422c380642c2bd8ff83c20'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            'ff27ab0f5d7a3a76a68ca75fbdfcc83a0e2725cc2100f4118e1e860da6ce68c8')

build() {
    PLUGIN_LIST_PATH="${PLUGIN_LIST_PATH:-${srcdir}/plugin-list}"

    mapfile -t < "${PLUGIN_LIST_PATH}" PLUGIN_LIST

    for line in "${PLUGIN_LIST[@]}"
    do
        if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]
        then
            MODULES+=("${line}")
        fi
    done

    xcaddy build v${pkgver} ${MODULES[@]/#/--with }

    for i in zsh bash fish
    do
        ./caddy completion $i > caddy.$i
    done
}

package() {
    cd "${srcdir}"
    install -Dm755 caddy -t "${pkgdir}/usr/bin"

    install -Dm644 caddy.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
    install -Dm644 caddy.sysusers "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    install -Dm644 caddy.zsh "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    install -Dm644 caddy.bash "${pkgdir}/usr/share/bash-completion/completions/caddy"
    install -Dm644 caddy.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"

    cd "${srcdir}/dist-${pkgver}"
    install -Dm644 init/caddy.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 init/caddy-api.service -t "${pkgdir}/usr/lib/systemd/system"

    install -Dm644 config/Caddyfile -t "${pkgdir}/etc/caddy"
    install -Dm644 welcome/index.html -t "${pkgdir}/usr/share/caddy"
}
