# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=caddy-custom
pkgver=2.10.0
pkgrel=2
pkgdesc='Caddy web server with plugins'
url='https://github.com/caddyserver/caddy'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
provides=('caddy')
conflicts=('caddy')
backup=('etc/caddy/Caddyfile')
source=("plugin-list"
        "caddy.sysusers"
        "caddy.tmpfiles"
        "caddy::git+https://github.com/caddyserver/caddy.git#tag=v${pkgver}"
        "caddy-dist::git+https://github.com/caddyserver/dist.git#tag=v${pkgver}")
sha256sums=('SKIP'
            '1dbef6bd4a096fcbab353a6bec0f6e34f8b6d2470e422c380642c2bd8ff83c20'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            '0cb259107accced91a0d50d66eaf754c2d90fd7916cd895987b9290d0a01324b'
            'b7b29543628f55a1209021a35b5769fa5424d867301a467721010e8d0324344e')

prepare() {
    PLUGIN_LIST_PATH="${PLUGIN_LIST_PATH:-${srcdir}/plugin-list}"

    mapfile -t PLUGIN_LIST < "${PLUGIN_LIST_PATH}"

    cd "${srcdir}/caddy"

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
    cd "${srcdir}/caddy/cmd/caddy"

    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ./caddy -ldflags "-s -w -X github.com/caddyserver/caddy/v2.CustomVersion=v${pkgver}"

    for i in zsh bash fish
    do
        ./caddy completion $i > caddy.$i
    done
}

package() {
    pushd "${srcdir}"

    pushd caddy/cmd/caddy
    install -Dm755 caddy -t "${pkgdir}/usr/bin"
    install -Dm644 caddy.zsh "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    install -Dm644 caddy.bash "${pkgdir}/usr/share/bash-completion/completions/caddy"
    install -Dm644 caddy.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    popd

    install -Dm644 caddy.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
    install -Dm644 caddy.sysusers "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    pushd caddy-dist
    install -Dm644 init/caddy.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 init/caddy-api.service -t "${pkgdir}/usr/lib/systemd/system"

    install -Dm644 config/Caddyfile -t "${pkgdir}/etc/caddy"
    install -Dm644 welcome/index.html -t "${pkgdir}/usr/share/caddy"
}
