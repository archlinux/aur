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
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz backtrace.patch return-ext.patch return-inst.patch)
sha256sums=('b4cd95cbf45a3d046858fb44e78f3e3147a24279e77bfbbe8a422920f20a7b3b' 'b2adaa69092e6a58cc6b15574f6a68f94bad606922620a276ea3db80a4b74bed' 'bfe1d1731fb97ae5dfd29a37befdf45ba51216629eacdf11710252762acd7023' 'e0d68cc71b1513577db20a0d5fea04a15f980f86142228f5ee03ce1334642066')

prepare() {
    patch -p1 $pkgname-$pkgver/src/exm-backtrace.c backtrace.patch
    patch -p1 $pkgname-$pkgver/src/exm-extension-row.c return-ext.patch
    patch -p1 $pkgname-$pkgver/src/exm-installed-page.c return-inst.patch
}

build() {
    arch-meson $pkgname-$pkgver build -Dbacktrace=false
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs || :
}

package() {
    meson install -C build --destdir "$pkgdir"
}
