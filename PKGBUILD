# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-bin
pkgver=2.3.1
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
md5sums=('ba0e68714f2ebdd0353b8f8c2905da95'
         '699b44040d7a8aebc29741fd33528707')
 
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
    cp -R ../../libkime_engine.so ../../kime_engine* ../../kime-xim ../../kime-wayland ../../kime-indicator ../../kime-check ../../icons ../../*.desktop ../../default_config.yaml out
}
 
package() {
    cd "kime-${pkgver}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
