# Maintainer: Stefan Schmidt <thrimbor gmail com>

pkgname=hurrican
pkgver=1.0.9.3
pkgrel=1
pkgdesc="Freeware jump and shoot game created by Poke53280"
arch=('i686' 'x86_64')
url="https://github.com/thrimbor/Hurrican.git"
license=('custom: MIT')
depends=('sdl_image' 'sdl_mixer' 'libmodplug' 'libgl' 'libepoxy')
makedepends=('git' 'mesa' 'cmake')
conflicts=('hurrican-svn')
source=(hurrican::"git+https://github.com/thrimbor/hurrican.git"
        glm::"git+https://github.com/g-truc/glm.git"
        hurrican.desktop
        hurrican.png)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}"/hurrican
    git checkout "v${pkgver}"
    git submodule init
    git config submodule.Hurrican/3rdparty/glm.url "${srcdir}"/glm
    git submodule update
}

build() {
    mkdir -p "${srcdir}/hurrican/Hurrican/build"
    cd "${srcdir}/hurrican/Hurrican/build"
    cmake ../ -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make
}

package() {
    pushd "${srcdir}/hurrican/Hurrican/build"
    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir"/usr/share/hurrican/data/textures/pvr
    popd

    # .deskop integration
    install -Dm0644 hurrican.desktop "$pkgdir"/usr/share/applications/hurrican.desktop
    install -Dm0644 hurrican.png "$pkgdir"/usr/share/pixmaps/hurrican.png

    cd "${srcdir}/hurrican"
    install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.txt
    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
    ln -s /usr/share/doc/hurrican/README.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
