# Maintainer: taotieren <admin@taotieren.com>

pkgname=mediawarp-git
_name=MediaWarp
pkgver=0.0.5.r19.gff38e54
pkgrel=1
pkgdesc="EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/Akimio521/MediaWarp"
license=('AGPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    glibc
    sh)
optdepends=(
    'alist: File list program that supports multiple storage'
    'autofilm: A small project to provide Strm direct-link playback for Emby and Jellyfin servers, recommended for use with MediaWarp.'
    'emby-server: Bring together your videos, music, photos, and live television'
    'jellyfin-server: Jellyfin server backend')
makedepends=(
    git
    go
)
backup=(etc/${pkgname%-git}/config.yaml)
options=('!strip' '!debug')
install=${pkgname%-git}.install
source=(
    "${pkgname}::git+${url}.git"
    "${pkgname%-git}.service"
    "${pkgname%-git}.tmpfiles"
    "${pkgname%-git}.sysusers"
)
sha256sums=('SKIP'
            '162fb09f8009c356fb60a6f2c23c1c910768aa4191d0f625400cbe9f7d275a3d'
            '3e7e96f77a13441c82ed7fc066c1123bab44b3dc7f13e41378e573b952518846'
            '7f0393bb6d622ad51b72c82df9a2313f378bf2d20019fee36671ffcc5878453e')
pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    #     go clean -modcache
    #     go mod init "${url#https://}"
    go mod tidy
    mkdir -pv build/
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/${_name} "${pkgdir}/usr/share/${pkgname%-git}/${pkgname%-git}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/sh
cd /usr/share/${pkgname%-git}/
exec ${pkgname%-git} "\$@"
EOF
    install -Dm0644 "${srcdir}/${pkgname}/config/config.yaml.example" "${pkgdir}/etc/${pkgname%-git}/config.yaml"
    install -dm0644 "${pkgdir}/usr/share/${pkgname%-git}/logs" \
        "${pkgdir}/usr/share/${pkgname%-git}/static" \
        "${pkgdir}/usr/share/${pkgname%-git}/config"

    install -Dvm644 "${srcdir}/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dvm644 "${srcdir}/${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
    install -Dvm644 "${srcdir}/${pkgname%-git}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
}
