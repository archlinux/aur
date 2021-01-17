# Maintainer: KillerBean <killerbean at gmail.com>

_gui=true
_gitname=simc
pkgver=r46084.3baee4b094
pkgrel=1
pkgname=simulationcraft-git
pkgdesc="A tool to explore combat mechanics in the popular MMO RPG World of Warcraft (tm). Multi-player event-driven simulator written in C++ that models raid damage."
url="https://github.com/simulationcraft/simc"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-webkit' 'openssl' 'qt5-webkit' 'qt5-webengine')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/simulationcraft/simc.git'
        '0001-set-welcome-path.patch'
        'SimulationCraft.desktop')
sha256sums=('SKIP'
            '618e5d13965b9093213ef2240e23a828870b07faac0908cb1978438501f9e43d'
            '12cddfa8077e3f7c5c7d8bc445f27691072911d36e296ffe21281c6f4a0c1dd9')
pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}/"
    patch -p1 < "${srcdir}/0001-set-welcome-path.patch"

    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
}

build() {
    cd "${srcdir}/${_gitname}/build/"

    if [ ${_gui} = true ] ; then
        make PREFIX=/usr CFLAGS+="${CFLAGS}" CXXFLAGS+="${CXXFLAGS}" LDFLAGS+="${LDFLAGS}"
    else
        make PREFIX=/usr CFLAGS+="${CFLAGS}" CXXFLAGS+="${CXXFLAGS}" LDFLAGS+="${LDFLAGS}" simc
    fi
}

package() {
    cd "${srcdir}/${_gitname}/"

    for profile in $( find profiles -type f); do
        install -Dm644 "${profile}" "${pkgdir}/usr/share/${pkgname%-*}/${profile}"
    done

    install -Dm755 build/simc "${pkgdir}/usr/bin/simc"

    install -Dm644 "Welcome.html" "${pkgdir}/usr/share/${pkgname%-*}/Welcome.html"
    install -Dm644 "Welcome.png" "${pkgdir}/usr/share/${pkgname%-*}/Welcome.png"

    install -Dm644 qt/icon/SimulationCraft.xpm "${pkgname%-*}/usr/share/pixmaps/SimulationCraft.xpm"
    install -Dm644 "${srcdir}/SimulationCraft.desktop" "${pkgname%-*}/usr/share/applications/SimulationCraft.desktop"
    for _locale in locale/* ; do
        install -Dm644 "${_locale}" "${pkgdir}/usr/share/${pkgname%-*}/${_locale}"
    done
    install -Dm755 build/qt/SimulationCraft "${pkgdir}/usr/bin/${pkgname%-*}"
}
