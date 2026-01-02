# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box64
pkgname=${_pkgname}-git
pkgver=0.3.8.r458.g0254fbdd8
pkgrel=1
pkgdesc='Linux Userspace x86_64 Emulator with a twist'
arch=('x86_64' 'aarch64' 'riscv64' 'powerpc64le')
url='https://github.com/ptitSeb/box64'
license=('MIT')
install="box64-git.install"
depends=('gcc-libs')
#optdepends=('')
makedepends=('git' 'cmake' 'python')
provides=(box64)
conflicts=(box64)
options=('!strip')
source=("git+https://github.com/ptitSeb/box64.git#branch=main"
        "box64-git.install")
sha256sums=('SKIP'
            '7e94518dbd11121f150a51b64f4c0ec11f844a83f7b15205d28c1de63de699f2')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    if [[ $CARCH == "aarch64" ]]; then
        if [ -n "$(echo $name | grep RK3588)" ]; then
              exargs="-DRK3588=1"
        elif [ -n "$(echo $name | grep RK3399)" ]; then
              exargs="-DRK3399=1"
        elif [ -n "$(echo $name | grep 'Cortex-A53')" ]; then
              exargs="-DRPI3ARM64=1"
        elif [ -n "$(echo $name | grep 'Cortex-A72')" ]; then
              exargs="-DRPI4ARM64=1"
        elif [ -n "$(echo $name | grep 'Cortex-A76')" ]; then
              exargs="-DRPI5ARM64=1"
        fi
        cmake -B build -S . \
              -DBOX32=ON \
              -DBOX32_BINFMT=ON \
              -DARM_DYNAREC=ON \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    elif [[ $CARCH == "x86_64" ]]; then
        cmake -B build -S . \
              -DBOX32=ON \
              -DBOX32_BINFMT=ON \
              -DLD80BITS=1 -DNOALIGN=1 \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    elif [[ $CARCH == "powerpc64le" ]]; then
        cmake -B build -S . \
              -DBOX32=ON \
              -DBOX32_BINFMT=ON \
              -DPPC64LE=1 \
              -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr
    elif [[ $CARCH == "riscv64" ]]; then
        cmake -B build -S . \
              -DBOX32=ON \
              -DBOX32_BINFMT=ON \
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
    elif [[ $CARCH == "powerpc64le" ]]; then
      make DESTDIR=${pkgdir} install
    elif [[ $CARCH == "riscv64" ]]; then
      make DESTDIR=${pkgdir} install
    fi

    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
    cp -R ../docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"

}
