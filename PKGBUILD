# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Dan Johansen <strit@manjaro.org>

pkgname=box64
pkgver=0.1.4
pkgrel=1
pkgdesc='Linux Userspace x86_64 Emulator with a twist'
arch=('x86_64' 'aarch64')
url='https://github.com/ptitSeb/box64'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9b1428d2c5d542633f530b1ef24277fef5c4bc8fd00686c9b445f0a7664c16c7')

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
    fi
    make -C build
}

package() {
    cd ${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install
    if [[ $CARCH == "aarch64" ]]; then
      make DESTDIR=${pkgdir} install
    elif [[ $CARCH == "x86_64" ]]; then
      install -Dm755 box64 -t "${pkgdir}/usr/bin/"
    fi

    # Install documentation (not yet in 0.1.2, but will be there for next release)
    #install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
    #cp -R ../docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"
}
