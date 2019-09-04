# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

# Uncomment if you do not want to build all language translations
#export LG2=en

pkgname=i2p
pkgver=0.9.42
pkgrel=1
pkgdesc="A distributed anonymous network"
url="https://geti2p.net"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-service-wrapper')
makedepends=('java-environment>=8' 'apache-ant')
[[ "$LG2" != 'en' ]] && makedepends+=('gettext')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p-bin' 'i2p-dev')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
options=(!strip)

_url="https://download.i2p2.de/releases/${pkgver}"
#_url="https://launchpad.net/i2p/trunk/${pkgver}/+download"

source=("${_url}/i2psource_${pkgver}.tar.bz2"{,.sig}
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

_hash=$(curl -Ls "https://geti2p.net/en/download" \
            |grep -A1 "<div class=\"hash\">" \
            |sed -e "s:.*<code>::" -e "s:</code>::" -e '17,17!d')

sha256sums=(${_hash:-'30482b56becb6135ed4b74bd4715906774f7c3f3302753985a5fde363f0cc713'}
            'SKIP'
            '9bb899ece87099716da29bac8b7da02916fc325699b68989e73c1fe333a6342f'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            '4c78eb44e9f47cf61d3c60d3e3f267a9aabb62883950ee8b6fa567f68f4635eb'
            '7a4688db826c3dddb762976cd8c9a5d465255c3577069243d8e5af941a4126e2')

# https://geti2p.net/en/get-involved/develop/release-signing-key
validpgpkeys=('2D3D2D03910C6504C1210C65EE60C0C8EE7256A8')

build() {
    cd "$pkgname-$pkgver"

    source /etc/ant.conf
    export ANT_OPTS="-Dfile.encoding=UTF-8"
    ant preppkg-linux-only
}

package() {
    cd "$pkgdir"

    install -dm755 "usr/bin"
    install -dm755 "opt/i2p"

    cp -r "$srcdir/$pkgname-$pkgver"/pkg-temp/* "opt/i2p"

    install -Dm644 "$srcdir/router.config"     "opt/i2p/router.config"
    install -Dm644 "$srcdir/wrapper.config"    "opt/i2p/wrapper.config"
    install -Dm755 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service" "usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/{eepget,i2prouter}

    chmod  -x opt/i2p/*.config
    chmod 755 opt/i2p
    chown  -R 985:985 opt/i2p

    echo 'u i2p 985 "I2P Router" /opt/i2p /bin/sh' |
    install -Dm644 /dev/stdin "usr/lib/sysusers.d/i2p.conf"
    echo 'd /run/i2p 0700 i2p i2p' |
    install -Dm644 /dev/stdin "usr/lib/tmpfiles.d/i2p.conf"

    sed -i opt/i2p/eepget \
        -e 's:%INSTALL_PATH:/opt/i2p:g'
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    rm -r opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper*}
}
