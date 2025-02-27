# Maintainer: Rchips22 <rchips22@outlook.com> 
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.26_lts
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs' 'npm' 'python')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"https://github.com/1Panel-dev/1Panel/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "1pctl"
    "1panel.service"
    "app.yaml"
)
b2sums=(
    "9299b7d431c9b727ef3ad4781d7cd73e5b8324a04dccb0312f3cc901bb4ed002367914cb090287104da754886756532e90de7e8ea0b3aca08702bb0bc9d2b40b"
    "2084e541619af619551fc938fb9c2872950bb18166fe2c474bfcfe9b11cd71d7777abce3965f1ed07d51b548f4902943fb212491ce15918b4cdfcc2336638069"
    "b4ca01c4f5027fc121e293df86e9caeaabce732f5d93ea4f0c6b670aceb851943d1f32d11e76f1b1a5780774d35d3b04c1abb9c84d2b0695d04d9938c8771845"
    "a0d3d912d95c7fb1b467f8d8895e2b589bc0b5dfa63e265c79ab692ad6afe6f9b9694f5a1bb09308d6451f463848b749f66b4c68c4d5b161906bc05aa14c80dc"
)

prepare() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1pctl
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +
}

build() {
    # 1panel backend is too big to build
    export NODE_OPTIONS="--max-old-space-size=4096"
    
    cd ${srcdir}/1Panel-${pkgver//_/-}/frontend
    npm install
    npm rum build:pro
    cd ${srcdir}/1Panel-${pkgver//_/-}/backend
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${srcdir}/1Panel-${pkgver//_/-}/cmd/server/main.go
}

package() {
    install -vDm 755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm 644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm 755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
    install -vdm 644 ${pkgdir}/var/lib/1p/1panel
    install -vDm 644 ${srcdir}/app.yaml ${pkgdir}/opt/1panel/conf/app.yaml
}
