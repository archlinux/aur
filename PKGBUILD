# Maintainer: Janghyub Seo <jhyub06 at gmail dot com>
pkgname=zoom-libkime
pkgver=2.5.5
pkgrel=1
pkgdesc="Kime library for zoom which embeds qt itself"
arch=('x86_64')
url="https://github.com/Riey/kime"
license=('GPL3')
depends=('kime' 'zoom')
makedepends=('docker')
source=(
    kime-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
)
md5sums=('dea5c3079478d5ec33f272b372751a88')

build() {
    cd "kime-${pkgver}"
    docker rm kime
    docker build --file build-docker/ubuntu-20.04/Dockerfile --tag kime-build:git .
    docker run --name kime kime-build:git
}

package() {
    cd "kime-${pkgver}"
    docker cp kime:/opt/kime/build/out/libkime-qt5.so libkimeplatforminputcontextplugin.so
    install -Dm755 libkimeplatforminputcontextplugin.so -t "${pkgdir}/opt/zoom/platforminputcontexts"
}
