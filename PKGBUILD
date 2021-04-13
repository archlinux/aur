# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20210412
pkgrel=1
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/jnsh/arc-theme/issues/18
url="https://github.com/jnsh/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('meson' 'sassc' 'inkscape')

source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('d3064546301e013a1e5a8db735346d74c73f37cbf808b7afeee6f88c820cea58ba6458fa63e1213377cdd33c8347167242e6f8f1eacf85ce212f3b2508c0bb80'
            'SKIP')
validpgpkeys=('31743CDF250EF641E57503E5FAEDBC4FB5AA3B17')

# Latest stable Arch package versions
_cinnamonver=4.8
_gnomeshellver=40
_gtk3ver=3.24

build() {
    cd ${_pkgname}-${pkgver}

    meson --prefix=/usr build \
      -Dgnome_shell_gresource=true \
      -Dcinnamon_version="${_cinnamonver}" \
      -Dgnome_shell_version="${_gnomeshellver}" \
      -Dgtk3_version="${_gtk3ver}"
    meson compile -C build

    meson --prefix=/usr build-solid \
      -Dtransparency=false \
      -Dgnome_shell_gresource=true \
      -Dcinnamon_version="${_cinnamonver}" \
      -Dgnome_shell_version="${_gnomeshellver}" \
      -Dgtk3_version="${_gtk3ver}"
    meson compile -C build-solid
}

package_arc-gtk-theme() {
    replaces=('gtk-theme-arc')

    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" meson install -C build
}

package_arc-solid-gtk-theme() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=('gtk-theme-arc-solid')

    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" meson install -C build-solid
}
