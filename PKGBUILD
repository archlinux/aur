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
source=("${pkgbase}-src-${pkgver}.tar.gz::http://prdownloads.sourceforge.net/${pkgbase}/${pkgbase}-src-${pkgver}.tar.gz?download"
        "${pkgbase}.desktop"
        "${pkgbase}.sh")

sha256sums=('6e46a1568b1b3627f06c999c798feceb37f17e92aadb4d517825b01c797ec531'
            '0500ba9cdf827cceae9a9bce66094bdb077300c94b0040bdd710afb92d0d4849'
            '16db32dbba617f8a38f5d103ce3af7cc70ab4cbf5b50e30be5d7f13ee6ea2f4f')

prepare() {
    cd ${pkgbase}-${pkgver}
    ./configure --prefix=/usr
}

build() {
    cd ${pkgbase}-${pkgver}
    make
    make man
}

package_sumo() {
    backup=("etc/profile.d/sumo.sh")
    optdepends=('java-runtime-common: for executing Jar files like TraCI4J'
                'python2: for executing various python scripts in $SUMO_HOME/tools'
                'perl: for executing various perl scripts in $SUMO_HOME/tools')

    mkdir -p ${pkgdir}/etc/profile.d/
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib/${pkgbase}/data
    mkdir -p ${pkgdir}/usr/lib/${pkgbase}/tools
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/doc/${pkgbase}
    mkdir -p ${pkgdir}/usr/share/man/man1
    mkdir -p ${pkgdir}/usr/share/pixmaps

    install -m0755 ${srcdir}/${pkgbase}.sh ${pkgdir}/etc/profile.d/

    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/activitygen ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/dfrouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/duarouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/emissionsDrivingCycle ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/emissionsMap ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/jtrrouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/marouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/netconvert ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/netedit ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/netgenerate ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/od2trips ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/polyconvert ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/${pkgbase} ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/${pkgbase}-gui ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${pkgbase}-${pkgver}/bin/TraCITestClient ${pkgdir}/usr/bin/

    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")

########### DATA
    cd ${srcdir}/${pkgbase}-${pkgver}/data
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/lib/${pkgbase}/data/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/lib/${pkgbase}/data/$f
    done
    for l in $(find . -type l)
    do
        ln -s $(readlink $l) ${pkgdir}/usr/lib/${pkgbase}/data/$l
    done
########### TOOLS
    cd ${srcdir}/${pkgbase}-${pkgver}/tools
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/lib/${pkgbase}/tools/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/lib/${pkgbase}/tools/$f
    done
    for l in $(find . -type l)
    do
        ln -s $(readlink $l) ${pkgdir}/usr/lib/${pkgbase}/tools/$l
    done

    # make all scripts executable
    find ${pkgdir}/usr/lib/${pkgbase}/tools/ -iname \*.sh -exec chmod +x {} \;
    find ${pkgdir}/usr/lib/${pkgbase}/tools/ -iname \*.py -exec chmod +x {} \;
    find ${pkgdir}/usr/lib/${pkgbase}/tools/ -iname \*.pl -exec chmod +x {} \;
########### PIXMAP
    install -m0644 ${srcdir}/${pkgbase}-${pkgver}/docs/userdoc/logo.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
########### .DESKTOP FILE
    install -m0644 ${srcdir}/${pkgbase}.desktop ${pkgdir}/usr/share/applications
########### MAN
    cd ${srcdir}/${pkgbase}-${pkgver}/docs/man
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/share/man/man1/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/share/man/man1/$f
    done
    for l in $(find . -type l)
    do
        ln -s $(readlink $l) ${pkgdir}/usr/share/man/man1/$l
    done
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
