# Maintainer: MMMaellon <mmmaellon at gmail dot com>
# Openhouse created by YusufOzmen01
pkgname="openhouse-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Drop-in open-source replacement for SteamVR's lighthouse driver"
arch=('x86_64')
url="https://github.com/YusufOzmen01/openhouse"
license=('MIT')
depends=('gcc-libs' 'systemd-libs' 'glfw' 'libglvnd')
optdepends=(
    'python3: registers the update check by editing Steam appconfig.json'
    'libnotify: notify-send warning when a SteamVR update replaces the driver'
    'zenity: warning dialog on GTK desktops'
    'kdialog: same dialog on KDE'
)
options=('!strip' '!debug')
install="openhouse-bin.install"
source=("$pkgname-${pkgver}.tar.gz::https://github.com/YusufOzmen01/openhouse/releases/download/v${pkgver}/openhouse-driver-linux.tar.gz"
        "openhouse-install"
        "openhouse-uninstall"
        "symlink-install.patch")
sha256sums=('a8a7fae7cdc8a8aeb01fd3ffc2f25f08700f503854763354442c706ec705c396'
            '3548c697d2060c7a5507c85d2cac7c8b75a3380c5fe551109a20da184f963052'
            'fa4e3ef11a2b7c38fd4ba6347a4648993db2b787e92d71d93eecd1c374bf9f76'
            'ec7415061be51f1da076b455808a8f21fd4b8958c1201eafce386c2c8c88a148')

prepare(){
    cd "openhouse-driver"
    patch -Np1 -i "$srcdir/symlink-install.patch"
}

package() {
    cd "openhouse-driver"
    
    install -d "$pkgdir/usr/lib/openhouse"
    cp -a . "$pkgdir/usr/lib/openhouse/"

    install -d "$pkgdir/usr/share/licenses/openhouse-bin"
    mv "$pkgdir/usr/lib/openhouse/lh-licenses" "$pkgdir/usr/share/licenses/openhouse-bin/"
    mv "$pkgdir/usr/lib/openhouse/LICENSE.txt" "$pkgdir/usr/share/licenses/openhouse-bin/"
    rm -rf "$pkgdir/usr/share/licenses/openhouse-bin/lh-licenses/systemd"

    install -Dm755 "$srcdir/openhouse-install" "$pkgdir/usr/bin/openhouse-install"
    install -Dm755 "$srcdir/openhouse-uninstall" "$pkgdir/usr/bin/openhouse-uninstall"

    # Upstream ships these with a DT_NEEDED on liblh.so.1. There's no liblh.so.1 in the upstream tarball though, so these are unrunnable
    # They also have some broken runpaths
    rm "$pkgdir/usr/lib/openhouse/tools/lhtool"
    rm "$pkgdir/usr/lib/openhouse/tools/openhouse-compare"
}
