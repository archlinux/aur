# Maintainer: Scientress <arch@scientress.de>
# Previous Maintainer: oscarcl <oscar.cowderylack@gmail.com>
_pkgname=casparcg-server
pkgname=('casparcg-server' 'casparcg-server-headless')
pkgver=2.5.1
_pkgver=$pkgver-stable
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
depends=(cef ffmpeg boost-libs libgl glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix git)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/CasparCG/server/archive/v${_pkgver}.tar.gz"
        "archlinux-cef.patch"
        "casparcg-server.service"
        "casparcg.sysusers"
        "casparcg.tmpfiles")

sha256sums=('c2852873153569f5df3089dfc1aeb20e9ba62dae182436ad7691a79cce5baf78'
            'e34e0bbeb6db378b1e074948c4fe62030b1e925a4398ac6a468209d58b54a450'
            'a2b071eab6df874d6386e7ae0d1bf0f82e6af5b1645cc009146c6eb2e1fa9fff'
            'b33b6b6ead820ae17460d660b7d6953e483012cbfe0b9614ee04ffe396d3515c'
            'aeebd9644b5198d085b18b1ddbd907a27cda6f78abfb428f379d53e78de5d73a')

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

    export CFLAGS="${CFLAGS} -fmacro-prefix-map=${srcdir}/${_pkgname}=."
    export CXXFLAGS="${CXXFLAGS} -fmacro-prefix-map=${srcdir}/${_pkgname}=."

    cmake -B build -S "server-${_pkgver}/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DUSE_SYSTEM_CEF=ON \
        -DUSE_STATIC_BOOST=OFF \
        -DDIAG_FONT_PATH="/usr/share/fonts/liberation/LiberationMono-Regular.ttf" \
        -DCASPARCG_BINARY_NAME=${_pkgname} \
        -G Ninja

    ninja -C build
}

package_casparcg-server() {
    conflicts=(cef-minimal)
    optdepends=(
        'casparcg-server-headless: Run casparcg as a system service'
    )

    cd "${srcdir}"
    ninja -C build install
    install -dm755 "${pkgdir}/opt/casparcg/"
}

package_casparcg-server-headless() {
    depends=(casparcg-server)

    cd "${srcdir}"
    install -Dm644 casparcg-server.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 casparcg.sysusers "${pkgdir}/usr/lib/sysusers.d/casparcg.conf"
    install -Dm644 casparcg.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/casparcg.conf"
}
