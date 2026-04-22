# Maintainer: Hamza Gbada <hamza.gbada@gmail.com>

pkgname=docker-model-bin
pkgver=1.1.37
pkgrel=1
pkgdesc="Docker CLI plugin for running AI models (prebuilt binary; deprecated, use 'docker-model' source package instead)"
optdepends=('docker-model: source-built alternative (recommended)')
arch=('x86_64')
url="https://www.docker.com/"
license=('Apache-2.0')
depends=('docker')
makedepends=('docker')
provides=('docker-model')
conflicts=('docker-model')

# no source — binary pulled from Docker image
source=()
sha256sums=()

build() {
    echo "Pulling docker-model image v${pkgver}..."
    docker pull docker/docker-model-cli-desktop-module:v${pkgver}

    echo "Extracting docker-model binary..."
    cid=$(docker create docker/docker-model-cli-desktop-module:v${pkgver} nop)
    docker export "$cid" | tar -xOf - cli-plugins/model/linux/docker-model > docker-model
    docker rm "$cid"
}

package() {
    install -Dm755 "$srcdir/docker-model" "$pkgdir/usr/lib/docker/cli-plugins/docker-model"

    # Optional: include license
    install -Dm644 "${srcdir%/src}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
