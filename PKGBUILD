# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Christopher Reimer <github@creimer.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=gtk3-ubuntu
_ubuntu_ver=3.24.38
_ubuntu_rel=5ubuntu2
_import_pkgver=3.24.38
pkgver=3.24.38
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
_commit=3e6fd55ee00d4209ce2f2af292829e4d6f674adc # tags/3.24.38^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        add_ubuntu_headers_to_meson_build.patch)
source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${import_pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha256sums=('SKIP'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '5d283c23657a2301fec22cec5130ea7d5edb659e0e50e7a2a5e87fea234893af'
            'd6c6614a2c9915dc728745d225970ab9eac7f1b973cdf60afd4fd1c827f4cc84')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  local patches=(
  Use-correct-stat-struct-for-ftw.patch
  Make-sure-that-the-charcode-is-signless.patch
  Update-Turkish-translation.patch
  Fix-a-typo.patch
  This-commit-fixes-a-performance-issue-on-X11-systems-in-r.patch
  x11-Trap-XRandr-errors-when-getting-outputs-during-init-a.patch
  gtkmountoperation-avoid-SEGV-after-bad-password-input.patch
  ScrolledWindow-Frame-on-viewport-is-not-optional.patch
  popover-Remove-useless-if-case.patch
  Popover-Clarify-guard-out-rect-of-get_pointing_to.patch
  Update-Czech-translation.patch
  Update-Slovak-translation.patch
  gdk-wayland-Create-pad-devices-on-enter.patch
  gdk-wayland-Ensure-device-added-removed-emission-in-GdkSe.patch
  gdk-wayland-Return-pad-devices-querying-for-all-devices.patch
  Update-Catalan-translation.patch
  Update-British-English-translation.patch
  gdkgl-Check-for-GLsync-before-using-it.patch
  gdk-wayland-Switch-behavior-of-BTN_STYLUS-STYLUS2-as-midd.patch
  a11y-atspi-Fix-reporting-table-cell-pos-at-index-0-0.patch
  GdkWindow-Check-for-offscreen-windows-in-set_transient_fo.patch
  GtkMenu-Take-offscreen-windows-in-account-for-positioning.patch
  Update-fa.po.patch
  Update-Spanish-translation.patch
  GtkApplicationImplDBus-Cancel-DBus-method-calls-on-shutdo.patch
  Update-Greek-translation.patch
  Update-Slovenian-translation.patch
  Update-Romanian-translation.patch
  Update-Turkish-translation-1.patch
  Update-Turkish-translation-2.patch
  Update-Georgian-translation.patch
  Update-Kazakh-translation.patch
  Update-Georgian-translation-1.patch
  Update-fa.po-1.patch
  Fix-_gtk_get_slowdown.patch
  Update-Punjabi-translation.patch
  Update-Georgian-translation-2.patch
  Update-Korean-translation.patch
  016_no_offscreen_widgets_grabbing.patch
  017_no_offscreen_device_grabbing.patch
  060_ignore-random-icons.patch
  reftest_compare_surfaces-Report-how-much-the-images-diffe.patch
  reftests-Allow-minor-differences-to-be-tolerated.patch
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
  gitlab_opengl_fallback.patch
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
