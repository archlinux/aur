# Maintainer: Antoni Michał Przybylik <antoni@taon.io>

_channel=stable
pkgname="ibgateway-stable"
provides=('ibgateway')
conflicts=('ibgateway')
_version_short=10.50
pkgver="$_version_short".1e
pkgrel=1
pkgdesc='InteractiveBrokers Gateway - Stable'
arch=('x86_64')
url='https://www.interactivebrokers.com/en/trading/ibgateway-stable.php'
license=('custom:proprietary')
depends=('jdk-openjdk')
optdepends=()
source=("https://download2.interactivebrokers.com/installers/ibgateway/$_channel-standalone/ibgateway-$_channel-standalone-linux-x64.sh")
sha512sums=('9598d35b4df6b77fba1435fb8a70e6021ae28bca4a0770d781eb30991015f515b218d5a07a00e5884d5fca99adb17369919136d637adb93c36cbe01907c875e0')
options=('!strip' '!debug')

prepare() {
    local isolated_home="$srcdir/isolated_home"
    mkdir -p "$isolated_home" 
    env HOME="$isolated_home" sh "./ibgateway-$_channel-standalone-linux-x64.sh" -q -dir "$srcdir/ibgateway" -overwrite
    rm -rf "$isolated_home"

    sed -i "s|$srcdir/ibgateway|/opt/ibgateway|" \
        "$srcdir/ibgateway/ibgateway.vmoptions" \
        "$srcdir/ibgateway/.install4j/response.varfile" \
        "$srcdir/ibgateway/.install4j/install.prop" \
        "$srcdir/ibgateway/.install4j/files.log"

    rm -f "$srcdir/ibgateway/.install4j/installation.log"
    rm -f "$srcdir/ibgateway/.install4j/install4j_"*"-ibgateway.desktop"
}

package() {
    cd ${srcdir}

    install -d "$pkgdir/opt/ibgateway"
    cp -a $srcdir/ibgateway/. "$pkgdir/opt/ibgateway"

    chmod 755 "$pkgdir/opt/ibgateway"

    install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
    ln -s /opt/ibgateway/ibgateway "$pkgdir"/usr/bin/ibgateway
    ln -s /opt/ibgateway/.install4j/ibgateway.png "$pkgdir"/usr/share/pixmaps/ibgateway.png

    rm -f "$pkgdir/opt/ibgateway/IB Gateway $_version_short.desktop" 2>/dev/null || true
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ibgateway.desktop" <<EOF
[Desktop Entry]
Name=IB Gateway
Comment=Interactive Brokers Gateway
Exec=/opt/ibgateway/ibgateway %U
Icon=/opt/ibgateway/.install4j/ibgateway.png
Terminal=false
Type=Application
Categories=Finance;
StartupWMClass=install4j-ibgateway-GWClient
EOF
}
