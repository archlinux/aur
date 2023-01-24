# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

_pkgname=kime
pkgname=kime-bin
pkgver=3.0.2
pkgrel=2
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
# official binary have kime-window
conflicts=('kime')
provides=('kime')
depends=('noto-fonts-cjk')
optdepends=('dbus: indicator support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'libxcb: xim support'
            'cairo: xim support')
makedepends=('cmake' 'extra-cmake-modules' 'pkg-config')
arch=('x86_64')
license=('GPL3')
source=(
    ${_pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
    ${_pkgname}-${pkgver}-bin.tar.zst::"https://github.com/Riey/kime/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.zst"
)

sha256sums=('cf7379765d5d8e0c3f03847e29d33b461e118e8691d47cc12a041a3e49eed756'
            'f39255f467d1d6de2e80de75b695f62e47c884f57c488472a255f067eea4f052')

 
build() {
    cd "${_pkgname}-${pkgver}"
    rm -rf build || true
    mkdir -pv build/out target/release
    cp ../kime_engine.h* ./src/engine/cffi
    cp ../libkime_engine.so ./target/release
    cd build
    cmake -DENABLE_GTK2=ON -DENABLE_GTK3=ON -DENABLE_GTK4=ON -DENABLE_QT5=ON -DENABLE_QT6=ON -DCMAKE_BUILD_TYPE=Release ../src
    make
    cp lib/* out
    cp -R ../../libkime_engine.so ../../kime_engine* ../../kime-xim ../../kime-wayland ../../kime-indicator ../../kime ../../kime-check ../res/* ../README* ../NOTICE.md ../LICENSE ../docs/CHANGELOG.md out
}
 
package() {
    cd "${_pkgname}-${pkgver}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
