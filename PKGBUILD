# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.1.0
_pkgver="${pkgver//./_}"
pkgrel=1
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('GPL')
depends=('openscenegraph' 'python' 'proj' 'fox' 'xerces-c' 'gdal' 'gl2ps')
makedepends=('cmake' 'help2man' 'swig' 'gtest')
source=("https://github.com/eclipse/sumo/archive/v${_pkgver}.tar.gz"
        "${pkgbase}.desktop"
        "0001-Properly-use-DESTDIR-prefix-and-root.patch")

sha256sums=('11aeaa8abaa8008e4f13f82cd77797ffd803d20e345c741966a70a3dc1f55c2e'
            'd9ec82a1b56ebeaf31c6382f6d903baf0767e440b640a713e587d7e09f72d213'
            '2dc86272997f898908afab9136bb423e378f60c34bfa92cdbd2fbb2a6b0d6c25')

prepare() {
    cd ${pkgbase}-${_pkgver}
    sed -i "/^Version=/ s/$/${pkgver}/" "${srcdir}/${pkgbase}.desktop"

    patch -Np1 -i "${srcdir}/0001-Properly-use-DESTDIR-prefix-and-root.patch"

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

    install -Dm644 data/logo/sumo-128x138.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
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
