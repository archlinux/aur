# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Christopher Reimer <github@creimer.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+3.0, repo=xenial
# vercheck-archlinux: name=gtk3, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=3.20
# vercheck-ppa: name=gtk+3.0, url=ppa:gnome3-team/gnome3-staging

_use_ppa=true

pkgname=gtk3-ubuntu
_ubuntu_rel=1ubuntu0~ppa1
pkgver=3.20.8
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libcups libxcursor libxinerama libxrandr libxi libepoxy
         gdk-pixbuf2 libxcomposite libxdamage pango shared-mime-info colord
         at-spi2-atk wayland libxkbcommon adwaita-icon-theme json-glib rest
         librsvg wayland-protocols desktop-file-utils gtk-update-icon-cache)
makedepends=(gobject-introspection libcanberra gtk-doc)
optdepends=('libcanberra: gtk3-widget-factory demo')
provides=("gtk3=${pkgver}")
conflicts=(gtk3)
license=(LGPL)
source=("https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
        settings.ini
        gtk-query-immodules-3.0.hook)

if [[ "${_use_ppa}" != "true" ]]; then
  source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
else
  source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('9f5d29dc0ec06ce28f8b45da2e39e1d4e50cdd6b98bd0355b62c62a76aa868b596e113d68d99875b3ac18dc07d08d3fa4d6f8d3b69b61fdb3de0b244f5bb0cb5'
            'ad2c0b0388f4169592b9574f0b3db673a969b7c4721548c4ac7c438eddbcdc378fcaac04e2b6c858a1562cc23ddf4804e5f7be08068340b7c9365e2b11ddcfb8'
            'f0ffd95544863f2e10fda81488b4727aa9a8a35a7d39fb96872db6664d03442db2b58af788b5990825c7b3a83681f7220ca481409cca5421dfb39b9a3bbac9ac'
            '4034bce60e78a59d9982e315b4ec89b3c703f792d38c7c2020ae5096b60156798d872ad2db80f0c5055648e4ed600a85bd9bc1b6f7bec757635e61d991b608d4')

prepare() {
    cd "gtk+-${pkgver}"

    local patches=(
        016_no_offscreen_widgets_grabbing.patch
        017_no_offscreen_device_grabbing.patch
        060_ignore-random-icons.patch
        073_treeview_almost_fixed.patch
        074_eventbox_scroll_mask.patch
        bzg_gtkcellrenderer_grabbing_modifier.patch
        ubuntu_gtk_custom_menu_items.patch
        print-dialog-show-options-of-remote-dnssd-printers.patch
        uimanager-guard-against-nested-node-updates.patch
        x-canonical-accel.patch
        message-dialog-restore-traditional-look-on-unity.patch
        restore_filechooser_typeaheadfind
        0001-calendar-always-emit-day-selected-once.patch
        0001-gtkwindow-set-transparent-background-color.patch
        ubuntu_fileselector_behaviour.patch
    )

    for i in "${patches[@]}"; do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "gtk+-${pkgver}"

    CXX=/bin/false ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "gtk+-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -Dm644 ../settings.ini \
        "${pkgdir}"/usr/share/gtk-3.0/settings.ini
    install -Dm644 ../gtk-query-immodules-3.0.hook \
        "${pkgdir}"/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook

    rm "${pkgdir}"/usr/bin/gtk-update-icon-cache
}
