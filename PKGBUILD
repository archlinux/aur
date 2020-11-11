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
# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=openbox-debian
_pkgname=openbox
pkgver=3.6.1
pkgrel=2
pkgdesc='Openbox with Patches from Debian.'
arch=('i686' 'x86_64')
url='http://openbox.org'
license=('GPL')
provides=('libobrender.so' $_pkgname 'openbox')
conflicts=($_pkgname)
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr'
         'libxcursor' 'pango' 'imlib2' 'librsvg' 'libsm')
optdepends=('gnome-panel: for the openbox gnome session '
            'plasma-workspace: for the KDE/Openbox xsession'
            'python-xdg: for the openbox-xdg-autostart script')
makedepends=('automake-1.11' 'docbook-to-man')
groups=('lxde' 'lxde-gtk3' 'lxqt')
backup=('etc/xdg/openbox/menu.xml'
        'etc/xdg/openbox/rc.xml'
        'etc/xdg/openbox/autostart'
        'etc/xdg/openbox/environment')
source=("http://openbox.org/dist/openbox/${_pkgname}-${pkgver}.tar.gz"
        "http://http.debian.net/debian/pool/main/o/openbox/openbox_3.6.1-9.debian.tar.xz")
md5sums=('b72794996c6a3ad94634727b95f9d204'
         'c3d0b24f7a5cd615b1d951cb0031c60c')

prepare() {
    cd "${_pkgname}-${pkgver}"
    
     local patches=(
        01_rc.xml.patch
        02_fix_freedesktop_compliance.patch
        04_fix_xml_load_file.patch
        05_openbox-3.5.0-title-matching.patch
        06_openbox-3.5.0-which-2.20.patch
        07_update_desktop.patch
        08_autostart-fix.patch
        704724_fix_refers-to-autostart.sh.patch
        719620_fix_show_startup_notification.patch
        754207_use-scrot.patch
        808138_Replace-getgrent-with-getgroups.patch
        d9a405e9.patch
        fix-spelling-error-in-binary.patch
        adapt-to-gsd-324.patch
        843231.patch
        09-disable-check-gnome-version.patch
        887908.patch
        917204_undecorated_maximized_no_border.patch
        python3.patch
    )

    for i in "${patches[@]}"; do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done
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

    sed -i 's:startkde:/usr/bin/\0:' \
        "${pkgdir}/usr/share/xsessions/openbox-kde.desktop"
}
