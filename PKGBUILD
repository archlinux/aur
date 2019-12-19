pkgname=gnome-initial-setup-git
_pkgname=gnome-initial-setup
pkgver=3.34.0+17+g87dea7a
pkgrel=1
pkgdesc="Simple, easy, and safe way to prepare a new system"
arch=('x86_64')
url="https://www.gnome.org/"
license=('GPL')
depends=('nm-connection-editor' 'accountsservice' 'cheese' 'gnome-desktop' 'libgweather' 'gnome-online-accounts' 'libgdm' 'libpwquality' 'libibus' 'libgnomekbd' 'libpackagekit-glib' 'geoclue')
makedepends=('meson')
optdepends=('gdm: GDM Initial Setup mode' 'gnome-getting-started-docs: GNOME Welcome Tour')
provides=('gnome-initial-setup')
conflicts=('gnome-initial-setup')
source=("git+https://gitlab.gnome.org/GNOME/gnome-initial-setup")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"

  # Setup system user and group
  echo 'u gnome-initial-setup - "GNOME Initial Setup" /run/gnome-initial-setup' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  echo 'd /run/gnome-initial-setup 0700 gnome-initial-setup gnome-initial-setup -' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
