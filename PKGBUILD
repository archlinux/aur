# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=scrcpy
pkgver=1.0
pkgrel=4
pkgdesc='Display and control your Android device'
arch=('i686' 'x86_64')
url='https://github.com/Genymobile/scrcpy'
license=('Apache')
depends=('ffmpeg' 'sdl2')
makedepends=('gcc' 'meson')
optdepends=('android-sdk-platform-tools: required if adb is not already installed')
source=("https://github.com/Genymobile/scrcpy/archive/v${pkgver}.tar.gz"
        "scrcpy-server.jar::https://github.com/Genymobile/scrcpy/releases/download/v1.0/scrcpy-server-v${pkgver}.jar")
sha256sums=('fda84b2fc6a60bf808f7b87f7c9a985a446bad69d4de8e63e9ce699871f8026f'
            'b573b06a6072476b85b6308e3ad189f2665ad5be4f8ca3a6b9ec81d64df20558')


build() {
    cd scrcpy-${pkgver}
    rm -rf build
    meson build --buildtype release --strip -Db_lto=true \
        -Dbuild_server=false \
        -Doverride_server_path=/usr/share/scrcpy/scrcpy-server.jar
    cd build
    ninja
}

package() {
    mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/scrcpy
    install -m 755 scrcpy-${pkgver}/build/app/scrcpy "${pkgdir}"/usr/bin/
    install -m 755 scrcpy-server.jar "${pkgdir}"/usr/share/scrcpy/
}
