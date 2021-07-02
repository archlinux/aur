# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-bin
pkgver=2.5.5
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
# official binary have kime-window
conflicts=('kime')
provides=('kime')
optdepends=('dbus: indicator support'
            'gtk2: gtk2 support'
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
    ${pkgname}-${pkgver}.tar.gz::"https://github.com/Riey/kime/archive/refs/tags/v${pkgver}.tar.gz"
    ${pkgname}-${pkgver}-bin.tar.zst::"https://github.com/Riey/kime/releases/download/v${pkgver}/kime-v${pkgver}.tar.zst"
)
md5sums=('dea5c3079478d5ec33f272b372751a88'
         'a246bcbb2e93af0c41e6fae29a1298e4')
 
build() {
    cd "kime-${pkgver}"
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
    cd "kime-${pkgver}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
