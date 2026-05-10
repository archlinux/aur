# Maintainer: Scientress <arch@scientress.de>
# Previous Maintainer: oscarcl <oscar.cowderylack@gmail.com>
_pkgname="casparcg-server"
pkgname="${_pkgname}-git"
pkgver=r4173.8c7383783
pkgrel=1
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL-3.0-or-later')
conflicts=(casparcg-server)
provides=(casparcg-server)
depends=(cef ffmpeg boost-libs libgl freeimage glew tbb openal sfml2 libxcomposite libxdamage libxkbcommon libxss libcups pango nss at-spi2-atk ttf-liberation)
makedepends=(git cmake ninja boost dos2unix)
source=("${_pkgname}::git+https://github.com/CasparCG/server.git"
        "archlinux-cef.patch")
sha256sums=('SKIP'
            'cf2a2e0411b9d717aea98892f326ae7fdaa34a797cd535e3629f5745c98f36b4')

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

package() {
    cd "${srcdir}"
    ninja -C build install
    install -dm755 "${pkgdir}/opt/casparcg/"
}
