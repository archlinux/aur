# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box86
pkgname=${_pkgname}-git
pkgver=v0.2.2.r258.g46114235
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
#optdepends=('')
makedepends=('git' 'cmake')
provides=(box86)
conflicts=(box86)
source=("git+https://github.com/ptitSeb/box86.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    cmake -B build -S . \
          -DARM_DYNAREC=ON \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd ${_pkgname}/build
    make DESTDIR=${pkgdir} install
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
    cp -R ../docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"

    find "${pkgdir}"/usr/share/doc/${_pkgname} -type f -exec chmod 0644 {} \;
    find "${pkgdir}"/usr/share/doc/${_pkgname} -type d -exec chmod 0755 {} \;
}

