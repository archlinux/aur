# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Christopher Reimer <github@creimer.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+3.0, repo=bionic
# vercheck-archlinux: name=gtk3, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=3.22
# vercheck-ppa: name=gtk+3.0, url=ppa:gnome3-team/gnome3-staging

_use_ppa=true

pkgname=gtk3-ubuntu
_ubuntu_rel=2ubuntu1
pkgver=3.22.26
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(adwaita-icon-theme at-spi2-atk atk cairo cantarell-fonts dconf desktop-file-utils
	gdk-pixbuf2 gtk-update-icon-cache json-glib libepoxy librsvg libxcomposite libxcursor
	libxdamage libxi libxinerama libxkbcommon libxrandr mesa pango shared-mime-info wayland
	wayland-protocols gtk-update-icon-cache)
makedepends=(colord gobject-introspection git gtk-doc libcanberra rest libcups glib2-docs sassc)
license=(LGPL)
_commit=3a1a7135a276f2b6336c7566f6342da739a41d39  # gtk-3-22
source=("git+https://git.gnome.org/browse/gtk+#commit=$_commit"
	0001-entry-Undo-ABI-breakage-from-addition-of-insert_emoj.patch
	ubuntu_gtk_custom_menu_items.patch
	settings.ini
        gtk-query-immodules-3.0.hook
	gtk-update-icon-cache.hook
	gtk-update-icon-cache.script)

source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")

sha512sums=('SKIP'
            'aa57f33b55ef858e9ddb305c01ddd4c995c6cbb0ea429844e5b6e77321192909090e6f77de7d4484c46838bdba989105bfefdff594f46dc80544820bcffcfb46'
            'd369ea456ee48c371506dedc5e0ca8d60d9bcca9362dc76caaa4d70adf67b32524aabcb2383136cbbf023dadcba0c54a37db25cde89944d1cfe2ae7ac8bd9258'
            'ad2c0b0388f4169592b9574f0b3db673a969b7c4721548c4ac7c438eddbcdc378fcaac04e2b6c858a1562cc23ddf4804e5f7be08068340b7c9365e2b11ddcfb8'
            'f0ffd95544863f2e10fda81488b4727aa9a8a35a7d39fb96872db6664d03442db2b58af788b5990825c7b3a83681f7220ca481409cca5421dfb39b9a3bbac9ac'
            'abfd73de4faa6f53784182800395aa3c39bb98e15a0eb300fb4142073ff7ce565a0836a2363393b2f132060b5293dbc0c30c380a023f38d5bd39c62cb58389c2'
            '5cd50d93bb6bc203438a2a0764bd717409658e124058b18a1da26a21f10ef7564a16f32fc0633a68b45b2e303fa63a5efefeadd6b0bf1d7f474556df8cdb6c58'
            '7b31b41ec7b0b96b69d55bc782921d57cc3329faade0c81522c9ae2be9a143e8a5edfd8ed57c84db404f7301ed89ea59b3d6defec34aa968cc9de8b0f35dd6f7')

pkgver() {
  cd gtk+
  git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd gtk+

    # https://bugs.archlinux.org/task/56474
    patch -Np1 -i ../0001-entry-Undo-ABI-breakage-from-addition-of-insert_emoj.patch

    local patches=(
        016_no_offscreen_widgets_grabbing.patch
        017_no_offscreen_device_grabbing.patch
        060_ignore-random-icons.patch
        073_treeview_almost_fixed.patch
        no-accessibility-dump.patch
        bzg_gtkcellrenderer_grabbing_modifier.patch
        print-dialog-show-options-of-remote-dnssd-printers.patch
	ubuntu_gtk_custom_menu_items.patch
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
    cd gtk+

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
    provides=(gtk3-print-backends)
    conflicts=(gtk3-print-backends)
    replaces=("gtk3-print-backends<=3.22.26-1")
    install=gtk3.install

    cd gtk+
    make DESTDIR="${pkgdir}" install

    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
    install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"

}

