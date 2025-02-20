# Maintainer: taotieren <admin@taotieren.com>

pkgname=mediawarp
_name=MediaWarp
pkgver=0.0.7
pkgrel=1
pkgdesc="EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm."
arch=($CARCH)
url="https://github.com/Akimio521/MediaWarp"
license=('AGPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
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
    go)
backup=(etc/${pkgname}/config.yaml)
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
)
sha256sums=('f433d094d47fdd4742aeb0fd6121df38f197c35e04d256715cde16a9b41abe91'
            '162fb09f8009c356fb60a6f2c23c1c910768aa4191d0f625400cbe9f7d275a3d'
            '5e93ba0a2c59cf2c0b35fa61ef3818a7d1dd41a966f5547c8faaf4b197d8066c'
            '7f0393bb6d622ad51b72c82df9a2313f378bf2d20019fee36671ffcc5878453e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
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
    cd "${srcdir}/${_name}-${pkgver}"

    install -Dm755 build/${_name} "${pkgdir}/usr/share/${pkgname}/${pkgname}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
cd /usr/share/${pkgname}/
exec ${pkgname} "\$@"
EOF
    install -Dm0644 "${srcdir}/${_name}-${pkgver}/config/config.yaml.example" "${pkgdir}/etc/${pkgname}/config.yaml"
    install -dm0644 "${pkgdir}/usr/share/${pkgname}/logs" \
        "${pkgdir}/usr/share/${pkgname}/static" \
        "${pkgdir}/usr/share/${pkgname}/config"

    install -Dvm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
