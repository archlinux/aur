# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20201013
pkgrel=2
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/jnsh/arc-theme/issues/18
url="https://github.com/jnsh/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes'            )
makedepends=('sassc' 'optipng' 'inkscape')

source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('c1c70c80935af2b1f3c7c9bf79ee72d5fba907fd03caadecf96d6fd796bf70d325bbb16dbe93f95d9a63eff748c7d90bcb0bf837e446e5c2770cfdccb131f45c'
            'SKIP')
validpgpkeys=('31743CDF250EF641E57503E5FAEDBC4FB5AA3B17')

prepare() {
    cp -a ${_pkgname}-${pkgver}{,-solid}
}

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh --prefix=/usr --with-gnome-shell=3.38 --with-cinnamon=4.6 --with-gtk3=3.24

    cd ../${_pkgname}-${pkgver}-solid
    ./autogen.sh --prefix=/usr --disable-transparency --with-gnome-shell=3.38 --with-cinnamon=4.6 --with-gtk3=3.24
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
