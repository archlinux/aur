# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-control-center
pkgname=$_pkgname-x11-scaling
pkgver=40.0
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with X11 fractional scaling patches)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(aarch64 x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd grilo libibus
         cheese libgudev bolt udisks2 libhandy gsound colord-gtk)
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
_commit=49d71c07b5b3ce59e035b785310cba4fcf903868  # tags/40.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=c5ab6037f460406ac9799b1e5765de3ce0097a8b"
        "https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/f185f33fb200cc963c062c7a82920a085f696978/debian/patches/ubuntu/display-Allow-fractional-scaling-to-be-enabled.patch"
        "https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/f185f33fb200cc963c062c7a82920a085f696978/debian/patches/ubuntu/display-Support-UI-scaled-logical-monitor-mode.patch")
sha256sums=('SKIP'
            'SKIP'
            'a4ef01458df90b84d1bca34992a8317339d327cd7aebe9fdddbf9a88aa04517c'
            'a048a64afe1f258c64f22d170f494149dcdaeedfbfc8a39309c16acfa803951f')

#pkgver() {
#  cd $_pkgname
#  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
#}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update

  # Support UI scaled logical monitor mode (Marco Trevisan)
  patch -p1 -i ../display-Support-UI-scaled-logical-monitor-mode.patch

  # Allow fractional scaling to be enabled (Robert Ancell)
  patch -p1 -i ../display-Allow-fractional-scaling-to-be-enabled.patch
}


build() {
  arch-meson $_pkgname build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
