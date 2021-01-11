# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=movfuscator-git
pkgver=r48.ea37dae
pkgrel=2
pkgdesc="The single instruction C compiler"
arch=('x86_64')
provides=('movcc' 'movfuscator')
conflicts=('movcc' 'movfuscator')
makedepends=('gcc-multilib' 'git')
url="https://github.com/xoreaxeaxeax/movfuscator"
license=('BSD')
source=("$pkgname::git+$url.git"
		"ldargs.patch"
		"wrong_builtin_binary_path.patch"
		"movcc")
sha256sums=('SKIP'
            'd8d19cbca2954f523c66543f2e7d00f7296cdf40a970cefd4a6326dc51e90c48'
            '4f44b4ce54da6568d801d04b642c51217f70cbe558907027dd3b09aad294151f'
            'b85126987376ecec037b483e38eafd20ad6f0dec111485091ffdcfd8000d0276')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	git -C "${pkgname}" apply --ignore-space-change --ignore-whitespace "${srcdir}/ldargs.patch"
	#git -C "${pkgname}" apply --ignore-space-change --ignore-whitespace "${srcdir}/wrong_builtin_binary_path.patch"
}

build() {
    cd "${pkgname}"

    ./build.sh
}

package() {
	mkdir -p "${pkgdir}/usr/share/movfuscator"
    cp -rv "${srcdir}/${pkgname}/post" "${pkgdir}/usr/share/movfuscator/post"

    find "${pkgdir}/usr/share/movfuscator/post" -type f -name *.py -print -exec sed -i '1s=^=#!/bin/env python2\n=' {} \;
    find "${pkgdir}/usr/share/movfuscator/post" -type f -name *.py -print -exec chmod 755 {} \;

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}/build/movcc" "${pkgdir}/usr/share/movfuscator/bin/movcc"
    install -Dm755 "${srcdir}/${pkgname}/build/rcc" "${pkgdir}/usr/share/movfuscator/bin/rcc"
    install -Dm755 "${srcdir}/movcc" "${pkgdir}/usr/bin/movcc"
}
