# Maintainer: Bart Libert <aur at bart dot libert dot email>
# Maintainer: harshadgavali

pkgname=tabsearchproviderconnector
pkgver=0.1.1
pkgrel=4
pkgdesc="Browser tab search provider for GNOME"
url="https://github.com/harshadgavali/searchprovider-for-browser-tabs"
depends=('gnome-shell')
makedepends=('meson' 'cargo')
license=('MIT')
arch=('x86_64')
_gitrepo=searchprovider-for-browser-tabs
_tarver=connector-v$pkgver

source=("$pkgname-$pkgver.tar.gz::https://github.com/harshadgavali/$_gitrepo/archive/refs/tags/$_tarver.tar.gz")

sha256sums=('0a7c524df5714faf5fae4491f90174b4da93b1d902054b7400098fce7d2abf01')
optdepends=('firefox: search firefox tabs from gnome shell'
            'chromium: search chromium tabs from gnome shell')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
}

build() {
# Once the lib issue is fixed, following line can be removed
    sed -i 's@lib64/mozilla/native-messaging-hosts@lib/mozilla/native-messaging-hosts@' $srcdir/$_gitrepo-$_tarver/connector/manifests/firefox/meson.build
    arch-meson --buildtype=release $srcdir/$_gitrepo-$_tarver/connector build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 $srcdir/$_gitrepo-$_tarver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
