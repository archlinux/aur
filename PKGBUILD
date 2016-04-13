# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin-git
_pkgname=Ricin
_submodule=tox-vapi
pkgver=0.599.5602330
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://github.com/RicinApp/Ricin"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'meson-git' 'ninja' 'vala')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("git+https://github.com/RicinApp/Ricin.git")
sha256sums=('SKIP')
provides=('ricin')
conflicts=('ricin')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    make autogen
    make release

    cd build
    mesonconf.py -Dprefix=/usr
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR=$pkgdir install
    # cover ${pkgdir}/usr/bin/Ricin"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
