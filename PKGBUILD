# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Martin Weinelt <mweinelt@gmail.com>
# Contributor: Samuel Kogler <firstname.lastname at gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>

_gui=true
pkgbase=simulationcraft
pkgname=simulationcraft
_pkgname=simc
_simver=830
_simrel=01
pkgver=${_simver}_${_simrel}
pkgrel=1
pkgdesc="A tool to explore combat mechanics in the popular MMO RPG World of Warcraft (tm). Multi-player event-driven simulator written in C++ that models raid damage."
url="https://github.com/simulationcraft/simc"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${_simver}-${_simrel}.tar.gz::https://github.com/simulationcraft/simc/archive/release-${_simver}-${_simrel}.tar.gz"
        '0001-set-welcome-path.patch'
        'SimulationCraft.desktop')

sha256sums=('a67de54c3301aa34163d7a9ed083d617dd46ea0ef79044dc6fe71417fcfacfd2'
            '0755cfa21435dd3a019a686fd0e313abf631dcd02efa37ebcafe23546bacc048'
            '12cddfa8077e3f7c5c7d8bc445f27691072911d36e296ffe21281c6f4a0c1dd9')

prepare() {
    cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}"
    patch -p1 < "${srcdir}/0001-set-welcome-path.patch"

    mkdir -p build
    cd build
    cmake ..
}

build() {
    cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}/build/"

    if [ ${_gui} = true ] ; then
        make PREFIX=/usr CFLAGS+="${CFLAGS}" CXXFLAGS+="${CXXFLAGS}" LDFLAGS+="${LDFLAGS}"
    else
        make PREFIX=/usr CFLAGS+="${CFLAGS}" CXXFLAGS+="${CXXFLAGS}" LDFLAGS+="${LDFLAGS}" simc
    fi
}

package_simulationcraft-data() {
    pkgdesc+=" Data"
    arch=("any")

    cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}"

    for profile in $( find profiles -type f); do
        install -Dm644 "${profile}" "${pkgdir}/usr/share/simulationcraft/${profile}"
    done

    install -Dm644 "Welcome.html" "${pkgdir}/usr/share/simulationcraft/Welcome.html"
    install -Dm644 "Welcome.png" "${pkgdir}/usr/share/simulationcraft/Welcome.png"
}

package_simulationcraft() {
    depends=('openssl' "simulationcraft-data=${pkgver}")

    cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}/build/"
    install -Dm755 simc "${pkgdir}/usr/bin/simc"
}

if [ ${_gui} = true ] ; then
    package_simulationcraft-gui() {
        pkgdesc+=" GUI"
        depends=('qt5-webkit' "simulationcraft=${pkgver}")

        cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}"

        install -Dm644 qt/icon/SimulationCraft.xpm "${pkgdir}/usr/share/pixmaps/SimulationCraft.xpm"
        install -Dm644 "${srcdir}/SimulationCraft.desktop" "${pkgdir}/usr/share/applications/SimulationCraft.desktop"
        for _locale in locale/* ; do
            install -Dm644 "${_locale}" "${pkgdir}/usr/share/simulationcraft/${_locale}"
        done
        install -Dm755 build/qt/SimulationCraft "${pkgdir}/usr/bin/simulationcraft"
    }

    makedepends+=('qt5-webkit' 'qt5-webengine')
    true && pkgname=(simulationcraft simulationcraft-gui simulationcraft-data)
else
    true && pkgname=(simulationcraft  simulationcraft-data)
fi
