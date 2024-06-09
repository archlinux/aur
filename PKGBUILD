# Maintainer: Senge Dev <sengedev@gmail.com>
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.10_lts
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
    "5b1b589f2fadc6d132aa0a780ad7933d9a82ec9b9ebf944b5e9f3843aedbc02130087bd833c02bd60eebdfe636fe392e0b9a78ea05aded13301247c5455efcb7"
    "921627e26e99a5145b7496aba7fdef21df49adae493875cdce9a4256f36a9359746dc9e347228734ab12ba826d5baacb55bf134a2321e4afe174f20ccb3d26c0"
    "2fd0b19f6e5496e31bbb22997ab6ed5876b3034551a8a3b9f32b78af22e2587b5b022787e1035c918e8b99e7b5a28ffaf965403146e80bb4efb6297a32226059"
)

prepare() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1pctl
    find ${srcdir} -type f -exec sed -i 's@/usr/local/bin@/usr/bin@g' {} +
    find ${srcdir} -type f -exec sed -i 's@/etc/systemd/system@/usr/lib/systemd/system@g' {} +
}

build() {
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
