# Maintainer: witchymary

_gitauthor=dnjulek
pkgname=zjpeg2png
pkgver=1.0.0
pkgrel=1
pkgdesc="Zig port of jpeg2png"

arch=('x86_64')

url="https://github.com/${_gitauthor}/${pkgname}"

license=('GPL-3.0-or-later')

makedepends=('zig>=0.16')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "pie.patch")
sha256sums=('2cb1bcff245bd2f9673b71c141c1521b45ce069b2de04d2722b5a9556fb25c41'
            '0641b8def7a2b9338ca3a6da19fed1b28529d22c7ac15b929b7ad7f8bb3b2795')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/pie.patch"
}

build() {
    cd "${pkgname}-${pkgver}" || exit

    zig build \
        -Doptimize=ReleaseFast \
        --prefix "${srcdir}/install" \
        --cache-dir "${srcdir}/.zig-cache" \
        --global-cache-dir "${srcdir}/.zig-global-cache" \
        --summary all
}

check() {
    cd "${pkgname}-${pkgver}" || exit
    zig build test \
        --cache-dir "${srcdir}/.zig-cache" \
        --global-cache-dir "${srcdir}/.zig-global-cache"
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "${srcdir}/install/bin/zjpeg2png" "${pkgdir}/usr/bin/zjpeg2png"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
