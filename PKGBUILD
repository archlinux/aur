# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pamac-aur
_pkgver=6.0.2
pkgver=$_pkgver
pkgrel=3
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4'
         'appstream-glib' 'archlinux-appstream-data')

  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.36')
backup=('etc/pamac.conf')
conflicts=('pamac')
provides=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "fix-desc.patch::https://github.com/manjaro/pamac/commit/8f19ea1887bfd325cb3f94324dc8d123e005e01f.patch"
        "fix-search.patch::https://github.com/manjaro/pamac/commit/bad4624c3bda629d1e5e6a3bc575031502b75b39.patch"
        "fix-categories.patch::https://github.com/manjaro/pamac/commit/a2bd9f9ea864490e18995ba3ed8617ce0090343f.patch")
sha256sums=('db0bc0477bb687d99e60c74e15367f5df9d3d9450085800aae5dabcc9b43bcb6'
            '151068631cc710f4e4396a67c7efe0fda2ba42766dba64fbe271ec50789a08c0'
            '7b6128a1cf7f59e6bca292af8d691974a1fe4c95e45100c811c09b15a3485644'
            'e549db2e45409379d96c00daf7ec8b4957702103a292755e4a39a2984e5f8529')

prepare() {
  cd "$srcdir/pamac-$_pkgver"
  # patches here
  patch -p1 -i $srcdir/fix-desc.patch
  patch -p1 -i $srcdir/fix-search.patch
  patch -p1 -i $srcdir/fix-categories.patch

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
  # delete timer no pamac-mirror for Arch Linux 
  rm "$pkgdir"/etc/systemd/system/multi-user.target.wants/pamac-mirrorlist.timer
}
# vim:set ts=2 sw=2 et:
