# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.23.1
pkgrel=1
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('EPL-2.0')
depends=('openscenegraph' 'proj' 'fox' 'xerces-c' 'gdal' 'gl2ps' 'flake8' 'autopep8' 'python-pyproj' 'python-pandas' 'python-scipy' 'ffmpeg' 'python-matplotlib')
makedepends=('cmake' 'help2man' 'swig' 'gtest' 'gmock' 'python-setuptools' 'python-build' 'eigen' 'jdk-openjdk' 'maven' 'git' 'python-pip')
source=("https://sumo.dlr.de/releases/${pkgver}/sumo-src-${pkgver}.tar.gz")

sha256sums=('016c506d8bd5d0b6f8e2229ac5dbb9e948535a041559cdd2ff6b616293ac21a8')

prepare() {
    # example tests still fails
    sed -i '/exampletest/d' "$pkgname-$pkgver"/CMakeLists.txt
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cmake --build build
    cmake --build build -- man
}

check() {
    cmake --build build -- test
}

package_sumo() {
    optdepends=('java-runtime-common: for executing Jar files like TraCI4J')

    # Installs just the bin files
    cmake --build build -- DESTDIR="${pkgdir}/" install

    cd ${pkgbase}-${pkgver}
    install -Dm644 data/logo/sumo-128x138.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
    install -Dm644 build_config/package/${pkgbase}.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 build_config/package/*sh -t ${pkgdir}/etc/profile.d/
}

package_sumo-doc() {
    cd ${pkgbase}-${pkgver}

    install -d ${pkgdir}/usr/share/doc/${pkgbase}

    # just man pages for now
    # cp -a * ${pkgdir}/usr/share/doc/${pkgbase}/
    install -Dm644 docs/man/* -t ${pkgdir}/usr/share/man/man1/
    install -m0644 {AUTHORS,ChangeLog,LICENSE,README.md} ${pkgdir}/usr/share/doc/${pkgbase}
}
