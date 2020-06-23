# Based on the file created for Arch Linux by:
# Eli Schwartz <eschwartz@archlinux.org>

pkgname=cinnamon-control-center-slim
pkgver=4.6.1
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname%-*}"
license=('GPL')
provides=("cinnamon-control-center=$pkgver")
conflicts=('cinnamon-control-center')
replaces=('cinnamon-control-center')
depends=('cinnamon-settings-daemon' 'cinnamon-menus' 'colord' 'libgnomekbd')
optdepends=('cinnamon-translations: i18n'
            'gnome-color-manager: for color management tasks')
makedepends=('intltool' 'python')
options=('!emptydirs')
source=("${pkgname%-*}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/${pkgname%-*}-${pkgver}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/${pkgname%-*}-${pkgver}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --enable-systemd \
                --disable-modemmanager \
                --disable-networkmanager \
                --disable-onlineaccounts \
                --disable-documentation

    #https://bugzilla.gnome.org/show_bug.cgi?id=656229
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
    make
}

package() {
    cd "${srcdir}"/${pkgname%-*}-${pkgver}

    # https://github.com/linuxmint/Cinnamon/pull/7382#issuecomment-374894901
    # /usr/bin/cinnamon-control-center is not meant for users, it is a development troubleshooting tool.
    # Just install the shell libs/headers.
    make -C shell  DESTDIR="${pkgdir}" install-{libcinnamon_control_center_includeHEADERS,libLTLIBRARIES,pkgconfigDATA}
    make -C panels DESTDIR="${pkgdir}" install

    install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
}
