# Maintainer icasdri <icasdri at gmail dot com>

_upstream=arc-theme
_pkgname=Arc-Clearly-Dark
pkgname=gnome-shell-theme-arc-clearly-dark-git
pkgver=630.2ca1989.14
pkgrel=1
pkgdesc='Customized GNOME Shell theme featuring cleanliness and no outlines. Based on vanilla Arc Dark theme'
arch=(any)
url="https://github.com/icasdri/Arc-Clearly-Dark"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('git' 'python')
optdepends=('gnome-tweak-tool: user interface to theme selection and other GNOME Shell options')
source=("git+${url}.git"
        "git+https://github.com/horst3180/${_upstream}.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    modver=$(git rev-list --count HEAD)
    cd "${srcdir}/${_upstream}"
    origver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    echo "${origver}.${modver}"
}

build() {
    cd "${srcdir}/${_upstream}"

    msg2 'Building vanilla Arc Dark theme for GNOME Shell...'
    ./autogen.sh --prefix=/usr \
                 --disable-light \
                 --disable-darker \
                 --disable-cinnamon \
                 --disable-gtk2 \
                 --disable-gtk3 \
                 --disable-metacity \
                 --disable-unity \
                 --disable-xfwm

    cd "${srcdir}"
    make -C "${srcdir}/${_upstream}" DESTDIR="${srcdir}/${_pkgname}" install

    msg2 'Patching theme for Arc Clearly Dark...'
    cd "${srcdir}/${_pkgname}"
    cp 'patch.py' 'usr/share/themes/Arc-Dark'
    cd 'usr/share/themes/Arc-Dark'
    python patch.py
}

package() {
    cd "${srcdir}/${_pkgname}/usr/share/themes/Arc-Dark"
    mkdir -p "${pkgdir}/usr/share/themes/Arc-Clearly-Dark"
    cp -r 'gnome-shell' "${pkgdir}/usr/share/themes/Arc-Clearly-Dark"
}
