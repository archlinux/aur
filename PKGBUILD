# Maintainer: Scientress <arch@scientress.de>
# Previous Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.5.1
_pkgver=$pkgver-stable
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
depends=(cef ffmpeg boost-libs libgl glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CasparCG/server/archive/v${_pkgver}.tar.gz"
        "archlinux-cef.patch")

sha256sums=('c2852873153569f5df3089dfc1aeb20e9ba62dae182436ad7691a79cce5baf78'
            'e34e0bbeb6db378b1e074948c4fe62030b1e925a4398ac6a468209d58b54a450')

prepare() {
    cd "${srcdir}/server-${_pkgver}"

    for p in ../*.patch; do
        echo "Applying patch: $(basename "${p}")"
        patch --forward --strip=1 --input "$p"
    done

    dos2unix src/shell/casparcg.config
}

build() {
    cd "${srcdir}"

    export CFLAGS="${CFLAGS} -fmacro-prefix-map=${srcdir}/${pkgname}=."
    export CXXFLAGS="${CXXFLAGS} -fmacro-prefix-map=${srcdir}/${pkgname}=."

    cmake -B build -S "server-${_pkgver}/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DUSE_SYSTEM_CEF=ON \
        -DUSE_STATIC_BOOST=OFF \
        -DDIAG_FONT_PATH="/usr/share/fonts/liberation/LiberationMono-Regular.ttf" \
        -DCASPARCG_BINARY_NAME=${pkgname} \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}"
    ninja -C build install
    install -dm755 "${pkgdir}/opt/casparcg/"
}
