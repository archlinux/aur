# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

########[ OPTIONS ]########################################
# Download sources from within i2p
#_i2p_fetch=1
###########################################################

pkgname=i2p-bin
pkgver=0.9.26
pkgrel=1
pkgdesc="A distributed anonymous network (pre-compiled binary)"
url="http://www.i2p2.de"
license=('GPL2')
arch=('any')
depends=('java-runtime' 'java-service-wrapper')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-dev')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
noextract=("i2pinstall_${pkgver}.jar")

_url="https://download.i2p2.de/releases/${pkgver}"

source=("${_url}/i2pinstall_${pkgver}.jar"{,.sig}
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

[[ $_i2p_fetch ]] && {
    export http_proxy=127.0.0.1:4444
    source=("http://echelon.i2p/${pkgver}/i2pinstall_${pkgver}.jar"{,.sig}
            #"http://whnxvjwjhzsske5yevyokhskllvtisv5ueokw6yvh6t7zqrpra2q.b32.i2p/releases/${pkgver}/i2pinstall_${pkgver}.jar"{,.sig}
            'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')
}

sha256sums=('563eb6f2cb9220c380190e90290cd154da3f30b4fa96a212a80e4bbc7a8fd44f'
            'SKIP'
            '9bb899ece87099716da29bac8b7da02916fc325699b68989e73c1fe333a6342f'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            'a76e7b6ccd8f49b51d22012887e1f0101db3bfe6aeebe1bc416b48da4e206b27'
            '1527afbadcf849ef551b3b7b68d1a29eec316ee620f5320f2933f73ee9924978')

# https://geti2p.net/en/get-involved/develop/release-signing-key
validpgpkeys=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8'
              '2253E2A1EEB40E2A3D22EB1D0EC51FCDA94FB53E')

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
