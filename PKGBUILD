# Maintainer: MMMaellon <mmmaellon at gmail dot com>
# Openhouse created by YusufOzmen01
pkgname="openhouse-bin"
pkgver=1.0.2
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
sha256sums=('3bae514ad2a88667187df6da7af309bbff08e519fdfeab63d5d17a0e65df6252'
            '3548c697d2060c7a5507c85d2cac7c8b75a3380c5fe551109a20da184f963052'
            'fa4e3ef11a2b7c38fd4ba6347a4648993db2b787e92d71d93eecd1c374bf9f76'
            '037c2fb60c3ee42cd7f36bb36b2921ef1486a76269dc0dd37eca7f916b08fe5c')

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

    install -Dm755 "$srcdir/openhouse-install" "$pkgdir/usr/bin/openhouse-install"
    install -Dm755 "$srcdir/openhouse-uninstall" "$pkgdir/usr/bin/openhouse-uninstall"
}
