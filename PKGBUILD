# Maintainer: Scientress <arch@scientress.de>
# Previous Maintainer: oscarcl <oscar.cowderylack@gmail.com>
_pkgname="casparcg-server"
pkgname=('casparcg-server-git' 'casparcg-server-headless-git')
pkgver=r4173.8c7383783
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
depends=(cef ffmpeg boost-libs libgl glew tbb openal sfml libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("${_pkgname}::git+https://github.com/CasparCG/server.git"
        "archlinux-cef.patch"
        "casparcg-server.service"
        "casparcg.sysusers"
        "casparcg.tmpfiles")
sha256sums=('SKIP'
            'e34e0bbeb6db378b1e074948c4fe62030b1e925a4398ac6a468209d58b54a450'
            '83232196dc20d51cae93c7bbd3a0fd2ecf550035762f9438141926604c8ff8ac'
            'b33b6b6ead820ae17460d660b7d6953e483012cbfe0b9614ee04ffe396d3515c'
            'aeebd9644b5198d085b18b1ddbd907a27cda6f78abfb428f379d53e78de5d73a')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # we can't do ${version}.${num_commits_ahead}.${short_hash} since the tags for recents versions are not part of the master branch
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    patch -p1 < "${srcdir}/archlinux-cef.patch"
    dos2unix src/shell/casparcg.config
}

build() {
    cd "${srcdir}"

    export CFLAGS="${CFLAGS} -fmacro-prefix-map=${srcdir}/${_pkgname}=."
    export CXXFLAGS="${CXXFLAGS} -fmacro-prefix-map=${srcdir}/${_pkgname}=."

    cmake -B build -S "${_pkgname}/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DUSE_SYSTEM_CEF=ON \
        -DUSE_STATIC_BOOST=OFF \
        -DDIAG_FONT_PATH="/usr/share/fonts/liberation/LiberationMono-Regular.ttf" \
        -DCASPARCG_BINARY_NAME=${_pkgname} \
        -G Ninja

    ninja -C build
}

package_casparcg-server-git() {
    conflicts=(casparcg-server cef-minimal)
    provides=(casparcg-server)
    optdepends=(
        'casparcg-server-headless-git: Run casparcg as a system service'
    )

    cd "${srcdir}"
    ninja -C build install
    install -dm755 "${pkgdir}/opt/casparcg/"
}

package_casparcg-server-headless-git() {
    conflicts=(casparcg-server-headless)
    provides=(casparcg-server-headless)
    depends=(casparcg-server-git)

    cd "${srcdir}"
    install -Dm644 casparcg-server.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 casparcg.sysusers "${pkgdir}/usr/lib/sysusers.d/casparcg.conf"
    install -Dm644 casparcg.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/casparcg.conf"
}
