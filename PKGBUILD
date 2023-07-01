# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>
# Maintainer:  Salama <salama@salama.xyz>

pkgname=i2p-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A distributed anonymous network (pre-compiled binary)"
url="https://geti2p.net"
license=('GPL2')
arch=('any')
depends=('java-runtime>=13' 'java-service-wrapper')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-dev')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
noextract=("i2pinstall_${pkgver}.jar")
options=(!strip)

# https://geti2p.net/en/get-involved/develop/release-signing-key
# https://geti2p.net/en/blog/post/2023/03/13/new_release_2.2.0
# https://geti2p.net/_static/idk.key.asc
validpgpkeys=('70D2060738BEF80523ACAFF7D75C03B39B5E14E1')

_url="https://files.i2p-projekt.de/${pkgver}"
#_url="https://launchpad.net/i2p/trunk/${pkgver}/+download"

source=("${_url}/i2pinstall_${pkgver}.jar"{,.sig}
        eepget.bash::'https://raw.githubusercontent.com/i2p/i2p.i2p/master/installer/resources/bash-completion/eepget'
        'i2prouter.service' 'i2p.tmpfiles' 'wrapper.config' 'router.config'
        'i2prouter.bash' 'i2prouter.sh' 'chromium-i2p.sh')

sha256sums=('977ebce33001345731de6fe0b623f59a867de6fa6a6c46d8ad686e306310b28d'
            'SKIP'
            '925d931aae2bd03c08555536b1c836654a72cc4acfd9f440f1ad43958ba2108d'
            '644b771ec7f5db3efab3206bf1f896566cdb00d410a54608fda85bdb4c2ad876'
            'fc30dd32f48fe1c93bf36c8297ca48203a1479e4e221ebe62c57cf3c3c0347d3'
            'ba4bcb8d9aef307045d1d24385a456d096ea45f69d95a474467728ea140188ec'
            '90f202e5b66d5a5b425522b409e71fb892d34c534e32ce2d6fe5284015cacf94'
            '7a19b9f90c8792460fd58e8b8aa435a065e34d29a942479850472510e9d3078a'
            '8d39f080c7a2e49226db3a785f3e18583159ef2f95e1ab467fd9984c4e38c9f5'
            'a7076156703e2b949331e450455813432caeb4e5712f1c7b668974eb06a69fb9')

package() {
    cd "$pkgdir"

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
    install -Dm754 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"
    install -Dm755 "$srcdir/chromium-i2p.sh"   "opt/i2p/scripts/chromium-i2p"

    install -Dm644 "$srcdir/i2prouter.bash"    "usr/share/bash-completion/completions/i2prouter"
    install -Dm644 "$srcdir/eepget.bash"       "usr/share/bash-completion/completions/eepget"

    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/eepget
    chmod -x opt/i2p/*.config

    sed -i opt/i2p/eepget \
        -e "s:$pkgdir/opt/i2p:/opt/i2p:g"

    # dont automatically start the webserver(3) or open a webbrowser(4)
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"

    rm -rf opt/i2p/{Uninstaller,.installationinformation,INSTALL-headless.txt,LICENSE.txt,runplain.sh,licenses,man,i2psvc,lib/*wrapper*,scripts/home.i2p.i2prouter}
}
