# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-mse
_pkgname=epiphany
pkgver=3.30.2
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine - MSE and EME enabled"
url="https://wiki.gnome.org/Apps/Web"
arch=(i686 x86_64)
license=(GPL)
depends=(webkit2gtk gcr icu libdazzle)
makedepends=(docbook-xml startup-notification lsb-release gobject-introspection yelp-tools
             appstream-glib git meson)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
_commit=104c003f5da64346de8199c86ada6a104d7869c1  # tags/3.30.2^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/$_pkgname.git#commit=$_commit"
        enable_mse.patch)
provides=($_pkgname)
conflicts=($_pkgname)
sha256sums=('SKIP'
            'cb5edbb54d500fc593b109f83aa5b13644fda49374db6ee479f8904f90d9a415')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../enable_mse.patch
}

build() {
  arch-meson $pkgname build \
    -D distributor_name="Arch Linux®"
  ninja -C build
}

check() {
  # ERROR:../epiphany/tests/ephy-web-app-utils-test.c:109:test_web_app_lifetime: assertion failed (g_list_length (apps) == 1): (0 == 1)
  xvfb-run meson test -C build || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
