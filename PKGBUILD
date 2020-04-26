# Maintainer: AntiCompositeNumber <anticompositenumber plus aur at gmail dot com>
# Contributor: Samuel Damashek <samuel dot damashek at gmail dot com>
# Contributor: Alex Xu <alex_y_xu dot yahoo at ca>
pkgname=huggle
pkgver=3.4.10
pkgrel=1
pkgdesc="Anti-vandalism tool for use on MediaWiki-based projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine' 'yaml-cpp')
makedepends=('cmake') 
source=(
    "https://github.com/huggle/huggle3-qt-lx/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz"
    "huggle-yaml.patch"
    "huggle-extensions.patch"
)
sha256sums=('7dbf2c943f80eac551839535df68d1af4c19d52a026a9140a1b2fcf63f5a2249'
            'e66bb7ba73b72b08d478715d44baf096c87291e05997ad4786c1515b6574f2bb'
            '823cbf583c00722bfe5ecd74a57ee7e3ef942ecb95a1704e65c226e7a2624497')

prepare() {
    cd "${pkgname}_${pkgver}"
    # Patch extension directory to /usr/lib/huggle/extensions (T251049)
    patch --forward --strip=1 --input="../huggle-extensions.patch"
    # Backport dependency fix from master, remove in 3.4.11
    patch --forward --strip=1 --input="../huggle-yaml.patch"
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build \
        -S "${pkgname}_${pkgver}/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DATA_DIR="lib/huggle" \
        -DQT5_BUILD=ON \
        -DWEB_ENGINE=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DHUGGLE_EXT=TRUE \
        -Wno-dev \

    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
