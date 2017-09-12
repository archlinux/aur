# Maintainer: Charles Milette <charles.milette@gmail.com>
# Originally taken from https://www.archlinux.org/packages/community/any/arc-gtk-theme/

pkgbase=arc-orange-gtk-theme-git
_pkgname=arc-theme-orange
pkgname=('arc-orange-gtk-theme-git' 'arc-orange-solid-gtk-theme-git')
pkgver=r57.af13f6a
pkgrel=1
arch=('any')
url="https://github.com/eti0/${_pkgname}"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3')
source=("git+https://github.com/eti0/${_pkgname}.git"
        'orange-no-conflict.patch')
sha512sums=('SKIP'
            'c3b5e0f91e6af117fe3fcb2521d77f50ec7108c43c2a5b1a497d0f00367b5cdc75090864ccb63c04d842db92d6ca6d04717fcc1b9d4ecd436559424b76c2335f')
pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -a ${_pkgname}{,-solid}
    cd ${_pkgname}-solid
    patch -p1 -i ../orange-no-conflict.patch
    cd ${_pkgname}
    patch -p1 -i ../orange-no-conflict.patch
}

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr

    cd ../${_pkgname}-solid
    ./autogen.sh --prefix=/usr --disable-transparency
}

package_arc-orange-gtk-theme-git() {
    pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"

    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}

package_arc-orange-solid-gtk-theme-git() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"

    cd ${_pkgname}-solid
    make DESTDIR="${pkgdir}" install
}
