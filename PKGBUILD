# Maintainer: AntiCompositeNumber <anticompositenumber plus aur at gmail dot com>
# Contributor: Samuel Damashek <samuel dot damashek at gmail dot com>
# Contributor: Alex Xu <alex_y_xu dot yahoo at ca>
pkgname=huggle
pkgver=3.4.12
pkgrel=1
pkgdesc="Anti-vandalism tool for use on MediaWiki-based projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine' 'yaml-cpp')
makedepends=('cmake')
conflicts=('libircclient') # A different, unrelated, libircclient
source=(
    "https://github.com/huggle/huggle3-qt-lx/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz"
    "huggle-extensions.patch"
    "huggle-desktop.patch"
)
b2sums=('876040712fd59a2efc1f5cc20af1fc9583c9fe13213a03cdc7ca2d90da3880b88c531b112693414e595398d09af1875e73d2a828b5835227a41cb0c4df90ee37'
        'e37d338085329911277cabd58108a0be5114b2c3b0469d0e3ed4bfbabda02c85315698c1ce466cb3c9bb25adb4ba208f69a134b4eb9079a2f70b8a36815f077a'
        '4fa21457d39061bbba01c2e5f5ac9d6d703b56103fac82e48cff09d94b5ca4fe9a912756dad2c7c90079e556814654730b0c18f97f93de11b25b32ac740367ff')

prepare() {
    cd "${pkgname}_${pkgver}"
    # Patch extension directory to /usr/lib/huggle/extensions (T251049)
    patch --forward --strip=1 --input="../huggle-extensions.patch"
    # Fix icon in huggle.desktop
    patch --forward --strip=1 --input="../huggle-desktop.patch"
    echo "+archlinux.${pkgrel}" >> src/huggle_core/version.txt
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

    install -Dm644 "${pkgname}_${pkgver}/src/huggle_res/Resources/huggle3_newlogo.png" "$pkgdir/usr/share/pixmaps/huggle.png"
}
