# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=5.1.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('x86_64')
url="https://gitlab.com/rastersoft/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'libgee' 'libnotify' 'rsync' 'udisks2')
makedepends=('gettext' 'intltool' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('657825403bf5fa1af17582512012ec95a53dfbf0a49ed0b9d644b0ed73ceaa17af4b65468802c2e0a508621420ad37eb95a760edc3a5c329890dbc0a5d668d49')

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
