# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=gsword
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK4/libadwaita Bible study application with a SWORD module library"
arch=('x86_64')
url="https://github.com/yetist/gsword"
license=('GPL-2.0-or-later')
depends=('bzip2' 'curl>=7.68' 'glib2>=2.66' 'gtk4' 'gtksourceview5' 'hicolor-icon-theme'
         'libadwaita>=1.4' 'sqlite' 'xz' 'zlib')
makedepends=('appstream' 'desktop-file-utils' 'gettext' 'gobject-introspection'
             'meson' 'ninja' 'pkgconf' 'vala')
provides=('libgsword.so=0-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'gsword-system-icon-path.patch')
sha256sums=('1094a9a731214289b4d88355b28f81ff1ad680231ea4def327a010870faadb36'
            '4625b2ddbb38ffbb17db9fe70a5ec2f7004b41911fc7a5907172ac972efb6b5f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/gsword-system-icon-path.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build \
    --prefix=/usr \
    -Dintrospection=true \
    -Dtests=true
  meson compile -C build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
