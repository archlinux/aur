# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

pkgname=i2p-bin
pkgver=0.9.43
pkgrel=1
pkgdesc="A distributed anonymous network (pre-compiled binary)"
url="https://geti2p.net"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-service-wrapper')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-dev')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
noextract=("i2pinstall_${pkgver}.jar")
options=(!strip)

# https://geti2p.net/en/get-involved/develop/release-signing-key
# https://geti2p.net/_static/zzz.key.asc
validpgpkeys=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8')

#_url="https://download.i2p2.de/releases/${pkgver}"
_url="https://launchpad.net/i2p/trunk/${pkgver}/+download"

source=("${_url}/i2pinstall_${pkgver}.jar"{,.sig}
        'https://raw.githubusercontent.com/i2p/i2p.i2p/master/installer/resources/bash-completion/eepget'
        'i2prouter.service' 'i2p.tmpfiles' 'wrapper.config' 'router.config'
        'i2prouter.bash' 'i2prouter.sh')

sha256sums=('e5eb3db08dcc594e2fb01ada63303ff48096a454db1c7659c928ddb07736c84a'
            'SKIP'
            '925d931aae2bd03c08555536b1c836654a72cc4acfd9f440f1ad43958ba2108d'
            '644b771ec7f5db3efab3206bf1f896566cdb00d410a54608fda85bdb4c2ad876'
            'df26da04c8415ac24ec73b0dd08d3459a8964553bb77e5da5ab9833b0a31d865'
            '5d134ee5bc614b54ec48de7c5214f6dbe08abcfab7d286c5b1c7616e39b478ed'
            '7a4688db826c3dddb762976cd8c9a5d465255c3577069243d8e5af941a4126e2'
            '7a19b9f90c8792460fd58e8b8aa435a065e34d29a942479850472510e9d3078a'
            'b5f1a5bb354552acebe2857b9579410f7fd589f2f7d6b12fbbfe4127a2d33fd8')

package() {
    cd "$pkgdir"
    source /etc/profile.d/jre.sh

    echo "INSTALL_PATH=${pkgdir}/opt/i2p" >install.properties
    java -jar "$srcdir/i2pinstall_${pkgver}.jar" \
         -options install.properties \
         -language eng
    rm -f install.properties

    install -dm755 "usr/bin"
    install -dm755 "opt/i2p"

    install -Dm644 "$srcdir/i2prouter.service" "usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "$srcdir/i2p.tmpfiles"      "usr/lib/tmpfiles.d/i2p.conf"
    echo 'u i2p - "I2P Router" /opt/i2p /bin/sh' |
    install -Dm644 /dev/stdin                  "usr/lib/sysusers.d/i2p.conf"

    install -Dm644 "$srcdir/router.config"     "opt/i2p/router.config"
    install -Dm644 "$srcdir/wrapper.config"    "opt/i2p/wrapper.config"
    install -Dm755 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"

    install -Dm644 "$srcdir/i2prouter.bash"    "usr/share/bash-completion/completions/i2prouter"
    install -Dm644 "$srcdir/eepget"            "usr/share/bash-completion/completions/eepget"

    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/{eepget,i2prouter}
    chmod -x opt/i2p/*.config

    sed -i opt/i2p/eepget \
        -e "s:$pkgdir/opt/i2p:/opt/i2p:g"

    # dont automatically start the webserver (3) or open a webbrowser (4)
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"

    rm -rf opt/i2p/{Uninstaller,.installationinformation,INSTALL-headless.txt,LICENSE.txt,runplain.sh,licenses,man,i2psvc,lib/*wrapper*,scripts/home.i2p.i2prouter}
}
