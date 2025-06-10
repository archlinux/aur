# Maintainer: Senge Dev <sengedev at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-git
pkgver=1.10.29.lts.r27.g708499a
pkgrel=1
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
    "1pctl"
    "1panel.service"
)
sha256sums=('SKIP'
    'b10ccbfe7055854185cb2cbcaff60774bfd6105e90780ffd0a3a5a2980c5696d'
    '4763d661d985228b99b9be12ef8140c63c14e6cf40a07411db8e32d9a73cae42')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=${pkgver}#g" ${srcdir}/1pctl
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +

    # Edit the source code using sed
    sed -i 's/当前已经是最新版本/当前版本为 AUR 版本，如需更新，请使用 AUR 更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/zh.ts
    sed -i 's/當前已經是最新版本/當前版本為 AUR 版本，如需更新，請使用 AUR 更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/tw.ts
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
    npm audit fix --force
    npm rum build:pro
    cd ${srcdir}/${pkgname}/backend
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/${pkgname}//build/1panel ${srcdir}/${pkgname}/cmd/server/main.go
}

package() {
    install -vd ${pkgdir}/var/lib/1p/1panel
    install -vDm755 ${srcdir}/${pkgname}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
    install -vDm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
