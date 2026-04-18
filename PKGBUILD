# Maintainer: Derrity <derrity0731@proton.me>
pkgname=tinyserve
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal multi-worker HTTP server built on libuv (static files + reverse proxy)"
arch=('x86_64' 'aarch64')
url="https://github.com/Derrity/TinyServe"
license=('MIT')
depends=('libuv')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Derrity/TinyServe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a7ead0dc497f888311170dcf6a00cd67f6cf3623aeae85e2a5c34c5135e14f58')

build() {
    cd "TinyServe-${pkgver}"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -Wno-dev
    cmake --build build -j"$(nproc)"
}

check() {
    cd "TinyServe-${pkgver}/build"
    ctest --output-on-failure
}

package() {
    cd "TinyServe-${pkgver}"
    install -Dm755 build/tinyserve     "${pkgdir}/usr/bin/tinyserve"
    install -Dm644 man/tinyserve.1     "${pkgdir}/usr/share/man/man1/tinyserve.1"
    install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md           "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_CN.md        "${pkgdir}/usr/share/doc/${pkgname}/README_CN.md"
    install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    # systemd unit (reuse the Debian one — same hardening sandbox)
    install -Dm644 debian/tinyserve.service \
        "${pkgdir}/usr/lib/systemd/system/tinyserve.service"
}
