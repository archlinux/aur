# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Christopher Reimer <github@creimer.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=gtk3-ubuntu
_ubuntu_ver=3.24.34
_ubuntu_rel=3ubuntu2
_import_pkgver=3.24.34
pkgver=3.24.34
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit"
arch=(x86_64)
url="http://www.gtk.org/"
depends=(adwaita-icon-theme {at-spi2-,}atk cairo cantarell-fonts dconf
desktop-file-utils fribidi iso-codes gdk-pixbuf2 gtk-update-icon-cache
lib{cloudproviders,colord,cups,epoxy,rsvg,xcomposite,xcursor,xdamage,xi,xinerama,xkbcommon,xrandr}
mesa pango shared-mime-info tracker3 wayland)
makedepends=(gobject-introspection git gtk-doc glib2-docs sassc meson wayland-protocols)
license=(LGPL)
_commit=4e3a3f05533789e1a68c70c185e1755d386d6c47 # tags/3.24.34^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        add_ubuntu_headers_to_meson_build.patch)
source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${import_pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha256sums=('SKIP'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '5d283c23657a2301fec22cec5130ea7d5edb659e0e50e7a2a5e87fea234893af'
            'c0ad9402a78d621d20c7e0887980be11a7fab326394cf47d0760132c2a2675ab')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  local patches=(
   #updateiconcache-Sort-list-of-entries.patch
   gdk-Don-t-distribute-generated-files-in-tarballs.patch
   gtk-Really-don-t-distribute-built-files.patch
   demos-examples-tests-Don-t-distribute-built-files.patch
   016_no_offscreen_widgets_grabbing.patch
   017_no_offscreen_device_grabbing.patch
   060_ignore-random-icons.patch
   #reftest-known-fail.patch
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

  #Ubuntu is still using autoconf, push ahead to meson
  patch -Np1 < ../add_ubuntu_headers_to_meson_build.patch
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D tracker3=true
    -D colord=yes
    -D gtk_doc=true
    -D man=true
  )

  arch-meson gtk build "${meson_options[@]}"

  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gtk3-ubuntu() {
  optdepends=('evince: Default print preview command')
  provides=(gtk3{,-print-backends}=$pkgver lib{gtk,gdk,gailutil}-3.so)
  conflicts=(gtk3{,-print-backends})
  replaces=("gtk3-print-backends<=3.22.26-1")
  install=gtk3.install

  meson install -C build --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  cd "$pkgdir"

  rm usr/bin/gtk-update-icon-cache
  rm usr/share/man/man1/gtk-update-icon-cache.1

  _pick docs usr/share/gtk-doc

  _pick demo usr/bin/gtk3-{demo,demo-application,icon-browser,widget-factory}
  _pick demo usr/share/applications/gtk3-{demo,icon-browser,widget-factory}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.{Demo,exampleapp}.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/gtk3-{demo,widget-factory}[-.]*
  _pick demo usr/share/man/man1/gtk3-{demo,demo-application,icon-browser,widget-factory}.1
}
