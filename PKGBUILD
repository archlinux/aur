# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=upower-git
_pkgname=upower
pkgver=1.90.2.r6.g029651a
pkgrel=1
pkgdesc="enumerating power devices, listening to events and querying history and statistics"
url="https://upower.freedesktop.org"
arch=(x86_64 i686)
license=(GPL)
depends=(libimobiledevice libgudev)
makedepends=(docbook-xsl gobject-introspection python git gtk-doc meson)
optdepends=('python: for integration tests'
	    'gobject-introspection-runtime: for integration tests')
backup=(etc/UPower/UPower.conf)
source=("$pkgname::git+https://gitlab.freedesktop.org/upower/upower.git")
md5sums=('SKIP')
provides=("$_pkgname=${pkgver%%.r*}-${pkgrel}")
conflicts=("$_pkgname")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

build() {
  cd $pkgname
  arch-meson -Dintrospection=enabled -Dman=true -Dgtk-doc=true -Didevice=enabled . build
  meson compile -C build
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
  cd "$pkgdir"
  rm -fr var
  install -Dm 644 /dev/null usr/lib/tmpfiles.d/upower.conf
  echo "d /var/lib/upower" >usr/lib/tmpfiles.d/upower.conf
}
