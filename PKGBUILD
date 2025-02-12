# Maintainer: Rchips22 <rchips22@outlook.com> 
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.24_lts
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
)
b2sums=(
    "2fa60f20947e45c025cb2a03fb21b3160df919594aaae279fc6c777ced104ba7b96a4fd83caa07967dae5565340c885505bb679655e678546d36b078fc8613df"
    "fab29150d66ecd8b15df155b2b8d463751c18fad9deb89879f97527fd0e35cbc88cb92f3e10984fcfe1e9c56f5f64d620b795cabc4d9e705117b8a3196e7182b"
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
    cd ${srcdir}/1Panel-${pkgver//_/-}/backend
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${srcdir}/1Panel-${pkgver//_/-}/cmd/server/main.go
}

package() {
    install -vDm 755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm 644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm 755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
    install -vdm 644 ${pkgdir}/var/lib/1p/1panel
}
