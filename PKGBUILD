# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Dan Johansen <strit@manjaro.org>

pkgname=box64
pkgver=0.2.0
pkgrel=2
pkgdesc='Linux Userspace x86_64 Emulator with a twist'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/ptitSeb/box64'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fd4440a8010320339c9c6c065f6a65fdb802d32cf8fa5f6fa750f368d4864b62')

build() {
    cd ${pkgname}-${pkgver}
    if [[ $CARCH == "aarch64" ]]; then 
        cmake -B build -S . \
              -DARM_DYNAREC=ON \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    elif [[ $CARCH == "x86_64" ]]; then
        cmake -B build -S . \
              -DLD80BITS=1 -DNOALIGN=1 \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    elif [[ $CARCH == "riscv64" ]]; then
        cmake -B build -S . \
              -DRV64=1 \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    fi
    make -C build
}

package() {
    cd ${pkgname}-${pkgver}/build
    if [[ $CARCH == "aarch64" ]]; then
      make DESTDIR=${pkgdir} install
    elif [[ $CARCH == "x86_64" ]]; then
      install -Dm755 box64 -t "${pkgdir}/usr/bin/"
    elif [[ $CARCH == "riscv64" ]]; then
      make DESTDIR=${pkgdir} install
    fi

    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R ../docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
