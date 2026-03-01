# Maintainer: Artem Shustrov <shustrov_a@inbox.ru>
pkgname=cloud-cli-bin
pkgver=4.2.12
pkgrel=1
pkgdesc="Cloud.ru CLI — command-line interface for managing Cloud.ru services"
arch=('x86_64' 'aarch64')
url="https://cloud.ru/docs/cloud-cli/ug/topics/guides__install-cli-linux"
license=('custom')
provides=('cloud-cli')
conflicts=('cloud-cli')

_base_url="https://sbc-cli.obs.ru-moscow-1.hc.sbercloud.ru/cli/${pkgver}"

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_base_url}/cloud-cli-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}/cloud-cli-linux-arm64.tar.gz")

sha256sums_x86_64=('642d8b33afb113ffb36bd6e87fc1faf5add65fd01dae316cbd3f65c9d1c508ed')
sha256sums_aarch64=('e7b977bb41616acdc474671c76835f9cb529238fe6f39c0953a53854c19b63c3')

package() {
    install -Dm755 cloud "${pkgdir}/usr/bin/cloud"

    # Bash completion (uses the binary itself as a completion function via complete -C)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/cloud" <<'EOF'
complete -C /usr/bin/cloud cloud
EOF

    # Zsh completion (wraps the same bash complete -C protocol)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_cloud" <<'EOF'
#compdef cloud

_cloud() {
    local cur="${words[CURRENT]}"
    local prev="${words[CURRENT-1]}"
    local line="${words[*]}"

    local -a completions
    completions=( ${(f)"$(
        COMP_LINE="$line" \
        COMP_POINT="${#line}" \
        /usr/bin/cloud cloud "$cur" "$prev" 2>/dev/null
    )"} )

    compadd -a completions
}

_cloud "$@"
EOF

    # License
    install -Dm644 OpenSourceSoftwareNotice.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/OpenSourceSoftwareNotice.md"

    # Documentation
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
