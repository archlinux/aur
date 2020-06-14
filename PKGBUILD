# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Marten Kante <tiyn@martenkante.eu>
pkgname=st-tiyn-git
_pkgname=st-tiyn
pkgver=0.8.2
pkgrel=1
epoch=
pkgdesc="This is the st build of tiyn. It includes a bunch of patches."
arch=('x86_64' 'i686')
url="https://github.com/tiyn/st"
license=('MIT')
groups=()
depends=('libxft-bgra')
makedepends=(git)
checkdepends=()
optdepends=()
provides=('st')
conflicts=('st')
replaces=('st')
backup=()
options=()
install=
changelog=
source=("${_pkgname}::git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
    printf "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "${_pkgname}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
