# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Christopher Reimer <github@creimer.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgbase=gtk3-ubuntu
pkgname=(gtk3-ubuntu gtk-update-icon-cache-ubuntu)
_ubuntu_ver=3.24.17
_ubuntu_rel=3ubuntu1
pkgver=3.24.17
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(x86_64)
url="http://www.gtk.org/"
depends=(adwaita-icon-theme at-spi2-atk atk cairo cantarell-fonts colord dconf desktop-file-utils gdk-pixbuf2 gtk-update-icon-cache json-glib libcanberra libcups libepoxy librsvg libxcomposite libxcursor libxdamage libxi libxinerama libxkbcommon libxrandr mesa pango rest shared-mime-info wayland wayland-protocols gtk-update-icon-cache)
makedepends=(gobject-introspection git gtk-doc glib2-docs sassc)
license=(LGPL)
_commit=f737908d2f7dc121e0d85507c16fd7a399d4b36a  # tags/3.24.17^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#tag=$pkgver"
	settings.ini
	gtk-query-immodules-3.0.hook
	gtk-update-icon-cache.hook
	gtk-update-icon-cache.script)

source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")

sha512sums=('SKIP'
            'ad2c0b0388f4169592b9574f0b3db673a969b7c4721548c4ac7c438eddbcdc378fcaac04e2b6c858a1562cc23ddf4804e5f7be08068340b7c9365e2b11ddcfb8'
            'f0ffd95544863f2e10fda81488b4727aa9a8a35a7d39fb96872db6664d03442db2b58af788b5990825c7b3a83681f7220ca481409cca5421dfb39b9a3bbac9ac'
            'abfd73de4faa6f53784182800395aa3c39bb98e15a0eb300fb4142073ff7ce565a0836a2363393b2f132060b5293dbc0c30c380a023f38d5bd39c62cb58389c2'
            '5cd50d93bb6bc203438a2a0764bd717409658e124058b18a1da26a21f10ef7564a16f32fc0633a68b45b2e303fa63a5efefeadd6b0bf1d7f474556df8cdb6c58'
            'b2661d8d1ad5d78dbffb6a60763f1ee8188003907827c9d34fca25a76c20404a61dfc3e5de017a6d959ce47d20181a3944f74cb9e27cd240b118a93a74417caa')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd gtk

    local patches=(
       macOS-fix-2436-raise-transient-window-on-focus.patch
       Update-Latvian-translation.patch
       docs-Do-not-call-GTK-APIs-if-gtk_init_check-returns-FALSE.patch
       Update-Basque-translation.patch
       Do-not-require-an-initial-configure-for-custom-Wayland-su.patch
       Do-not-require-an-initial-configure-for-DnD-windows.patch
       wayland-Use-helpers-to-add-remove-margins-from-sizes.patch
       wayland-Always-update-unconfigured-size.patch
       wayland-Store-unconfigured-size-without-margin.patch
       wayland-Guard-against-nonsense-sizes-being-configured.patch
       wayland-Set-unconfigured-size-on-impl-construction.patch
       wayland-Don-t-inhibit-premature-resize-for-popups.patch
       build-Generate-gdk.gresource.xml-in-sorted-order.patch
       wayland-Always-store-unconfigured-size.patch
       updateiconcache-Sort-list-of-entries.patch
       gdk-Don-t-distribute-generated-files-in-tarballs.patch
       gtk-Really-don-t-distribute-built-files.patch
       demos-examples-tests-Don-t-distribute-built-files.patch
       016_no_offscreen_widgets_grabbing.patch
       017_no_offscreen_device_grabbing.patch
       060_ignore-random-icons.patch
       reftest-known-fail.patch
       Disable-accessibility-dump-aka-a11ytests-test.patch
       073_treeview_almost_fixed.patch
       bzg_gtkcellrenderer_grabbing_modifier.patch
       ubuntu_gtk_custom_menu_items.patch
       print-dialog-show-options-of-remote-dnssd-printers.patch
       uimanager-guard-against-nested-node-updates.patch
       x-canonical-accel.patch
       message-dialog-restore-traditional-look-on-unity.patch
       0001-gtk-reftest-Force-icon-theme-to-Adwaita.patch
       0001-calendar-always-emit-day-selected-once.patch
       0001-gtkwindow-set-transparent-background-color.patch
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
    cd gtk

    CXX=/bin/false ./configure --prefix=/usr \
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

package_gtk3-ubuntu() {
    depends+=(gtk-update-icon-cache)
    provides=(gtk3=$pkgver gtk3-print-backends
              libgtk-3.so libgdk-3.so libgailutil-3.so )
    conflicts=(gtk3 gtk3-print-backends)
    replaces=("gtk3-print-backends")
    install=gtk3.install

    cd gtk
    make DESTDIR="$pkgdir" install

    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
    install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

    # split this out to use with gtk2 too
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

package_gtk-update-icon-cache-ubuntu() {
    pkgdesc="GTK+ icon cache updater"
    provides=(gtk-update-icon-cache)
    conflicts=(gtk-update-icon-cache)
    depends=(gdk-pixbuf2 librsvg hicolor-icon-theme)

    cd gtk
    install -D gtk/gtk-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
    install -Dm644 ../gtk-update-icon-cache.hook "$pkgdir/usr/share/libalpm/hooks/gtk-update-icon-cache.hook"
    install -D ../gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

