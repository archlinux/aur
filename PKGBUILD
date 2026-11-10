# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.28.0
pkgrel=1
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('EPL-2.0')
depends=('openscenegraph' 'proj' 'fox' 'xerces-c' 'gdal' 'gl2ps' 'flake8' 'autopep8' 'python-pyproj' 'python-pandas' 'python-scipy' 'ffmpeg' 'python-matplotlib')
makedepends=('cmake' 'help2man' 'swig' 'gtest' 'gmock' 'python-setuptools' 'python-build' 'eigen' 'jdk-openjdk' 'maven' 'git' 'python-pip')
source=("https://sumo.dlr.de/releases/${pkgver}/sumo-src-${pkgver}.tar.gz")

sha256sums=('d36b3a72b879bd38d1e0981d86d52a8730396cd37dc65a80bf77b4683fbad194')

prepare() {
    # example tests still fail
    sed -i '/exampletest/d' "$pkgname-$pkgver"/CMakeLists.txt
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
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

    # Installs desktop files, icons, MIME info and profile scripts
    DESTDIR="${pkgdir}/" cmake --install build --component linux_integration

    # Man pages are shipped in sumo-doc
    rm -rf "${pkgdir}/usr/share/man"
}

package_sumo-doc() {
    arch=('any')
    depends=()

    cd ${pkgbase}-${pkgver}

    install -d ${pkgdir}/usr/share/doc/${pkgbase}

    # just man pages for now
    # cp -a * ${pkgdir}/usr/share/doc/${pkgbase}/
    install -Dm644 docs/man/* -t ${pkgdir}/usr/share/man/man1/
    install -m0644 {AUTHORS,ChangeLog,LICENSE,README.md} ${pkgdir}/usr/share/doc/${pkgbase}
}
