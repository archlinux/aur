# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

: "${CADDY_STATICALLY_LINKED:=""}"

pkgname=caddy-custom
pkgver=2.10.2
pkgrel=1
pkgdesc='Caddy web server with plugins'
url='https://github.com/caddyserver/caddy'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('mailcap')
makedepends=('go')
provides=('caddy')
conflicts=('caddy')
backup=('etc/caddy/Caddyfile')
source=("plugin-list"
        "caddy.sysusers"
        "caddy.tmpfiles"
        "caddy-${pkgver}.tar.gz::https://github.com/caddyserver/caddy/archive/refs/tags/v${pkgver}.tar.gz"
        "caddy-dist-${pkgver}.tar.gz::https://github.com/caddyserver/dist/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP'
            '1dbef6bd4a096fcbab353a6bec0f6e34f8b6d2470e422c380642c2bd8ff83c20'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            'f63f46b7ae68ced0a5c2e31df1b6dfc7656117d162a1bc7fed4bd4afd14ddc8f'
            '6e9d3ed576e49c9159057a71f32d236f4127f9b53a1f697631b8a0430e3e20ce')

if [[ "${CADDY_STATICALLY_LINKED}" != "yes" ]]
then
    depends+=('glibc')
fi

prepare() {
    PLUGIN_LIST_PATH="${PLUGIN_LIST_PATH:-${srcdir}/plugin-list}"

    mapfile -t PLUGIN_LIST < "${PLUGIN_LIST_PATH}"

    mv "caddy-${pkgver}" caddy
    mv "dist-${pkgver}" caddy-dist

    cd caddy

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

    if [[ "${CADDY_STATICALLY_LINKED}" == "yes" ]]
    then
        export CGO_ENABLED=0
    else
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,shstk -Wl,-z,ibt"
    fi

    go build -o "${srcdir}/_caddy"
}

package() {
    cd "${srcdir}"

    install -Dm755 _caddy "${pkgdir}/usr/bin/caddy"
    "${pkgdir}/usr/bin/caddy" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    "${pkgdir}/usr/bin/caddy" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/caddy"
    "${pkgdir}/usr/bin/caddy" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/caddy.fish"

    install -Dm644 caddy.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
    install -Dm644 caddy.sysusers "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    cd caddy-dist
    install -Dm644 init/*.service -t "${pkgdir}/usr/lib/systemd/system"

    install -Dm644 config/Caddyfile -t "${pkgdir}/etc/caddy"
    install -Dm644 welcome/index.html -t "${pkgdir}/usr/share/caddy"
}
