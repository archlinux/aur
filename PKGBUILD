# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Christopher Reimer <github@creimer.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+2.0, repo=bionic
# vercheck-archlinux: name=gtk2, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=2.24

pkgname=gtk2-ubuntu
_ubuntu_rel=1ubuntu1
_ubuntu_ver=2.24.32
pkgver=2.24.32
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy)"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(LGPL)
depends=(atk cairo desktop-file-utils gtk-update-icon-cache libcups librsvg libxcomposite 
         libxcursor libxdamage libxi libxinerama libxrandr pango shared-mime-info)
makedepends=(gobject-introspection gtk-doc python2)
optdepends=('adwaita-icon-theme: Default icon theme'
	    'gnome-themes-standard: Default widget theme')
provides=("gtk2=${pkgver}")
conflicts=(gtk2)
install=gtk2.install
_commit=ed7d3e25f8b6debae6ccc8b50d1329155338cab8  # tags/2.24.32^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gtk+2.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz"
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch)
sha512sums=('SKIP'
            '5a82542c2f3d71f10fdc828d846e5a76e85eac7c28314aa865b036b908a8bf14cfe598c6220be7e6f5096cd2a1174051af8b6a97ca9d7d926e0c20289b2c6b4f'
            'b124433dd4b20d1d62f073df87e253ca23b3b51625cce55f29a220a4369eda5108c0de07fdc686f570232322c3ff04f7758383f2be5aeace40f843907aa3696d'
            'be7a807046f27e5796f6069dfd2c88f9b7508e3b9e209d97c1575e0d809b279aacacd0e1247f1f7643fa47eede2d987bf433cd17cea0524526ad31982ae8d90d'
            '89e3223c86731a76b12d39245f1ec4cf8b4860ab1d11d74a10e5deb0db302f20b4bb5d9034da1d8aeb96369dbdeddcdd2f28943270dc501476c694562b960159')

pkgver() {
    cd gtk
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd gtk
    patch -Np1 -i ../xid-collision-debug.patch
    sed -i '1s/python$/&2/' gtk/gtk-builder-convert

    local patches=(
        004_gtk+-ximian-gtk2-filesel-navbutton-5.patch
        012_ubuntu-set-grab-add.patch
        042_treeview_single-focus.patch
        060_ignore-random-icons.patch
        061_use_pdf_as_default_printing_standard.patch
        062_dnd_menubar.patch
        063_treeview_almost_fixed.patch
        071_no_offscreen_widgets_grabbing.patch
        090_logging_file_saves.patch
        092_default_to_xdg_document_dir.patch
        093_gtk3_gtkimage_fallbacks_use.patch
        096_git_gtkprintsettings.patch
        097_statusicon_image_fallback.patch
        099_printer_filename_fix.patch
        100_overlay_scrollbar_loading.patch
        print-dialog-show-options-of-remote-dnssd-printers.patch
        gtk-shell-shows-menubar.patch
        backport_search_printer_location.patch
        menubar_toolbar_dragging.patch        
    )

    for i in "${patches[@]}"; do
        msg "Applying ${i}"
        patch -p1 -i "../debian/patches/${i}"
    done

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes \
        --enable-gtk-doc \
        --enable-test-print-backend

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk
    make DESTDIR="$pkgdir" install

    install -Dt "$pkgdir/usr/share/gtk-2.0" -m644 ../gtkrc
    install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-2.0.hook

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
