# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-control-center:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>

pkgname=cinnamon-control-center-git
pkgver=4.4.0.r6.g2398dbe
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('cinnamon-settings-daemon>=4.4.0.r9.g206ce2d' 'cinnamon-menus' 'colord'
         'libgnomekbd' 'libmm-glib' 'nm-connection-editor')
optdepends=('cinnamon-translations: i18n'
            'gnome-color-manager: for color management tasks'
            'gnome-online-accounts: for the online accounts module')
makedepends=('git' 'gnome-online-accounts' 'intltool' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --enable-systemd

    #https://bugzilla.gnome.org/show_bug.cgi?id=656229
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
    make
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    # https://github.com/linuxmint/Cinnamon/pull/7382#issuecomment-374894901
    # /usr/bin/cinnamon-control-center is not meant for users, it is a development troubleshooting tool.
    # Just install the shell libs/headers.
    make -C shell  DESTDIR="${pkgdir}" install-{libcinnamon_control_center_includeHEADERS,libLTLIBRARIES,pkgconfigDATA}
    make -C panels DESTDIR="${pkgdir}" install

    install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
}
