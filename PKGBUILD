# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>

pkgname=gtk-arc-flatabulous-theme-git
_pkgname=arc-flatabulous-theme
pkgver=r905.6658eac
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
depends=()
makedepends=('git' 'autoconf' 'automake' 'sassc' 'optipng' 'inkscape')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-extra: for gtk2 themes'
            'gtk3: for gtk3 themes'
            'gnome-shell: for detecting GNOME Shell version'
)
provides=('gtk-arc-flatabulous-theme')
conflicts=('gtk-arc-flatabulous-theme')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_autogen_options=()

check_optdepends() {
    # Check if gnome-shell is installed
    if (pacman -Qq gnome-shell > /dev/null) ; then
        msg "Enabling GNOME Shell support"
    else
        msg "Disabling GNOME Shell support"
        _autogen_options=(${_autogen_options[@]} --disable-gnome-shell)
    fi
}

build() {

    # Check optional dependencies
    check_optdepends

    cd "${srcdir}/${_pkgname}"
    ./autogen.sh ${_autogen_options[@]} --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
