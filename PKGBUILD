# Maintainer: Howetuft <howetuft at gmail dot com>

_pkgname='pbrt-v4'
pkgname="${_pkgname}-git"
pkgver=r1127.e98b6a1
pkgrel=1
pkgdesc="Physically based rendering system (CUDA disabled)"
arch=('x86_64')
url="https://pbrt.org"
license=('APACHE')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'git')
conflicts=('pbrt-v3-git')
source=("${_pkgname}::git+https://github.com/mmp/${_pkgname}#branch=master"
        "DisableCuda.patch")
md5sums=('SKIP'
         '89f724d6b0ac88fb95c2510a9a895009')

pkgver() {
        cd "${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        git -C "$srcdir/$_pkgname" apply -v "${srcdir}"/DisableCuda.patch
}

build() {
        cd "${_pkgname}"
        git submodule update --init --recursive
        mkdir -p build
        cd build
        cmake ../
        make
}

package() {
        cd "${srcdir}"
        install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
        install -Dm 644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm 755 "${_pkgname}/build/pbrt" "${pkgdir}/usr/bin/pbrt"
        install -Dm 755 "${_pkgname}/build/imgtool" "${pkgdir}/usr/bin/imgtool"
}
