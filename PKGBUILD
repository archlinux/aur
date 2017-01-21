# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Christopher Reimer <github@creimer.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+3.0, repo=zesty
# vercheck-archlinux: name=gtk3, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=3.22
# vercheck-ppa: name=gtk+3.0, url=ppa:gnome3-team/gnome3-staging

_use_ppa=true

pkgname=gtk3-ubuntu
_ubuntu_rel=1ubuntu1~ubuntu16.10.1
pkgver=3.22.7
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(adwaita-icon-theme at-spi2-atk atk cairo colord desktop-file-utils gdk-pixbuf2 
	gtk-update-icon-cache json-glib libcups libepoxy librsvg libxcomposite libxcursor
	libxdamage libxi libxinerama libxkbcommon libxrandr pango rest shared-mime-info wayland
	wayland-protocols)
makedepends=(gobject-introspection gtk-doc libcanberra)
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

sha512sums=('f1969612a89c67fb0414843f3cc51ce91894c9fdfdf6b6e00472d761848b5b1be529d35f2da43c26d345e4b39e81980d2de53d16f194d96775ba21f3c6d0926c'
            'ad2c0b0388f4169592b9574f0b3db673a969b7c4721548c4ac7c438eddbcdc378fcaac04e2b6c858a1562cc23ddf4804e5f7be08068340b7c9365e2b11ddcfb8'
            'f0ffd95544863f2e10fda81488b4727aa9a8a35a7d39fb96872db6664d03442db2b58af788b5990825c7b3a83681f7220ca481409cca5421dfb39b9a3bbac9ac'
            '2bc7fb9828393149327f448e9992b70ac4fc9ede3abd8de9a2700cb26be4203d4a77a075300c6dd3b46aa3bd777bfe6b95e50065341061f618158011cb01aeb2')

prepare() {
    cd "gtk+-${pkgver}"

    local patches=(
        016_no_offscreen_widgets_grabbing.patch
        017_no_offscreen_device_grabbing.patch
        060_ignore-random-icons.patch
        073_treeview_almost_fixed.patch
        074_eventbox_scroll_mask.patch
        no-accessibility-dump.patch
        bzg_gtkcellrenderer_grabbing_modifier.patch
        ubuntu_gtk_custom_menu_items.patch
        print-dialog-show-options-of-remote-dnssd-printers.patch
        uimanager-guard-against-nested-node-updates.patch
        x-canonical-accel.patch
        message-dialog-restore-traditional-look-on-unity.patch
        0001-calendar-always-emit-day-selected-once.patch
        0001-gtkwindow-set-transparent-background-color.patch
        ubuntu_fileselector_behaviour.patch
        unity-border-radius.patch
        unity-headerbar-maximized-mode.patch
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
        --enable-wayland-backend \
        --enable-gtk-doc

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

    cd "$pkgdir"
    for _f in usr/lib/*/*/printbackends/*; do
        case $_f in
            *-file.so|*-lpr.so) continue ;;
            *) rm "${_f}" ;;
        esac
    done
}
