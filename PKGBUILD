# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

########[ OPTIONS ]########################################
# Comment out if you want to build all language translations
export LG2=en

# Download sources from within i2p
#_i2p_fetch=1
###########################################################

pkgname=i2p
pkgver=0.9.20
pkgrel=1
pkgdesc="A distributed anonymous network"
url="https://geti2p.net"
license=('GPL2')
arch=('any')
depends=('java-runtime' 'java-service-wrapper')
makedepends=('apache-ant' 'java-environment')
[[ "$LG2" != 'en' ]] && makedepends+=('gettext')
optdepends=('robert: I2P BitTorrent client') #'gtk2: for rrd graphs'
conflicts=('i2p-bin' 'i2p-dev')
backup=('opt/i2p/wrapper.config')
install='i2p.install'

#_url="https://googledrive.com/host/0B4jHEq5G7_EPWV9UeERwdGplZXc/${pkgver}"
_url="https://launchpad.net/i2p/trunk/${pkgver}/+download"

source=("${_url}/i2psource_${pkgver}.tar.bz2"
        "${_url}/i2psource_${pkgver}.tar.bz2.sig"
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

[[ $_i2p_fetch ]] && {
    export http_proxy=127.0.0.1:4444
    source=("http://echelon.i2p/${pkgver}/i2psource_${pkgver}.tar.bz2"
            "http://echelon.i2p/${pkgver}/i2psource_${pkgver}.tar.bz2.sig"
            'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')
}

sha256sums=('bcd900a9001bdda37ed70cdec78e9096ed370e44513aae5e29a02886d0babd33'
            'SKIP'
            '842b529ae23bc82fd78e986dd7cc683bd7b671e93421de57f279dc3f4d5d0fd2'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            '72c0944cd2b04c747673a534475f2ec42c64d52fdda76714f1165c4655113de2'
            '1527afbadcf849ef551b3b7b68d1a29eec316ee620f5320f2933f73ee9924978')

# https://geti2p.net/en/get-involved/develop/release-signing-key
validpgpkeys=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh

    ant preppkg-linux-only
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/i2p"

    cp -r pkg-temp/* "$pkgdir/opt/i2p"
    cp "$srcdir/wrapper.config" "$pkgdir/opt/i2p"

    install -Dm644 "$srcdir/router.config"        "$pkgdir/opt/i2p/router.config"
    install -Dm755 "$srcdir/i2prouter.sh"         "$pkgdir/opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service"    "$pkgdir/usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "$pkgdir/opt/i2p/man/eepget.1" "$pkgdir/usr/share/man/man1/eepget.1"
    install -Dm644 "$pkgdir/opt/i2p/LICENSE.txt"  "$pkgdir/usr/share/licenses/i2p/LICENSE"
    mv "$pkgdir"/opt/i2p/licenses/*               "$pkgdir/usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "$pkgdir/usr/bin/"
    chmod +x "$pkgdir"/opt/i2p/{eepget,i2prouter}

    echo 'd /run/i2p 0700 i2p i2p -'    >"$pkgdir/usr/lib/tmpfiles.d/i2prouter.conf"

    sed -i "$pkgdir"/opt/i2p/eepget \
        -e 's:%INSTALL_PATH:/opt/i2p:g'
    sed -i "$pkgdir"/opt/i2p/clients.config \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    rm -r "$pkgdir"/opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper*}
}
