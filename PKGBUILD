# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=colord-git
pkgname=(colord-git colord-sane-git)
pkgver=1.4.4
pkgrel=2
pkgdesc="System daemon for managing color devices"
url="https://www.freedesktop.org/software/colord"
arch=(x86_64)
license=(GPL2)
provides=(colord colord-sane)
conflicts=(colord colord-sane)
depends=(lcms2 libgusb polkit sqlite dconf dbus libgudev shared-mime-info systemd-libs udev)
makedepends=(gobject-introspection vala sane bash-completion argyllcms git meson gtk-doc systemd
             docbook-xsl)
options=(!emptydirs)
source=("git+https://github.com/hughsie/colord")
sha256sums=('SKIP')
#validpgpkeys=('163EB50119225DB3DF8F49EA17ACBA8DFA970E17')  # Richard Hughes

pkgver() {
  cd colord
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd colord
}

build() {
  arch-meson colord build \
    -D libcolordcompat=true \
    -D sane=true \
    -D vapi=true \
    -D print_profiles=true \
    -D daemon_user=colord
  ninja $NINJAFLAGS -C build
}

#check() {
#  meson test -C build
#}

package_colord-git() {
  optdepends=('argyllcms: color profiling'
              'colord-sane: SANE support')
  replaces=(shared-color-profiles)

  DESTDIR="$pkgdir" meson install -C build

  echo 'u colord - "Color management daemon" /var/lib/colord' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/colord.conf"

### Split colord-sane
  mkdir -p colord-sane/usr/lib/colord-plugins
  mv {"$pkgdir",colord-sane}/usr/lib/colord-sane
  mv {"$pkgdir",colord-sane}/usr/lib/colord-plugins/libcolord_sensor_sane.so
}

package_colord-sane-git() {
  pkgdesc+=" (SANE support)"
  depends=(colord sane)
  mv colord-sane/* "$pkgdir"
}

# vim:set sw=2 et:
