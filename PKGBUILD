# Maintainer: Alexey Korop <akorop@ukr.net>

pkgname=openbox_eui
pkgver=2015.03.31
pkgrel=2
pkgdesc='Highly configurable and lightweight X11 window manager'
arch=('i686' 'x86_64')
url='http://openbox.org'
conflicts=('openbox')
provides=('openbox')
license=('GPL')
makedepends=(binutils git patch libtool automake autoconf m4 make pkg-config gcc fakeroot docbook-to-man)
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr'
         'libxcursor' 'pango' 'imlib2' 'librsvg' 'libsm')
optdepends=('kdebase-workspace: for the KDE/Openbox xsession'
            'python2-xdg: for the openbox-xdg-autostart script')
groups=('lxde')
backup=('etc/xdg/openbox/menu.xml' 'etc/xdg/openbox/rc.xml'
        'etc/xdg/openbox/autostart' 'etc/xdg/openbox/environment')
source=(
'menu_w_def9.patch'
'clm_w_sub6.patch'
'keybind_item.patch'
'keybind_menu2.patch'
'clearclick.patch'
'topmenu_kbd_group.patch'
'import-bind.patch'
'edge_mikabox.patch'
'disable_edges_by_default.patch'
'compact_menu.patch'
'utf8-menu-accelerators.diff'
'topmenu_kbd_group_local.patch'
'strict_skip_taskbar.patch'
'menu.xml'
'rc.xml'
'install'
)
md5sums=(
         '90d3238b062f0631988ef788b8bb3dd6'
         '36545d5c124f0eb648a46fc2779e3dfe'
         '816d283ba870b1c8494691fc3cd41ba2'
         '599e87ae3ce608d5f710075b8e59459a'
         'f42dda01e070fe1f270942c185adefe4'
         '68bf6c7ad5a04ac74b9b5744a2197b17'
         'f10d80373150df6cb08501e6fa6e9c39'
         '1b9192e741ac98a1a541c93e137c0a70'
         '4d5fbf07973c13aaf86db31dacdbc0ae'
         '3718f41d8573d5d2a4cf04536562b93a'
         '6579e6898e3195fb6877e356b2092bba'
         'fabc9f22ebdda17649b7c98fd8fc4d81'
         'e6a16b0be7eac066976fc56ed0bd1b27'
         '1ea5cf52cc72fd7b18f50798d1458baf'
         'e2e2480a2dfe13e93de5fa88c17eaa77'
         'da62476c79a186e0313578963b2ee637'
)

prepare() {
  git clone https://github.com/danakj/openbox.git
  cd openbox
  git reset --hard 9e8813e111cbe6c1088f6abbc771a29470f05fc2
   sed -i 's|/usr/bin/env python|/usr/bin/env python2|' \
    data/autostart/openbox-xdg-autostart
}

build() {
  cd openbox
 echo  menu_w_def9.patch
  patch -p1 < ../menu_w_def9.patch
 echo  clm_w_sub6.patch
  patch -p1 < ../clm_w_sub6.patch
 echo  keybind_item.patch
  patch -p1 < ../keybind_item.patch
 echo  keybind_menu2.patch
  patch -p1 < ../keybind_menu2.patch
 echo  clearclick.patch
  patch -p1 < ../clearclick.patch
 echo  topmenu_kbd_group.patch
  patch -p1 < ../topmenu_kbd_group.patch
 echo  import-bind.patch
  patch -p1 < ../import-bind.patch
 echo  edge_mikabox.patch
  patch -p1 < ../edge_mikabox.patch
 echo  disable_edges_by_default.patch
  patch -p1 < ../disable_edges_by_default.patch
 echo  compact_menu.patch
  patch -p1 < ../compact_menu.patch
 echo  utf8-menu-accelerators.diff
  patch -p1 < ../utf8-menu-accelerators.diff
 echo  topmenu_kbd_group.patch_local
  patch -p1 < ../topmenu_kbd_group_local.patch
 echo  strict_skip_taskbar
  patch -p1 < ../strict_skip_taskbar.patch
 ./bootstrap
  ./configure --prefix=/usr \
    --with-x \
    --enable-startup-notification \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/openbox
  make
}

package() {
  cd openbox
  make DESTDIR="$pkgdir" install

  # GNOME Panel is no longer available in the official repositories
  rm -r "$pkgdir"/usr/bin/{gdm-control,gnome-panel-control,openbox-gnome-session} \
    "$pkgdir"/usr/share/gnome{,-session} \
    "$pkgdir"/usr/share/man/man1/openbox-gnome-session.1 \
    "$pkgdir"/usr/share/xsessions/openbox-gnome.desktop

  sed -i 's:startkde:/usr/bin/\0:' \
    "$pkgdir"/usr/share/xsessions/openbox-kde.desktop
  mkdir -p "$pkgdir/etc/$pkgname/samples"
  install -Dm644  "${srcdir}/rc.xml" "${pkgdir}/etc/$pkgname/samples/rc.xml"
  install -Dm644  "${srcdir}/menu.xml" "${pkgdir}/etc/$pkgname/samples/menu.xml"
}

install=install
