# Maintainer: Voxan24 <admin@hessfr.fr>

pkgname=1panel
pkgver=2.0.14
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.pro"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs' 'npm' 'python')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"https://github.com/1Panel-dev/1Panel/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "1pctl"
    "1panel.service"
)
b2sums=(
    "ed6f04a3d58a60590b47fd21dbd04a3d95e7380764afaa4ced0b41b5e62dbc6956c188f463c50792b833aec25447c75fa038771ca04078a682b9b2deffe25101"
    "8276ffae854ad7ae4d6ca35bd673b2401dd8e59bff8515921f76fc83a65db672d2de9167ccd32d5b4bb2b5cc4a646f5047c04baf295050dd64fd1370c490680e"
    "b4ca01c4f5027fc121e293df86e9caeaabce732f5d93ea4f0c6b670aceb851943d1f32d11e76f1b1a5780774d35d3b04c1abb9c84d2b0695d04d9938c8771845"
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
    cd ${srcdir}/1Panel-${pkgver//_/-}/core
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${srcdir}/1Panel-${pkgver//_/-}/cmd/server/main.go
}

package() {
    install -vDm 755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm 644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm 755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
    install -vdm 644 ${pkgdir}/var/lib/1p/1panel
}
