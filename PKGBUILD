# Maintainer: chenss <ufbycd@163.com>

pkgname=eclipse-embedcpp
pkgver=4.22
_release=2021-12
_src=$pkgname-$_release-R-linux-gtk-x86_64.tar.gz
pkgrel=1
pkgdesc="Embedded C/C++ Development Environment(Chinese Mirror)"
arch=('x86_64')
url="www.eclipse.org"
license=('EPL')
groups=()
depends=("java-runtime>=11")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://mirrors.ustc.edu.cn/eclipse/technology/epp/downloads/release/$_release/R/$_src")
md5sums=('6a6b91906b049d166d02cbd9e0a07016')

prepare() {
    # remove jre
    sed -i -e '15c /usr/bin' eclipse/eclipse.ini
    rm -rf eclipse/plugins/org.eclipse.justj.openjdk.hotspot.jre.*
}

package() {
    install -d "$pkgdir/usr/share/$pkgname"
    cp -af eclipse/* "$pkgdir/usr/share/$pkgname"

    install -D /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/share/$pkgname
exec \$ECLIPSE_HOME/eclipse "\$@"
END

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Name=Eclipse-Embedcpp
Comment=Embedded C/C++ Development Environment
Icon=/usr/share/$pkgname/icon.xpm
Exec=/usr/share/$pkgname/eclipse
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END
}
