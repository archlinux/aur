# Maintainer: AntiCompositeNumber <anticompositenumber plus aur at gmail dot com>
# Contributor: Samuel Damashek <samuel dot damashek at gmail dot com>
# Contributor: Alex Xu <alex_y_xu dot yahoo at ca>
pkgname=huggle
pkgver=3.4.13
pkgrel=2
pkgdesc="Anti-vandalism tool for use on MediaWiki-based projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL-3.0-or-later')
depends=('qt5-multimedia' 'qt5-webengine' 'yaml-cpp')
makedepends=('cmake')
conflicts=('libircclient') # A different, unrelated, libircclient
source=(
    "https://github.com/huggle/huggle3-qt-lx/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz"
    "huggle-extensions.patch"
    "huggle-desktop.patch"
)
b2sums=('af92d575a50bf93d876aaf5409058428e40a98a643f1ce3f6e079df03d05b7698f4711c7072a8ac877ef9601b228d2dbf15e46952f6c4145736995fd3fcdd090'
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
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-dev \

    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install

    install -Dm644 "${pkgname}_${pkgver}/src/huggle_res/Resources/huggle3_newlogo.png" "$pkgdir/usr/share/pixmaps/huggle.png"
}
