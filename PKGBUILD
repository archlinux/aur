# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Christopher Reimer <github@creimer.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+3.0, repo=zesty
# vercheck-archlinux: name=gtk3, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=3.22
# vercheck-ppa: name=gtk+3.0, url=ppa:gnome3-team/gnome3-staging

_use_ppa=true

pkgname=gtk3-ubuntu
_ubuntu_rel=0ubuntu1~ubuntu16.10.1
pkgver=3.22.2
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(adwaita-icon-theme at-spi2-atk atk cairo colord desktop-file-utils gdk-pixbuf2 gtk-update-icon-cache json-glib libcups libepoxy librsvg libxcomposite libxcursor libxdamage libxi libxinerama libxkbcommon  libxrandr pango rest shared-mime-info wayland wayland-protocols)
makedepends=(gobject-introspection gtk-doc libcanberra)
optdepends=('libcanberra: gtk3-widget-factory demo')
provides=("gtk3=${pkgver}")
conflicts=(gtk3)
license=(LGPL)
source=("https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
	0001-gdkscreen-x11-Fix-screen-and-monitor-size-calculatio.patch        
	settings.ini
        gtk-query-immodules-3.0.hook)

if [[ "${_use_ppa}" != "true" ]]; then
  source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
else
  source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('edf8c3fa858d87605df1d244d5103a2d4cabbbe3aa4213220342ad84fd595df94fa5526db5b51a3d89bba1e3548d47d9c15dbb68a8ae3bcd99ebfa333797a2ee'
            '6c41ac66f8e3df4ed630f31733b5dd67fe85db79fe713f3b645a8c16e80bf04eaadb0cb05e18d03d26d72eff39db2d534bb247b5c95190381f22f2f3f673f756'
            'ad2c0b0388f4169592b9574f0b3db673a969b7c4721548c4ac7c438eddbcdc378fcaac04e2b6c858a1562cc23ddf4804e5f7be08068340b7c9365e2b11ddcfb8'
            'f0ffd95544863f2e10fda81488b4727aa9a8a35a7d39fb96872db6664d03442db2b58af788b5990825c7b3a83681f7220ca481409cca5421dfb39b9a3bbac9ac'
            '165c881c7195eefabde0d0d99e7ff4553725a4dd12299ff42e96d5eeacc29a0d589ff8cbeec5cbe01599f04dbf94b4082e6da4e7d1fc2cc911c293dc9b6ad31c')

prepare() {
    cd "gtk+-${pkgver}"

    patch -p1 -i ../0001-gdkscreen-x11-Fix-screen-and-monitor-size-calculatio.patch

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
