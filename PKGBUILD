# Maintainer: Omnikron13 <joey.sabey@gmx.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-solarc-git
_pkgname=solarc-theme
_pkgauthor=schemar
_cinnamonversion=4.6.6
_gnomeversion=3.36
pkgver=848.ee3ca40
pkgrel=1
pkgdesc="A flat theme with transparent elements. Based on the Arc theme: https://github.com/jnsh/arc-theme"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git' 'wget' 'inkscape' 'sassc' 'optipng')
source=("${_pkgname}::git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('gtk-theme-solarc')
provides=('gtk-theme-solarc')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./solarize.sh
    export _arcdir=$(ls | grep "arc-theme-" | tail -1)
    cd "${_arcdir}"
    ./autogen.sh --prefix=/usr --with-gnome-shell=${_gnomeversion} --with-cinnamon=${_cinnamonversion}
    make
}

package() {
    cd "${srcdir}/${_pkgname}/${_arcdir}"
    make DESTDIR="${pkgdir}" install
}
