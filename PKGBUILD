# Maintainer: Senge Dev <sengedev@gmail.com>
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.5_lts
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
_url=https://github.com/1Panel-dev/1Panel/archive/refs/tags

# Chinese user can set _use_proxy to true to speed up the build process.
# 中国大陆用户可以将 _use_proxy 设置为 true 以加速构建过程。
_use_proxy=false
if ${_use_proxy}; then
    _url="https://hub.gitmirror.com/${_url}"
fi
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs' 'npm' 'python')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"${_url}/v${pkgver//_/-}.tar.gz"
    "1pctl"
    "1panel.service"
)
b2sums=(
    "7b3fd900358d928f698a01aad77bffbd1fcadd1fe28b0fb1a34266c79346bad1937a76c8a7a87765f7a241b6b329bd56542b8dc74371a6faab627942d2060759"
    "649000d79fd931b881a5afac1f8d1b0d6d14f87a082ae14bb6e765bb76c71fc8bdc9718d2975e62f071702b04b51760f6741db9225fdf428db4742cee4a7b01d"
    "2fd0b19f6e5496e31bbb22997ab6ed5876b3034551a8a3b9f32b78af22e2587b5b022787e1035c918e8b99e7b5a28ffaf965403146e80bb4efb6297a32226059"
)

prepare() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1pctl
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +
}

build() {
    cd ${srcdir}/1Panel-${pkgver//_/-}/frontend
    if ${_use_proxy}; then
        npm config set registry https://registry.npmmirror.com/
        go env -w GOPROXY=https://goproxy.cn,direct
    fi
    unset ${_use_proxy}

    npm install
    npm rum build:pro
    cd ${srcdir}/1Panel-${pkgver//_/-}/backend
    GOOS=linux GOARCH=$(go env GOARCH) go build -trimpath -ldflags '-s -w' -o ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${srcdir}/1Panel-${pkgver//_/-}/cmd/server/main.go
}

package() {
    install -vDm755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
}
