# Maintainer: CorvetteCole <aur@corvettecole.com>

pkgbase=gnome-control-center-vrr
pkgname=(gnome-control-center-vrr)
pkgver=42.3
pkgrel=1
pkgdesc="A window manager for GNOME (with VRR)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
arch=(x86_64)
license=(GPL)
depends=(accountsservice cups-pk-helper gnome-bluetooth-3.0 gnome-desktop-4
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas
         gtk4 libgtop libnma-gtk4 sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libgudev
         bolt udisks2 libadwaita gsound colord-gtk4 gcr libmalcontent mutter-vrr)
makedepends=(docbook-xsl modemmanager git python meson)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
_commit=ff5ab8f715ea02f75cff567ce86830040b0f38cc  # tags/42.3
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        'mr734.patch')

sha256sums=('SKIP'
            'SKIP'
            '575f770b3ef3da1d3a3c75b198577ceb32e25e72ccdd311ca143d205317112bd')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/mr734.patch"
  
  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson "$pkgname" build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_gnome-control-center-vrr() {
  conflicts=(gnome-control-center)
  provides=(gnome-control-center)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
