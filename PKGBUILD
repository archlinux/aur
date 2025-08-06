# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=level-zero-legacy
pkgname=(
    'level-zero-headers-legacy'
    'level-zero-loader-legacy')
pkgver=1.17.44
pkgrel=1
pkgdesc='API for accessing low level interfaces in oneAPI platform devices (legacy platforms)'
arch=('x86_64')
url='https://spec.oneapi.com/versions/latest/elements/l0/source/index.html'
license=('MIT')
makedepends=(
    'cmake'
    'git'
    'opencl-headers')
source=("https://github.com/oneapi-src/level-zero/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('14c8e2bece1e6f606192446957d15263f4514c538f8b19d524d694fdf24da7a5')

prepare() {
    printf '%s\n' "${pkgver##*.}" > "level-zero-${pkgver}/VERSION_PATCH"
}

build() {
    cmake -B build -S "level-zero-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DSYSTEM_SPDLOG:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package_level-zero-headers-legacy() {
    pkgdesc="$(sed 's/)/; headers)/' <<< "$pkgdesc")"
    arch=('any')
    provides=("level-zero-headers=${pkgver}")
    conflicts=('level-zero-headers')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "level-zero-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove loader files
    [ -d 'loader' ] && rm -rf loader
    install -d loader/lib
    mv "${pkgdir}/usr/lib"/*so* loader/lib
}

package_level-zero-loader-legacy() {
    pkgdesc="$(sed 's/)/; loader)/' <<< "$pkgdesc")"
    depends=(
        'gcc-libs'
        'glibc')
    provides=("level-zero-loader=${pkgver}")
    conflicts=('level-zero-loader')
    
    mv loader "${pkgdir}/usr"
    install -D -m644 "level-zero-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
