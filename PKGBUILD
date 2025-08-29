# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

_pkgname=kime
pkgname=kime-bin
pkgver=3.1.1
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

sha256sums=('d401170d822b5d5ebae683a2651273f2b73cdd2f75c8ff3b6c747a846f02961b'
            '42d9a1a8557a604b591dcab7626456682c84a2adb00cd0ed4d02016ac28888de')

 
build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTFLAGS="-L ${srcdir}/${pkgname}-${pkgver}/target/release ${RUSTFLAGS}"
    # https://github.com/Riey/kime/issues/701#issuecomment-2944494908
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
