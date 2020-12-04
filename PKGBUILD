# Based on the file created for Arch Linux by:
# Eli Schwartz <eschwartz@archlinux.org>

pkgname=cinnamon-control-center-slim
pkgver=4.8.0
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname%-slim}"
license=('GPL')
provides=("cinnamon-control-center=$pkgver")
conflicts=('cinnamon-control-center')
replaces=('cinnamon-control-center')
depends=('cinnamon-settings-daemon' 'cinnamon-menus' 'colord' 'libgnomekbd')
optdepends=('cinnamon-translations: i18n'
            'gnome-color-manager: for color management tasks'
            'gnome-online-accounts: for the online accounts module')
makedepends=('meson' 'samurai')
options=('!emptydirs')
source=("${pkgname%-slim}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')


build() {
    mkdir -p "${srcdir}"/${pkgname%-slim}-${pkgver}/builddir
    cd "${srcdir}"/${pkgname%-slim}-${pkgver}/builddir

    meson --prefix=/usr \
          --buildtype=plain \
          -Dmodemmanager=false \
          -Dnetworkmanager=false \
          -Donlineaccounts=false \
        ..

    samu
}

package() {
    cd "${srcdir}"/${pkgname%-slim}-${pkgver}/builddir

    DESTDIR="${pkgdir}" samu install

    # https://github.com/linuxmint/Cinnamon/pull/7382#issuecomment-374894901
    # /usr/bin/cinnamon-control-center is not meant for users, it is a development troubleshooting tool.
    # Just install the shell libs/headers.
    rm "${pkgdir}"/usr/bin/cinnamon-control-center
    rm "${pkgdir}"/usr/share/cinnamon-control-center/ui/shell.ui
}
