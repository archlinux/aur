# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=caddy-custom
pkgver=2.10.0
pkgrel=1
pkgdesc='Caddy web server with plugins'
url='https://github.com/caddyserver/caddy'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=('caddy')
conflicts=('caddy')
backup=('etc/caddy/Caddyfile')
source=("plugin-list"
        "caddy.sysusers"
        "caddy.tmpfiles"
        "caddy-v${pkgver}.tar.gz::https://github.com/caddyserver/caddy/archive/refs/tags/v${pkgver}.tar.gz"
        "caddy-dist-v${pkgver}.tar.gz::https://github.com/caddyserver/dist/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP'
            '1dbef6bd4a096fcbab353a6bec0f6e34f8b6d2470e422c380642c2bd8ff83c20'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            'e07e2747c394a6549751950ec8f7457ed346496f131ee38538ae39cf89ebcc68'
            'ea08effd19405a195c01c0acf4f1aef753cfc3031584d3649ef3562b530bfe12')

prepare() {
    PLUGIN_LIST_PATH="${PLUGIN_LIST_PATH:-${srcdir}/plugin-list}"

    mapfile -t PLUGIN_LIST < "${PLUGIN_LIST_PATH}"

    cd "${srcdir}/caddy-${pkgver}"

    for line in "${PLUGIN_LIST[@]}"
    do
        if [[ -z "${line}" || "${line}" =~ ^[[:space:]]*# ]]
        then
            continue
        fi

        if [[ "${line}" =~ ^([^@=]+)(@([^=]+))?(=(.+))?$ ]]
        then
            module="${BASH_REMATCH[1]}"
            version="${BASH_REMATCH[3]}"
            replacement="${BASH_REMATCH[5]}"

            echo "Adding module ${module}..."
            sed -i "/plug in Caddy modules here/a _ \"${module}\"" cmd/caddy/main.go

            if [[ -n "${replacement}" ]]
            then
                if [[ -n "${version}" ]]
                then
                    go mod edit -replace="${module}@${version}=${replacement}"
                else
                    go mod edit -replace="${module}=${replacement}"
                fi
            elif [[ -n "${version}" ]]
            then
                go mod edit -require="${module}@${version}"
            fi
        else
            echo "Invalid plugin format: ${line}"
            exit 1
        fi
    done

    go mod tidy
}

build() {
    cd "${srcdir}/caddy-${pkgver}/cmd/caddy"

    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ./caddy -ldflags "-s -w"

    for i in zsh bash fish
    do
        ./caddy completion $i > caddy.$i
    done
}

package() {
    pushd "${srcdir}"

    pushd "caddy-${pkgver}/cmd/caddy"
    install -Dm755 caddy -t "${pkgdir}/usr/bin"
    install -Dm644 caddy.zsh "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    install -Dm644 caddy.bash "${pkgdir}/usr/share/bash-completion/completions/caddy"
    install -Dm644 caddy.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    popd

    install -Dm644 caddy.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
    install -Dm644 caddy.sysusers "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    pushd "dist-${pkgver}"
    install -Dm644 init/caddy.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 init/caddy-api.service -t "${pkgdir}/usr/lib/systemd/system"

    install -Dm644 config/Caddyfile -t "${pkgdir}/etc/caddy"
    install -Dm644 welcome/index.html -t "${pkgdir}/usr/share/caddy"
}
