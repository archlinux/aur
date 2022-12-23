# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on hurrican-svn PKGBUILD by carstene1ns <arch carsten-teibes de>
# an on Hurrican PKGBUILD by Stefan Schmidt <thrimbor gmail com>

pkgname=hurrican-git
pkgver=1.0.9.3.r318.g2a92579
pkgrel=2
pkgdesc="Freeware jump and shoot game based on the Turrican game series (development version)"
arch=('i686' 'x86_64')
url="http://hurrican.sourceforge.net"
license=('custom: MIT')
depends=('sdl2_image' 'sdl2_mixer' 'libepoxy')
makedepends=('git' 'mesa' 'cmake')
conflicts=('hurrican')
source=(hurrican::"git+https://github.com/thrimbor/hurrican.git"
        hurrican.desktop
        hurrican.png)
sha256sums=('SKIP'
            '11f6a06115d543b9dfb74781c4db79224fceec2f6c0ceecd9c2cd15081d96174'
            'be6b84adf5bd89430f2e087d9fe51e9e769cf1a17fb89f4288e8d4551ecf0b84')
            
pkgver() {
  cd hurrican
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}
prepare() {
    cd "${srcdir}"/hurrican
    git submodule init
    #git config submodule.Hurrican/3rdparty/glm.url "${srcdir}"/glm
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
