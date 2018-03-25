# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme-git
_pkgname=arc-theme
pkgname=('arc-gtk-theme-git' 'arc-solid-gtk-theme-git')
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20170302.r4.8290cb8
pkgrel=1
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/horst3180/arc-theme/issues/840
url="https://github.com/nicohood/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3' 'sassc' 'git')

source=("${_pkgname}::git+https://github.com/horst3180/${_pkgname}.git")
sha512sums=('SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    cp -a ${_pkgname}{,-solid}
}

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr

    cd ../${_pkgname}-solid
    ./autogen.sh --prefix=/usr --disable-transparency
}

package_arc-gtk-theme-git() {
    replaces=('gtk-theme-arc-git')
    conflicts=('arc-gtk-theme-git')

    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}

package_arc-solid-gtk-theme-git() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=('gtk-theme-arc-solid-git')
    conflicts=('arc-solid-gtk-theme-git')

    make -C "${srcdir}/${_pkgname}-solid" DESTDIR="${pkgdir}" install
}
