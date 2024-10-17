# Maintainer: Vorschreibung <vorschreibung@gmail.com>
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=netradiant-custom-git
_pkgname=netradiant-custom
pkgver=latest.r42.g7ff91956
pkgrel=1
pkgdesc='The open-source, cross-platform level editor for id Tech based games.'
arch=('i686' 'x86_64')
license=('BSD-3-Clause AND LGPL-2.1-only AND GPL-2.0-only')
url="https://github.com/Garux/netradiant-custom"
depends=(
    'gcc-libs'
    'glib2'
    'glibc'
    'libjpeg-turbo'
    'libpng'
    'libxml2'
    'qt5-base'
    'zlib'
)
makedepends=(
    'gcc'
    'gcc-libs'
    'git'
    'make'
    'svn'
)
provides=('netradiant-custom' 'netradiant-custom-debug')
conflicts=('netradiant-custom' 'netradiant-custom-debug')

source=("${_pkgname}::git+${url}#branch=${BRANCH:-master}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/opt/${_pkgname}"

    cp -R "./install/." "${pkgdir}/opt/${_pkgname}/"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/"{h2data,mbspc,q2map,q3map2,qdata3} "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/"radiant                            "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 644 GPL     "$pkgdir/usr/share/licenses/$_pkgname/GPL"
    install -Dm 644 LGPL    "$pkgdir/usr/share/licenses/$_pkgname/LGPL"
}

# vim:set ft=sh syn=sh ts=4 sw=4 et:
