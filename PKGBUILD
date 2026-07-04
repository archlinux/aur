# Maintainer: Ripose <ripose@protonmail.com>
pkgname=memento
pkgver=2.0.2
pkgrel=0
pkgdesc="An mpv-based video player for studying Japanese."
arch=('x86_64' 'aarch64')
url="https://ripose-jp.github.io/Memento/"
license=('GPL2')
depends=(
    'json-c'
    'libzip'
    'mecab-git'
    'mecab-ipadic'
    'mpv'
    'qcoro'
    'qt6-base'
    'qt6-svg'
    'sqlite'
)
makedepends=(
    'cmake'
    'gcc'
    'git'
    'make'
    'qt6-tools'
)
optdepends=(
    'yt-dlp: streaming support'
    'noto-fonts-cjk: optimal font support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ripose-jp/Memento/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08fd8f0e16398c335960a4a3f7e7f9ce35f6b246f92b4f59f3b537f0f366d127')

prepare() {
    mkdir -p ${srcdir}/build
}

build() {
    cd ${srcdir}/build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DMEMENTO_RELEASE_BUILD=ON \
          -DMEMENTO_QAPPLICATION=ON \
          -DMEMENTO_SYSTEM_QCORO=ON \
          -DMEMENTO_MECAB_SUPPORT=ON \
          "${srcdir}/Memento-${pkgver}"
    cmake --build . -j $(grep -c ^processor /proc/cpuinfo)
}

package() {
    cd ${srcdir}/build
    make install
}
