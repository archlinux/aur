# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=5.2.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('x86_64')
url="https://gitlab.com/rastersoft/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'libgee' 'libnotify' 'rsync' 'udisks2')
makedepends=('gettext' 'intltool' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dde0f45deef2495d5268871799874ff5367038d804e55821ea215309be510b3581d72e650bb9c9d18d7f38483ba2423be8cd87fe72b4c205beadbd378379757f')

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
