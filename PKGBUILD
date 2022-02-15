# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

# Archlinux credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Ubuntu credits:
# Robert Ancell: <https://salsa.debian.org/gnome-team/gnome-control-center>
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=gnome-control-center-x11-scaling
_pkgname=gnome-control-center
pkgver=41.4
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libcheese
         libgudev bolt udisks2 libhandy gsound colord-gtk)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
conflicts=($_pkgname)
provides=($_pkgname)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
groups=(gnome)
_commit=d08fac3f0be63f0a4c65d26f47d3b77f8738cfab  # tags/41.4^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/10b4141256e5027b6df14eaa6659f15c523b2b8b/fractional-scaling.patch")
sha256sums=('SKIP'
            'SKIP'
            '03fa5d2382dd3be039200b578529af0351735c07e784faf09acfacebd249ad28')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update

  # Support UI scaled logical monitor mode (Marco Trevisan, Robert Ancell, and Georg Wagner)
  patch -p1 -i "${srcdir}/fractional-scaling.patch"
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

