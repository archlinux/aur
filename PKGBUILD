# Maintainer: Sherlock Holo <sherlockya at gmail dot com>
# Contributor: Can Celasun <can [at] dcc [dot] im>

pkgbase=canta-theme-git
_pkgname=canta-theme
pkgname=('canta-gtk-theme-git' 'canta-icon-theme-git')
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
pkgver=2018_05_15.r10.0290e7d
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('numix-circle-icon-theme-git'
            'gtk-engine-murrine'
            'gnome-themes-standard'
            'sassc')
makedepends=('gtk3' 'git')

source=("${_pkgname}::git+https://github.com/vinceliuice/Canta-theme.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    # Build GTK theme
    #patch -Np1 < "${srcdir}"/installer.patch
    
    sed \
        -e "/ROOT_UID=0/d" \
        -e "/DEST_DIR=/d" \
        -e '/# Destination directory/d' \
        -e "/if \[ \"\$UID\" -eq \"\$ROOT_UID\" \]; then/d" \
        -e "/DEST_DIR=\"\/usr\/share\/themes\"/d" \
        -e "/else/d" \
        -e "/DEST_DIR=\"\$HOME\/.themes\"/d" \
        -e "0,/fi/d" -i $srcdir/canta-theme/install.sh

    rm -rf build
    mkdir build
    #DEST_DIR=build ./install.sh
    DEST_DIR=build ./Install_with_background_img
}

package_canta-gtk-theme-git() {
    mkdir -p "${pkgdir}"/usr/share/themes/
    cp "${srcdir}"/${_pkgname}/build/* "${pkgdir}"/usr/share/themes/ -R
}

package_canta-icon-theme-git() {
    pkgdesc="Flat icons for Canta GTK theme"
    
    mkdir -p "${pkgdir}"/usr/share/icons/Canta
    cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}

