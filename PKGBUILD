# Maintainer: Daniel Hillenbrand <codeworkx@bbqlinux.org>
pkgname=openhab-beta
_pkgver=2.5.0
pkgver=2.5.0_20190203
pkgrel=1
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless>=8')
makedepends=('unzip')

conflicts=('openhab-runtime' 'openhab-addons' 'openhab2')

backup=('etc/openhab/conf/services/addons.cfg'
        'etc/openhab/conf/services/runtime.cfg')

source=("https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab/target/openhab-${_pkgver}-SNAPSHOT.zip"
        "https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-addons/target/openhab-addons-${_pkgver}-SNAPSHOT.kar"
        "https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-addons-legacy/target/openhab-addons-legacy-${_pkgver}-SNAPSHOT.kar"
        "openhab.service")

noextract=("openhab-${_pkgver}-SNAPSHOT.zip")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '79b57f9f6b6e832f1bc60649990c147825a36e76858c43d3f1464f6b98530bdb')

pkgver() {
    printf "${_pkgver}_%s" "$(date +%Y%m%d)"
}

prepare() {
    mkdir -p "$srcdir/openhab"
    cd "$srcdir/openhab"
    unzip "$srcdir/openhab-${_pkgver}-SNAPSHOT.zip"
    cp "$srcdir/openhab-addons-${_pkgver}-SNAPSHOT.kar" "$srcdir/openhab/addons"
    cp "$srcdir/openhab-addons-legacy-${_pkgver}-SNAPSHOT.kar" "$srcdir/openhab/addons"
}

package() {
    cd $pkgdir

    mkdir -p etc/openhab
    mkdir -p opt
    mkdir -p usr/lib/systemd/system

    cp $srcdir/openhab.service usr/lib/systemd/system
    cp -r $srcdir/openhab opt/

    mv opt/openhab/conf etc/openhab/conf
    ln -s /etc/openhab/conf opt/openhab/conf

    mv opt/openhab/addons etc/openhab/addons
    ln -s /etc/openhab/addons opt/openhab/addons
}
