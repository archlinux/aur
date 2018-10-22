# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20181022
pkgrel=1
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/horst3180/arc-theme/issues/840
url="https://github.com/NicoHood/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3' 'sassc' 'optipng' 'inkscape' 'parallel')

source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('0562a91740a08d799fb12749c8c3a1baccbfa0ed68b2fd4ced1965a929df395e83bf1ee336c5ed61e90701ac87e8d4f143622e0458f6eda26eeff43d7a811f1e'
            'SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood

prepare() {
    cp -a ${_pkgname}-${pkgver}{,-solid}
}

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh --prefix=/usr --with-gnome-shell=3.30

    cd ../${_pkgname}-${pkgver}-solid
    ./autogen.sh --prefix=/usr --disable-transparency --with-gnome-shell=3.30
}

package_arc-gtk-theme() {
    replaces=('gtk-theme-arc')

    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

package_arc-solid-gtk-theme() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=('gtk-theme-arc-solid')

    cd ${_pkgname}-${pkgver}-solid
    make DESTDIR="${pkgdir}" install
}
