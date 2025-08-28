# Maintainer: Senge Dev <sengedev at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-git
pkgver=2.0.8.r121.g5c59042
pkgrel=6
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel.install
depends=(
    glibc
    sh
)
makedepends=(
    go
    nodejs
    git
    npm
    python
)
optdepends=(
    'ufw'            # Firewall manager
    'firewalld'      # Firewall manager
    'docker'         # Docker image manager
    'docker-compose' # Docker compose plugin, make sure 1Panel app store works.
)
provides=(${pkgname%-git})
conflicts=(
    ${pkgname%-git}
    '1panel-dev-bin'
    '1panel-bin'
)
source=("${pkgname}"::"git+https://github.com/1Panel-dev/1Panel.git"
    "1pctl-agent"
    "1pctl-core"
    "1panel-agent.service"
    "1panel-core.service"
)
sha256sums=('SKIP'
    '76b2e927b03781e1d8a49d551b5847ba8f2031d4e12f3a200776659e337ebb15'
    'f297311c938647af849c4ed2958d76a3c78d12f3cd4ee241ba6cfbed5133850a'
    'd9c84bef23acd99fec47ae49a5469968499fb27f16ed07f32e849f573e78fd71'
    '50c10b9cf798f139dd3c0f98f0f09febcc5456c96f10cfd235232bd3bef42265')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=${pkgver}#g" ${srcdir}/1pctl-agent
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=${pkgver}#g" ${srcdir}/1pctl-core
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +

    # Edit the source code using sed
    sed -i 's/当前已经是最新版本/当前版本为 AUR 版本，如需更新，请使用 AUR 更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/zh.ts
    sed -i 's/當前已經是最新版本/當前版本為 AUR 版本，如需更新，請使用 AUR 更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/zh-Hant.ts
    sed -i 's/It is currently the latest version/It is ArchLinux AUR version, if you want to update it, please use AUR./g' ${srcdir}/${pkgname}/frontend/src/lang/modules/en.ts

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    export NODE_OPTIONS="--max-old-space-size=4096"

    cd ${srcdir}/${pkgname}/frontend
    npm install
    #     npm audit fix --force
    npm rum build:pro
    cd ${srcdir}/${pkgname}/core
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/${pkgname}/build/1panel-core ${srcdir}/${pkgname}/core/cmd/server/main.go
    cd ${srcdir}/${pkgname}/agent
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/${pkgname}/build/1panel-agent ${srcdir}/${pkgname}/agent/cmd/server/main.go
}

package() {
    install -vd ${pkgdir}/var/lib/1p/1panel-agent
    install -vd ${pkgdir}/var/lib/1p/1panel-core
    install -vDm755 ${srcdir}/${pkgname}/build/1panel-core -t ${pkgdir}/usr/bin/
    install -vDm755 ${srcdir}/${pkgname}/build/1panel-agent -t ${pkgdir}/usr/bin/
    install -vDm644 ${srcdir}/1panel-agent.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm644 ${srcdir}/1panel-core.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl-agent -t ${pkgdir}/usr/bin/
    install -vDm755 ${srcdir}/1pctl-core -t ${pkgdir}/usr/bin/
    install -vDm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
