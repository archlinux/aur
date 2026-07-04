# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=4.21.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('x86_64')
url="https://gitlab.com/rastersoft/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'libgee' 'libnotify' 'rsync' 'udisks2')
makedepends=('gettext' 'intltool' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ef6fa3b3b3a15f22400f5382ec30aa9d1c6842b64565a8f10602ab72957ba3a4daa4c970b4a30fa007f815c67b9c0178c33d55364c8e86a1a529e6cc5a4e50fe')

latestver() {
    git ls-remote --refs --tags "${url}.git" |
        cut -d/ -f3 |
        sed -nE '/^[0-9]+(\.[0-9]+)*$/p' |
        sort -V |
        sed -n '$p'
}

build() {
    local meson_options=(
        --prefix /usr
        --buildtype release
    )

    rm -rf build
    meson setup build "${srcdir}/${pkgname}-${pkgver}" "${meson_options[@]}"
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 "$srcdir/${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
