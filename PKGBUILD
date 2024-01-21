# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

SUMO_HOME='/usr/share/sumo'
pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.19.0
pkgrel=2
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('EPL-2.0')
depends=('openscenegraph' 'proj' 'fox' 'xerces-c' 'gdal' 'gl2ps' 'flake8' 'autopep8' 'python-pyproj' 'python-pandas' 'python-scipy' 'ffmpeg' 'python-matplotlib')
makedepends=('cmake' 'help2man' 'swig' 'gtest' 'gmock' 'python-setuptools' 'python-build' 'eigen' 'jdk-openjdk' 'maven' 'git' 'python-pip')
source=("https://sumo.dlr.de/releases/${pkgver}/sumo-src-${pkgver}.tar.gz"
        "${pkgbase}.desktop")

sha256sums=('7643b1f8a3d7144f181542c9c7b8c72f3e8e45ba9c627912665083db0fe106cd'
            'cc0ed7ad1cce228cd8c634e031c966e1795a16623f0e139ebdcc7ecd06d0bf4d')

prepare() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cmake --build build
    cmake --build build -- man
}

# example tests still fails
# check() { 
#     cd ${pkgbase}-${pkgver}
#     cmake --build build -- test
# }

package_sumo() {
    optdepends=('java-runtime-common: for executing Jar files like TraCI4J')

    # Installs just the bin files
    cmake --build build -- DESTDIR="${pkgdir}/" install

    install -d "${pkgdir}/etc/profile.d"
cat <<EOF > "${pkgdir}/etc/profile.d/sumo.sh"
#!/bin/sh

export SUMO_HOME="$SUMO_HOME"
EOF

    install -Dm644 ${pkgbase}-${pkgver}/data/logo/sumo-128x138.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
    install -Dm644 ${srcdir}/${pkgbase}.desktop -t ${pkgdir}/usr/share/applications/
}

package_sumo-doc() {
    cd ${pkgbase}-${pkgver}

    install -d ${pkgdir}/usr/share/doc/${pkgbase}

    # just man pages for now
    # cp -a * ${pkgdir}/usr/share/doc/${pkgbase}/
    install -Dm644 docs/man/* -t ${pkgdir}/usr/share/man/man1/
    install -m0644 {AUTHORS,ChangeLog,LICENSE,README.md} ${pkgdir}/usr/share/doc/${pkgbase}
}
