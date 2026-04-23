# Maintainer: Rchips22 <rchips22@outlook.com> 
# Contributor: Voxan24 <admin@hessfr.fr>
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=2.1.10
pkgrel=0
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://github.com/1Panel-dev/1Panel"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs' 'npm' 'python')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"https://github.com/1Panel-dev/1Panel/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "https://github.com/1Panel-dev/installer/raw/v2/1pctl"
    "https://github.com/1Panel-dev/installer/raw/v2/initscript/1panel-core.service"
    "https://github.com/1Panel-dev/installer/raw/v2/initscript/1panel-agent.service"
    "1panel.conf"
)
b2sums=(
    "b51e012f5a15c02294ac7929577299b54d8ef4101537d645c9717728af1f69b074ee2489e15f60b4e91eb7159448be45b1133fdd77f712847bbc140f5f4ccfc3"
    "SKIP"
    "SKIP"
    "SKIP"
    "47e36073d92f3fb590d5e648ee9e2b71d575744f7cca223bb0d523e1745faa2d715b77ede14fb26905dc2f7278a9be523e50c7cbd89ab7b87958fa51ae585dd9"
)

prepare() {
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +
    # Seprate the config and the 1pctl,make 1pctl's update possible,
    # This is a stupid workaround against upstream's stupid installation mode.
    # if it failed,remove it,and change 1pctl like this
    # BASE_DIR=/var/lib/1p
    # ORIGINAL_PORT=8888
    # ORIGINAL_VERSION=v{pkgver}
    find ${srcdir} -type f -exec sed -i 's@/usr/bin/1pctl@/etc/1panel.conf@g' {} +
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1panel.conf
}

build() {
    # 1panel backend is too big to build
    export NODE_OPTIONS="--max-old-space-size=4096"
    
    cd ${srcdir}/1Panel-${pkgver//_/-}/frontend
    npm install
    npm run build:pro
    cd "${srcdir}/1Panel-${pkgver}/core"
    CGO_ENABLED=0 GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o "${srcdir}/1Panel-${pkgver}/build/1panel-core" "${srcdir}/1Panel-${pkgver}/core/cmd/server/main.go"
    cd "${srcdir}/1Panel-${pkgver}/agent"
    CGO_ENABLED=0 GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o "${srcdir}/1Panel-${pkgver}/build/1panel-agent" "${srcdir}/1Panel-${pkgver}/agent/cmd/server/main.go"
}

package() {
    install -vDm755 "${srcdir}/1Panel-${pkgver}/build/1panel-core" -t "${pkgdir}/usr/bin/"
    # 创建软链接：/usr/bin/1panel → /usr/bin/1panel-core
    ln -s "/usr/bin/1panel-core" "${pkgdir}/usr/bin/1panel"
    install -vDm755 "${srcdir}/1Panel-${pkgver}/build/1panel-agent" -t "${pkgdir}/usr/bin/"
    install -vDm755 "${srcdir}/1pctl" "${pkgdir}/usr/bin/1pctl"

    install -vDm644 "${srcdir}/1panel-agent.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${srcdir}/1panel-core.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${srcdir}/1panel.conf" "${pkgdir}/etc/1panel.conf"
    install -vDm644 "${srcdir}/1Panel-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
