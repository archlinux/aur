# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=openlist
pkgver=4.1.7
pkgrel=1
pkgdesc="A new AList Fork to Anti Trust Crisis"
arch=($CARCH)
url="https://github.com/OpenListTeam/OpenList"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go' 'curl' 'jq' 'tar')
provides=(${pkgname})
conflicts=(${pkgname})
backup=('etc/openlist/config.json')
optdepends=('aria2: download by aria2.')
source=("$pkgname::git+https://github.com/OpenListTeam/OpenList.git#tag=v${pkgver}"
    "config.json"
    "openlist.service"
    "openlist.sysusers"
    "openlist.tmpfiles"
    "openlist.install")
install=openlist.install
options=(!debug)
sha256sums=('7423c8e79e5061cc17f49b354472ef469d67cadf30c5143593a16363dbc7ba29'
            '9259caae294aebb88e0e25f83074e090f3581556c05548544739edf88c028537'
            '4bc1ccc08f17f5c9ce0fe7fc600ea9d5e1b034d52a776244c627bc13a3fa401d'
            'fe9c68aa8a6a27477049c839cb5818ba3ddbd88c6813dd2eacea73da70807905'
            'e4f341a876f43b551b67b730aa93dc3a8d2e5f6863ca234852a4389aa64c0aca'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    #     export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct
    cd "${srcdir}/$pkgname"
    rm -rf public/dist && mkdir -p public/dist
    echo "Downloading frontend assets..."
    frontend_url=$(curl -fsSL --max-time 10 -H "Accept: application/vnd.github.v3+json" \
        "https://api.github.com/repos/OpenListTeam/OpenList-Frontend/releases" |
        jq -r 'map(select(.prerelease)) | first | .tag_name')
    if [ "$frontend_url" != "null" ] && [ -n "$frontend_url" ]; then
        asset_url=$(curl -fsSL --max-time 10 -H "Accept: application/vnd.github.v3+json" \
            "https://api.github.com/repos/OpenListTeam/OpenList-Frontend/releases/tags/$frontend_url" |
            jq -r '.assets[].browser_download_url' |
            grep "openlist-frontend-dist" |
            grep "\.tar\.gz$" | head -1)
        if [ -n "$asset_url" ]; then
            curl -fsSL "$asset_url" | tar zxvf - -C public/dist
        else
            echo "Error: Could not find frontend assets package"
            exit 1
        fi
    else
        echo "Error: Could not get frontend version info"
        exit 1
    fi
    echo "Building OpenList..."
    go build -o ../openlist \
        -ldflags="--extldflags '-static -fpic' -w -s \
        -X 'github.com/OpenListTeam/OpenList/internal/conf.BuiltAt=$(date +'%F %T %z')' \
        -X 'github.com/OpenListTeam/OpenList/internal/conf.GitAuthor=The OpenList Projects Contributors <noreply@openlist.team>' \
        -X 'github.com/OpenListTeam/OpenList/internal/conf.GitCommit=$(git log --pretty=format:"%h" -1)' \
        -X 'github.com/OpenListTeam/OpenList/internal/conf.Version=git-$(git rev-parse --short HEAD)' \
        -X 'github.com/OpenListTeam/OpenList/internal/conf.WebVersion=git-$(git rev-parse --short HEAD)'" \
        -tags=jsoniter .
}

package() {
    install -Dm755 ${srcdir}/${pkgname}/OpenList ${pkgdir}/usr/bin/openlist
    install -Dm644 ${srcdir}/openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 ${srcdir}/config.json -t ${pkgdir}/etc/openlist/
    install -Dm644 ${srcdir}/openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 ${srcdir}/openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
