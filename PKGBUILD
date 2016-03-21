# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin-git
_pkgname=Ricin
_submodule=tox-vapi
pkgver=0.467.11d69a5
pkgrel=1
pkgdesc="Lightweight and Fully-Hackable Tox client powered by Vala & Gtk3"
url="https://github.com/RicinApp/Ricin"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'meson' 'ninja' 'vala')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         'libconfig'
         )

source=("git+https://github.com/RicinApp/Ricin.git"
        "git+https://github.com/RicinApp/tox-vapi.git")
sha256sums=('SKIP' 'SKIP')
provides=('ricin')
conflicts=('ricin')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.${_submodule}.url $srcdir/${_submodule}
    git submodule update
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir build > /dev/null
    if [ -f "/usr/bin/meson" ]; then
        meson . build
    else
        meson.py . build
    fi
    make release
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm644 "icons/Ricin-128x128.png" "${pkgdir}/usr/share/icons/icons/Ricin-128x128.png"
    install -Dm644 "ricin.desktop" "${pkgdir}/usr/share/applications/ricin.desktop"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
