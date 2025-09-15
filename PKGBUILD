# Maintainer: taotieren <admin@taotieren.com>

pkgname=mediawarp-git
_name=MediaWarp
pkgver=0.1.2.r2.gf369448
pkgrel=1
pkgdesc="EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm."
arch=($CARCH)
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
source=(
    "${pkgname}::git+${url}.git"
    "embyExternalUrl::git+https://github.com/bpking1/embyExternalUrl.git"
    "dd-danmaku::git+https://github.com/9channel/dd-danmaku.git"
    "emby-web-mod::git+https://github.com/newday-life/emby-web-mod.git"
    "jellyfin-crx::git+https://github.com/newday-life/jellyfin-crx.git"
    "emby-crx::git+https://github.com/Nolovenodie/emby-crx.git"
    "jellyfin-danmaku::git+https://github.com/Izumiko/jellyfin-danmaku.git"
    "${pkgname%-git}.service"
    "${pkgname%-git}.tmpfiles"
    "${pkgname%-git}.sysusers"
)
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '162fb09f8009c356fb60a6f2c23c1c910768aa4191d0f625400cbe9f7d275a3d'
    '5e93ba0a2c59cf2c0b35fa61ef3818a7d1dd41a966f5547c8faaf4b197d8066c'
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
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.static/embyExternalUrl.url "$srcdir/embyExternalUrl"
    git config submodule.static/dd-danmaku.url "$srcdir/dd-danmaku"
    git config submodule.static/emby-web-mod.url "$srcdir/emby-web-mod"
    git config submodule.static/jellyfin-crx.url "$srcdir/jellyfin-crx"
    git config submodule.static/emby-crx.url "$srcdir/emby-crx"
    git config submodule.static/jellyfin-danmaku.url "$srcdir/jellyfin-danmaku"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    #     export GO111MODULE=on
    #     export GOPROXY=https://goproxy.cn,direct

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
