# Maintainer: Hamza Gbada <hamza dot gbada at example dot com>

pkgname=docker-model-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Docker CLI plugin for running AI models (prebuilt binary)"
arch=('x86_64')
url="https://www.docker.com/"
license=('Apache-2.0')
depends=('docker')
makedepends=('docker')
provides=('docker-model')
conflicts=('docker-model')

# No source, binary will be pulled from Docker image
source=()
sha256sums=()

build() {
    echo "Pulling docker-model image..."
    docker pull docker/docker-model-cli-desktop-module:v${pkgver}

    echo "Extracting docker-model binary..."
    cid=$(docker create docker/docker-model-cli-desktop-module:v${pkgver} nop)
    docker export "$cid" | tar -xOf - cli-plugins/model/linux/docker-model > docker-model
    docker rm "$cid"
}

package() {
    install -Dm755 "$srcdir/docker-model" "$pkgdir/usr/lib/docker/cli-plugins/docker-model"
    install -Dm644 "${srcdir%/src}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


