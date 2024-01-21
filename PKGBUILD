# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="webhookd"
pkgver=1.18.0
pkgrel=2
pkgdesc="A very simple webhook server launching scripts."
arch=("any")
url="https://github.com/ncarlier/${pkgname}"
license=("MIT")
makedepends=("git" "go")
backup=("etc/default/${pkgname}")
source=("${pkgname}::git+${url}"
        "${pkgname}.service"
        "${pkgname}.user.service")
sha256sums=('SKIP'
            'b24d5dfc84bf7b1cceea963b96de3085b6ed079c8f99c56225d8125c791d3543'
            '714e9e219b51af192208500b6936f748ad86a5ec79d5e5683cab1e81fbeae09c')

prepare() {
    cd "${pkgname}"
    git checkout "v${pkgver}"

    echo >> "etc/default/${pkgname}.env"
    echo "# You can omit the script extension. If you do, webhookd will search by default for a .sh file. " >> "etc/default/${pkgname}.env"
    echo "# You can change the default extension using the WHD_HOOK_DEFAULT_EXT environment variable. " >> "etc/default/${pkgname}.env"
    echo "#WHD_HOOK_DEFAULT_EXT=\"\"" >> "etc/default/${pkgname}.env"
}

build() {
    cd "${pkgname}"

    local git_commit=$(git rev-list -1 HEAD --abbrev-commit)
    local build_time="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    local ldflags=" \
        -s -w \
        -X github.com/ncarlier/${pkgname}/pkg/version.Version=v${pkgver} \
        -X github.com/ncarlier/${pkgname}/pkg/version.GitCommit=${git_commit} \
        -X github.com/ncarlier/${pkgname}/pkg/version.Built=${build_time} \
        -buildid= \
        -extldflags '${LDFLAGS}'
    "
    go build \
        -tags osusergo,netgo \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}"
}

package() {
    install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}/etc/default/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}"/{README.md,scripts/*.sh,scripts/examples/*}
}
