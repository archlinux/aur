# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=extension-manager
pkgver=0.5.1
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
optdepends=('libbacktrace-git')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz backtrace.patch)
sha256sums=('b4cd95cbf45a3d046858fb44e78f3e3147a24279e77bfbbe8a422920f20a7b3b' 'b2adaa69092e6a58cc6b15574f6a68f94bad606922620a276ea3db80a4b74bed')

build() {
  patch $pkgname-$pkgver/src/exm-backtrace.c backtrace.patch
  arch-meson $pkgname-$pkgver build -Dbacktrace=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
