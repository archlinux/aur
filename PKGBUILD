# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=dconf-git
pkgver=0.38.0
pkgrel=1
pkgdesc="Configuration database system"
url="https://wiki.gnome.org/Projects/dconf"
arch=(x86_64)
license=(LGPL)
depends=(glib2)
makedepends=(vala dbus git python meson bash-completion)
provides=(libdconf.so dconf)
conflicts=(dconf)
install=dconf.install
source=("git+https://gitlab.gnome.org/GNOME/dconf.git"
        dconf-update dconf-update.hook)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd dconf
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd dconf
}

build() {
  arch-meson dconf build -D gtk_doc=false
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts" dconf-update

  # Prevent this directory from getting removed when other
  # packages which install files there get uninstalled
  install -Dm644 /dev/null "$pkgdir/etc/dconf/db/.placeholder"
}

# vim:set sw=2 et:

