# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>

pkgname='goldendict'
pkgver=1.5.0
pkgrel=3
epoch=1
pkgdesc='Feature-rich dictionary lookup program supporting multiple dictionary formats'
arch=('i686' 'x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL3')
depends=(
    'bzip2'
    'ffmpeg'
    'gcc-libs'
    'glibc'
    'hunspell'
    'libao'
    'libeb'
    'libtiff'
    'libvorbis'
    'libx11'
    'libxtst'
    'lzo'
    'opencc'
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'qt5-tools'
    'qt5-webkit'
    'qt5-x11extras'
    'xz'
    'zlib'
    'zstd'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f9f8e068ece74cc026fdc5f56615246228b4e70c97c7197ccd4c14ceae412c7c')


prepare() {
    cd "${pkgname}-${pkgver}"
    echo "Fixing QMake in goldendict.pro file..."
    echo "QMAKE_CXXFLAGS_RELEASE = ${CFLAGS}" >> goldendict.pro
    echo "QMAKE_CFLAGS_RELEASE = ${CXXFLAGS}" >> goldendict.pro
    sed -i '/VERSION/ s/+git//' goldendict.pro
}

build(){
    cd "${pkgname}-${pkgver}"
    qmake-qt5 \
        'CONFIG+=chinese_conversion_support' \
        'CONFIG+=zim_support' \
        PREFIX='/usr' \
        goldendict.pro
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
