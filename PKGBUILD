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
pkgrel=4
pkgdesc='Highly configurable and lightweight X11 window manager with patches from Debian'
arch=('i686' 'x86_64')
url='http://openbox.org'
license=('GPL-2.0-only')
provides=(libobrender.so $_pkgname 'openbox')
conflicts=($_pkgname)
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr'
         'libxcursor' 'pango' 'imlib2' 'librsvg' 'libsm')
makedepends=('python-pyxdg')
optdepends=('plasma-workspace: for the KDE/Openbox xsession'
            'gnome-panel: for the openbox gnome session '
            'python-pyxdg: for the openbox-xdg-autostart script')
groups=('lxde' 'lxde-gtk3' 'lxqt')
backup=('etc/xdg/openbox/menu.xml' 'etc/xdg/openbox/rc.xml'
        'etc/xdg/openbox/autostart' 'etc/xdg/openbox/environment')
source=(http://openbox.org/dist/openbox/$_pkgname-$pkgver.tar.gz{,.asc}
        http://http.debian.net/debian/pool/main/o/openbox/openbox_3.6.1-12.debian.tar.xz)
sha256sums=('8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7'
            'SKIP'
            'cf7c2fe6e9f31a46c2955d78ea8b301072742e954e16bc4d7f86b6b5cf312775')
validpgpkeys=(4B71379A9D5263D112A85620A5A4E99C711D3B61)

prepare() {
  cd "${_pkgname}-${pkgver}"

  local patches=(
          01_rc.xml.patch
          02_fix_freedesktop_compliance.patch
          #03_place_windows_in_quadrants.patch
          04_fix_xml_load_file.patch
          05_openbox-3.5.0-title-matching.patch
          06_openbox-3.5.0-which-2.20.patch
          07_update_desktop.patch
          08_autostart-fix.patch
          09-disable-check-gnome-version.patch
          1007147-openbox-imlib-free-image-NULL.patch
          1033385_Fix_list_traversal_issue_in_client_calc_layer.patch
          704724_fix_refers-to-autostart.sh.patch
          719620_fix_show_startup_notification.patch
          754207_use-scrot.patch
          808138_Replace-getgrent-with-getgroups.patch
          843231.patch
          #873480_fix_restore-horz-vert.patch
          887908.patch
          917204_undecorated_maximized_no_border.patch
          974180.patch
          adapt-to-gsd-324.patch
          Add-class-hint-to-focus-cycle-popup.patch
          Allow-256x256-window-icon-size-for-HiDPI-displays.patch
          d9a405e9.patch
          de.po.patch
          Fix-collision-between-iterator-and-throw-away-argume.patch
          fix-spelling-error-in-binary.patch
          python3.patch
  )

  for i in "${patches[@]}"; do
      msg "Applying ${i} ..."
      patch -p1 -i "../debian/patches/${i}"
  done

  # py3.patch modifies configure.ac
  autoreconf -ifv
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-x \
    --enable-startup-notification \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/openbox
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
