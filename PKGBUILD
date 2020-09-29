# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20200819
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
sha512sums=('bedff15a195c21934a813ca600b88ced81c3db66b7c25ab75b7193998a89338a7888711abb213877210a62d2460300bc32d40402bdd1f6c4d8fa903999eb1b0e'
            'SKIP')
validpgpkeys=('31743CDF250EF641E57503E5FAEDBC4FB5AA3B17')

prepare() {
    # Fix https://github.com/jnsh/arc-theme/commit/2c726e439b1f157f9a2f54955e51a8c9900ff41a?branch=2c726e439b1f157f9a2f54955e51a8c9900ff41a&diff=unified
    echo '@define-color text_view_bg #{"" + $base_color};' >> ${_pkgname}-${pkgver}/common/gtk-3.0/3.24/sass/_colors-public.scss

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
