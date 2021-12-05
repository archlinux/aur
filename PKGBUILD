# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-control-center
pkgname=$_pkgname-x11-scaling
pkgver=41.2
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with X11 fractional scaling patches)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(aarch64 x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libcheese
         libgudev bolt udisks2 libhandy gsound colord-gtk power-profiles-daemon)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login')
groups=(gnome)
conflicts=($_pkgname)
provides=($_pkgname)
_commit=babeb0ce357d55406b0ba0a4597e0513a0419de8  # tags/41.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=c5ab6037f460406ac9799b1e5765de3ce0097a8b"
        "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/10b4141256e5027b6df14eaa6659f15c523b2b8b/fractional-scaling.patch")
sha256sums=('SKIP'
            'SKIP'
            '03fa5d2382dd3be039200b578529af0351735c07e784faf09acfacebd249ad28')

#pkgver() {
#  cd $_pkgname
#  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
#}

prepare() {
  cd $_pkgname

  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update

  # Support UI scaled logical monitor mode (Marco Trevisan, Robert Ancell, and Georg Wagner)
  patch -p1 -i ../fractional-scaling.patch
}

build() {
  arch-meson $_pkgname build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
