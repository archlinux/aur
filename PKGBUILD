# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube-sdl2
pkgver=0.6.0
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/CaveCube"
license=(Boost)
depends=(glibc sdl2)
makedepends=(make glibc sdl2)
provides=(cavecube)
conflicts=(cavecube cavecube-bin cavecube-sdl2-bin)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/CaveCube/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/CaveCube-${pkgver}/"
    make USESDL2=y NATIVE=y -j$(nproc)
}

check() {
    cd "${srcdir}/CaveCube-${pkgver}/"
    [ -f ./cavecube ]
}

package() {
    cd "${srcdir}/CaveCube-${pkgver}/"
    find cavecube extras/ resources/ -not -path "extras/icon/*" -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/CaveCube/{}" \;
    cd extras/icon/
    find hicolor/ -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/icons/{}" \;
    cd ../../
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/CaveCube/cavecube" "${pkgdir}/usr/bin/cavecube"
    mkdir -p "${pkgdir}/usr/share/applications/"
    ln -sf "/opt/CaveCube/extras/cavecube.desktop" "${pkgdir}/usr/share/applications/cavecube.desktop"
}
