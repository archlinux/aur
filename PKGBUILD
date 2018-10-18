# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.0.1
_pkgver="${pkgver//./_}"
pkgrel=1
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('GPL')
depends=('openscenegraph' 'python' 'proj' 'fox' 'xerces-c' 'gdal' 'gl2ps')
makedepends=('cmake' 'help2man' 'swig' 'gtest')
source=("https://github.com/eclipse/sumo/archive/v${_pkgver}.tar.gz"
        "${pkgbase}.desktop")

sha256sums=('244dd552b77a9bdccc8bc3a6e8591216410858404a3f1e943a141f4143f7dd6f'
            'd9ec82a1b56ebeaf31c6382f6d903baf0767e440b640a713e587d7e09f72d213')

prepare() {
    cd ${pkgbase}-${_pkgver}
    sed -i "/^Version=/ s/$/${pkgver}/" "${srcdir}/${pkgbase}.desktop"

    # CMake didn't have man target in 1.0.1..... sigh
    curl -O https://raw.githubusercontent.com/eclipse/sumo/702985ea9187dcdeb3071334b505a5c4791467e9/CMakeLists.txt
    sed -i "s/PACKAGE_VERSION "git"/PACKAGE_VERSION ${_pkgver}/" CMakeLists.txt
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd ${pkgbase}-${_pkgver}
    cmake --build build
    cmake --build build -- man
}

# check() { 
#     cd ${pkgbase}-${_pkgver}
#     cmake --build build -- test
# }

package_sumo() {
    # I can't see how is backup useful?
    # backup=("etc/profile.d/sumo.sh")
    optdepends=('java-runtime-common: for executing Jar files like TraCI4J'
                "python2: for executing various python scripts in $SUMO_HOME/tools")

    cd ${pkgbase}-${_pkgver}

    # Installs just the bin files
    cmake --build build -- DESTDIR="${pkgdir}/" install

    install -d "${pkgdir}/etc/profile.d"
cat <<EOF > "${pkgdir}/etc/profile.d/sumo.sh"
#!/bin/sh

export SUMO_HOME="/usr/lib/sumo"
EOF

    install -Dm644 docs/logo/256x256.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
    install -Dm644 ${srcdir}/${pkgbase}.desktop -t ${pkgdir}/usr/share/applications/
}

package_sumo-doc() {
    cd ${pkgbase}-${_pkgver}

    install -d ${pkgdir}/usr/share/doc/${pkgbase}

    # just man pages for now
    # cp -a * ${pkgdir}/usr/share/doc/${pkgbase}/
    install -Dm644 docs/man/* -t ${pkgdir}/usr/share/man/man1/
    install -m0644 {AUTHORS,ChangeLog,LICENSE,README.md} ${pkgdir}/usr/share/doc/${pkgbase}
}
