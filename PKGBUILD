# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20200513
pkgrel=1
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
sha512sums=('ac814babf995facce72497efad7d7afb6d2eed0ad02640aeb694874681c961b136fcc4fba8350fdee715d44c26db2a336b3430c054a299285ced782ed67bbcfe'
            'SKIP')
validpgpkeys=('31743CDF250EF641E57503E5FAEDBC4FB5AA3B17')

prepare() {
    cp -a ${_pkgname}-${pkgver}{,-solid}
}

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh --prefix=/usr --with-gnome-shell=3.36 --with-cinnamon=4.6 --with-gtk3=3.24

    cd ../${_pkgname}-${pkgver}-solid
    ./autogen.sh --prefix=/usr --disable-transparency --with-gnome-shell=3.36 --with-cinnamon=4.6 --with-gtk3=3.24
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
