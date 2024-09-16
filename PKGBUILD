# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=extension-manager
pkgver=0.5.1
pkgrel=5
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'glib2-devel')
checkdepends=('appstream-glib')
optdepends=('libbacktrace-git')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz backtrace.patch return-ext.patch return-inst.patch index.patch osc1.patch osc2.patch crit1.patch crit2.patch crit3.patch)
sha256sums=('b4cd95cbf45a3d046858fb44e78f3e3147a24279e77bfbbe8a422920f20a7b3b' 'b2adaa69092e6a58cc6b15574f6a68f94bad606922620a276ea3db80a4b74bed' 'bfe1d1731fb97ae5dfd29a37befdf45ba51216629eacdf11710252762acd7023' 'e0d68cc71b1513577db20a0d5fea04a15f980f86142228f5ee03ce1334642066' '0fc0c98c68d843dab865caba36bdab6a47a4716fe7d296341ece4e81ec6ac298' '02cfd0491ee143587f56cd8ad1e607dd6270b15a2c829366e5d8bc787f1165b0' 'cd43700e9e5356c6d9b37b2dc5cb41fcccd21c24428ef3a2db6a682210233970' 'a79ebc265960e42eda603e8200513e203dd4988e2a5bd5a4a59927436aa07142' 'ce1210b6556402b69c849eb0b061e4c1ca9d64a2d1a5643b6bf47aa8846ba6fa' '2b12a02681526ba7a6ecbd505bf872bfda4092a15a9b95e90cc6079ee3b734cb')

prepare() {
    patch -p1 $pkgname-$pkgver/src/exm-backtrace.c backtrace.patch
    patch -p1 $pkgname-$pkgver/src/exm-extension-row.c return-ext.patch
    patch -p1 $pkgname-$pkgver/src/exm-installed-page.c return-inst.patch
    patch -p1 $pkgname-$pkgver/src/exm-upgrade-assistant.c index.patch
    patch -p1 $pkgname-$pkgver/src/exm-detail-view.c osc1.patch
    patch -p1 $pkgname-$pkgver/src/exm-window.c osc2.patch
    patch -p1 $pkgname-$pkgver/src/exm-detail-view.c crit1.patch
    patch -p1 $pkgname-$pkgver/src/exm-info-bar.c crit2.patch
    patch -p1 $pkgname-$pkgver/src/exm-window.c crit3.patch
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
