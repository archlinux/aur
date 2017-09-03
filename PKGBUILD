# Maintainer: Dylan Araps <dylan.araps@gmail.com>
#
# Below are the maintainers and contributors of the official
# Arch package that this PKGBUILD is based on.
#
# Maintainer: Florian pritz <bluewind@xinu.at>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>

pkgname=openbox-patched
_pkgname=openbox
pkgver=3.6.1
pkgrel=4
pkgdesc='Openbox with Rounded Corners patch and anything else I deem useful.'
arch=('i686' 'x86_64')
url='http://openbox.org'
license=('GPL')
provides=('libobrender.so' $_pkgname)
conflicts=($_pkgname)
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr'
         'libxcursor' 'pango' 'imlib2' 'librsvg' 'libsm')
optdepends=('plasma-workspace: for the KDE/Openbox xsession'
            'python2-xdg: for the openbox-xdg-autostart script')
groups=('lxde' 'lxde-gtk3' 'lxqt')
backup=('etc/xdg/openbox/menu.xml'
        'etc/xdg/openbox/rc.xml'
        'etc/xdg/openbox/autostart'
        'etc/xdg/openbox/environment')
source=("http://openbox.org/dist/openbox/${_pkgname}-${pkgver}.tar.gz"
        "openbox-3.5.0-title-matching.patch"
        "openbox-3.5.0-which-2.20.patch"
        "openbox-3.6.2-rounded-corners.patch"
        "openbox-3.6.2-fix-out-of-bounds.patch")
md5sums=('b72794996c6a3ad94634727b95f9d204'
         '0a11d7149da210a31ef88f8a9c717711'
         '5be4554431e555084026631898f167aa'
         '3bec0508320653ab33214b3c52bb775e'
         '4c28a1482a2aeb58415cec39f7f3a694')
install="${pkgname}.install"

prepare() {
    cd "${_pkgname}-${pkgver}"

    patch -Np1 -i "${srcdir}/openbox-3.5.0-title-matching.patch"  # OB#5277
    patch -Np1 -i "${srcdir}/openbox-3.5.0-which-2.20.patch"  # FS#11455

    # https://forums.bunsenlabs.org/viewtopic.php?pid=46711#p46711
    patch -Np1 -i "${srcdir}/openbox-3.6.2-rounded-corners.patch"

    # https://github.com/danakj/openbox/pull/26
    patch -Np1 -i "${srcdir}/openbox-3.6.2-fix-out-of-bounds.patch"

    sed -i 's|/usr/bin/env python|/usr/bin/env python2|' \
        data/autostart/openbox-xdg-autostart
}

build() {
    cd "${_pkgname}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --with-x \
        --enable-startup-notification \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/openbox
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # GNOME Panel is no longer available in the official repositories
    rm -r "${pkgdir}/usr/bin/"{gdm-control,gnome-panel-control,openbox-gnome-session} \
          "${pkgdir}/usr/share/gnome"{,-session} \
          "${pkgdir}/usr/share/man/man1/openbox-gnome-session.1" \
          "${pkgdir}/usr/share/xsessions/openbox-gnome.desktop"

    sed -i 's:startkde:/usr/bin/\0:' \
        "${pkgdir}/usr/share/xsessions/openbox-kde.desktop"
}
