# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=gnome-shell-extension-soft-brightness-git
pkgver=43.r5.gdba4979
pkgrel=1
epoch=1
pkgdesc='Manage your display brightness via an alpha overlay (instead of the backlight).'
url='https://github.com/jkitching/soft-brightness-plus'
license=(GPL-3.0-or-later)
arch=(any)
depends=('gnome-shell>=45')
makedepends=('git' 'meson>=0.50' 'm4')
source=($pkgname::git+$url build.patch)
sha256sums=('SKIP'
            '9b5d81c37d06ffef37340f0a70ea613c90d8b80e08f43750e2605478e2de8716')
_uuid="soft-brightness-plus@joelkitching.com"
_schema="org.gnome.shell.extensions.soft-brightness-plus.gschema.xml"

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../build.patch
  meson-gse/meson-gse
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build --wipe
}

check(){
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema -t \
    "$pkgdir"/usr/share/glib-2.0/schemas
  rm -rf "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/schemas/
}
