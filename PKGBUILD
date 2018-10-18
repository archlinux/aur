# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Holger Doebler <holger DOD doebler AD posteo DOD de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: mareex <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com>

pkgname=('sumo' 'sumo-doc')
pkgbase=sumo
pkgver=1.0.1
pkgrel=1
pkgdesc="Traffic simulation modelling road vehicles, public transport and pedestrians."
arch=('i686' 'x86_64')
url="http://sumo.dlr.de"
license=('GPL')
depends=('python' 'proj' 'fox' 'xerces-c' 'gdal')
makedepends=('help2man')
source=("http://prdownloads.sourceforge.net/${pkgbase}/${pkgbase}-src-${pkgver}.tar.gz?download"
        "${pkgbase}.desktop")

sha256sums=('6e46a1568b1b3627f06c999c798feceb37f17e92aadb4d517825b01c797ec531'
            'd9ec82a1b56ebeaf31c6382f6d903baf0767e440b640a713e587d7e09f72d213')

prepare() {
    cd ${pkgbase}-${pkgver}
    ./configure --prefix=/usr
    sed -i "/^Version=/ s/$/${pkgver}/" "${srcdir}/${pkgbase}.desktop"
}

build() {
    cd ${pkgbase}-${pkgver}
    make
    make man
}

package_sumo() {
    # I can't see how is backup useful?
    # backup=("etc/profile.d/sumo.sh")
    optdepends=('java-runtime-common: for executing Jar files like TraCI4J'
                "python2: for executing various python scripts in $SUMO_HOME/tools")

    cd ${pkgbase}-${pkgver}

    # Installs just the bin files
    make DESTDIR="${pkgdir}/" install

    install -d "${pkgdir}/etc/profile.d"
cat <<EOF > "${pkgdir}/etc/profile.d/sumo.sh"
#!/bin/sh

export SUMO_HOME="/usr/lib/sumo"
EOF

    install -d ${pkgdir}/usr/lib/${pkgbase}
    cp -a data ${pkgdir}/usr/lib/${pkgbase}/
    cp -a tools ${pkgdir}/usr/lib/${pkgbase}/

    # Make all scripts executable (not sure if this is necessary)
    find ${pkgdir}/usr/lib/${pkgbase}/tools/ -iname "*.py" -exec chmod +x {} \;

    # logo is missing in current source?
    # install -m0644 docs/userdoc/logo.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
    install -Dm644 ${srcdir}/${pkgbase}.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 docs/man/* -t ${pkgdir}/usr/share/man/man1/
}

package_sumo-doc() {
    cd ${pkgbase}-${pkgver}/docs
    install -d ${pkgdir}/usr/share/doc/${pkgbase}
    cp -a * ${pkgdir}/usr/share/doc/${pkgbase}/

    install -m0644 ${srcdir}/${pkgbase}-${pkgver}/AUTHORS ${pkgdir}/usr/share/doc/${pkgbase}
    install -m0644 ${srcdir}/${pkgbase}-${pkgver}/ChangeLog ${pkgdir}/usr/share/doc/${pkgbase}
    install -m0644 ${srcdir}/${pkgbase}-${pkgver}/LICENSE ${pkgdir}/usr/share/doc/${pkgbase}
    install -m0644 ${srcdir}/${pkgbase}-${pkgver}/README.md ${pkgdir}/usr/share/doc/${pkgbase}

    rm -rf ${pkgdir}/usr/share/doc/${pkgbase}/man
}
