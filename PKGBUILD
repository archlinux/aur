# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

########[ OPTIONS ]########################################
# Download sources from within i2p
#_i2p_fetch=1
###########################################################

pkgname=i2p-bin
pkgver=0.9.19
pkgrel=1
pkgdesc="A distributed anonymous network (pre-compiled binary)"
url="http://www.i2p2.de"
license=('GPL2')
arch=('any')
depends=('java-runtime' 'java-service-wrapper')
optdepends=('robert: I2P BitTorrent client') #'gtk2: for rrd graphs'
conflicts=('i2p' 'i2p-dev')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
noextract=("i2pinstall_${pkgver}.jar")

#_url="https://googledrive.com/host/0B4jHEq5G7_EPWV9UeERwdGplZXc/${pkgver}"
_url="https://launchpad.net/i2p/trunk/${pkgver}/+download"

source=("${_url}/i2pinstall_${pkgver}.jar"
        "${_url}/i2pinstall_${pkgver}.jar.sig"
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

[[ $_i2p_fetch ]] && {
    export http_proxy=127.0.0.1:4444
    source=("http://echelon.i2p/${pkgver}/i2pinstall_${pkgver}.jar"
            "http://echelon.i2p/${pkgver}/i2pinstall_${pkgver}.jar.sig"
            'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')
}

sha256sums=('d16f68fff3a34d161843a09e90fff1ac5eae8ccb319a43257244ec0e764a11c1'
            'SKIP'
            '842b529ae23bc82fd78e986dd7cc683bd7b671e93421de57f279dc3f4d5d0fd2'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            'a76e7b6ccd8f49b51d22012887e1f0101db3bfe6aeebe1bc416b48da4e206b27'
            'c001f045e52ab82154b21125384dbc4f1d2437376fc65c5d83987051e42b5409')

# https://geti2p.net/en/get-involved/develop/release-signing-key
validpgpkeys=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8')

package() {
    cd "$srcdir"
    source /etc/profile.d/jre.sh

    echo "INSTALL_PATH=${pkgdir}/opt/i2p" >install.properties
    java -jar i2pinstall_${pkgver}.jar -options install.properties

    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/i2p"

    install -Dm644 "$srcdir/router.config"        "$pkgdir/opt/i2p/router.config"
    install -Dm755 "$srcdir/i2prouter.sh"         "$pkgdir/opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service"    "$pkgdir/usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "$pkgdir/opt/i2p/man/eepget.1" "$pkgdir/usr/share/man/man1/eepget.1"
    install -Dm644 "$pkgdir/opt/i2p/LICENSE.txt"  "$pkgdir/usr/share/licenses/i2p/LICENSE"
    cp "$srcdir/wrapper.config"                   "$pkgdir/opt/i2p"
    mv "$pkgdir"/opt/i2p/licenses/*               "$pkgdir/usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "$pkgdir/usr/bin/"
    chmod 755 "$pkgdir/opt/i2p"
    chmod -x "$pkgdir"/opt/i2p/*.config

    echo 'd /run/i2p 0700 i2p i2p -'    >"$pkgdir/usr/lib/tmpfiles.d/i2prouter.conf"

    sed -i "$pkgdir"/opt/i2p/eepget \
        -e "s:$pkgdir/opt/i2p:/opt/i2p:g"
    sed -i "$pkgdir"/opt/i2p/clients.config \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    rm -r "$pkgdir"/opt/i2p/{Uninstaller,.installationinformation,INSTALL-headless.txt,LICENSE.txt,runplain.sh,licenses,man,i2psvc,lib/*wrapper*,scripts/home.i2p.i2prouter}

}
