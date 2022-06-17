# Maintainer: AtticFinder65536 <atticventilation-aur@protonmail.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase=dav1d-git
pkgname=(dav1d-git dav1d-doc-git)
pkgver=1.0.0.r12.gffb5968
pkgrel=2
pkgdesc='AV1 cross-platform decoder focused on speed and correctness'
url='https://code.videolan.org/videolan/dav1d'
arch=('x86_64' 'armv7h' 'aarch64')
license=('BSD')
makedepends=('git' 'meson' 'ninja' 'nasm' 'doxygen' 'graphviz' 'xxhash' 'sdl2' 'vulkan-headers' 'libplacebo')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd dav1d
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd dav1d
    arch-meson build \
        -Denable_examples=true \
        -Denable_docs=true \
        -Denable_tests=false
    ninja -C build all doc/html
}

package_dav1d-git() {
    depends=('glibc')
    optdepends=('dav1d-doc-git: HTML documentation'
                'libplacebo: for the dav1dplay example'
                'sdl2: for the dav1dplay example')
    provides=("${pkgname%-git}=${pkgver}" 'libdav1d.so')
    conflicts=("${pkgname%-git}")

    cd dav1d
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm 644 README.md CONTRIBUTING.md NEWS -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_dav1d-doc-git() {
    pkgdesc+=" (documentation)"
    arch=('any')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    cd dav1d
    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -r build/doc/html -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
