# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box64
pkgname=${_pkgname}-git
pkgver=v0.2.0.r6.g554f4889
pkgrel=1
pkgdesc='Linux Userspace x86_64 Emulator with a twist'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/ptitSeb/box64'
license=('MIT')
depends=('gcc-libs')
#optdepends=('')
makedepends=('git' 'cmake' 'python')
provides=(box64)
conflicts=(box64)
source=("git+https://github.com/ptitSeb/box64.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
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
    cd ${_pkgname}/build
    if [[ $CARCH == "aarch64" ]]; then
      make DESTDIR=${pkgdir} install
    elif [[ $CARCH == "x86_64" ]]; then
      install -Dm755 box64 -t "${pkgdir}/usr/bin/"
    elif [[ $CARCH == "riscv64" ]]; then
      make DESTDIR=${pkgdir} install
    fi

    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
    cp -R ../docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"

}
