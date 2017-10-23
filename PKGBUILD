# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=cryspmds
pkgver=1
pkgrel=6
pkgdesc='CrySP Multidevice Study'
arch=('any')
url='https://cryspmds.erinn.io/'
depends=(
    'java-runtime'
    'java-openjfx'
    'wireless_tools'
)
makedepends=(
    'java-environment'
)
optdepends=(
    'gnome-shell-extension-topicons-plus: restore system tray on GNOME (application requires a system tray to run)'
)
source=('https://cryspmds.erinn.io/dl/cryspmds.deb' 'SystemTrayIsSupported.java')
sha256sums=('8b84d3bb273daaa8398a823d767c242c7b2b546ea33c41613978cf48890b57ad' 'eea3b1e190509832d3a80f7cff3fd648c2f0d2625b1ed41e7046424a79a5b8ee')
install=$pkgname.install

prepare() {
    mkdir -p control data
    tar xf control.tar.gz -C control
    tar xf data.tar.xz -C data
}

build() {
    sed -i "
/^Icon=/ s|usr/local/bin/logo48.png|usr/share/icons/$pkgname.png|
/^Exec=/ s|usr/local/bin/run|usr/bin/java -jar /usr/share/java/$pkgname/$pkgname.jar|
/^Exec=/ a Path=/usr/share/$pkgname/
" "data/usr/local/bin/$pkgname.desktop"

    javac SystemTrayIsSupported.java
}

package() {
    install -Dm644 "data/usr/local/bin/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm644 "SystemTrayIsSupported.class" "$pkgdir/usr/share/java/$pkgname/SystemTrayIsSupported.class"
    install -Dm644 "data/usr/local/bin/logo48.png" "$pkgdir/usr/share/icons/$pkgname.png"
    install -Dm644 "data/usr/local/bin/logo.png" "$pkgdir/usr/share/$pkgname/logo.png"
    install -Dm644 "data/usr/local/bin/logo.png" "$pkgdir/usr/share/$pkgname/logo-medium.png"
    install -Dm644 "data/usr/local/bin/$pkgname.desktop" "$pkgdir/etc/xdg/autostart/$pkgname.desktop"
}
