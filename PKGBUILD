# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Andrea Orru <andrea at orru.io>

_pkgbase=asar
pkgname="snes-${_pkgbase}-git"
pkgver=1.91.r16.g5fd539c
pkgrel=1
pkgdesc='SNES assembler for applying patches to existing ROMs or creating new ROMs from scratch'
arch=('x86_64')
url="https://github.com/RPGHacker/${_pkgbase}"
license=('LGPL-3.0-or-later')
conflicts=("snes-${_pkgbase}")
depends=('glibc' 'libstdc++' 'libgcc')
makedepends=('cmake' 'git')

source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbase}"
    env CXXFLAGS="-Wno-volatile" cmake -U CMAKE_CXX_FLAGS src
    make
}

package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 "${_pkgbase}/bin/${_pkgbase}" "$pkgdir/usr/bin/${_pkgbase}"

    for l in LICENSE license-*.txt; do
        install -Dm644 "$l" "${pkgdir}/usr/share/licenses/${pkgname}/$l"
    done
}

