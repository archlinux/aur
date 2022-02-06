# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='octavia'
pkgver=0.1.2
pkgrel=2
pkgdesc="octobanana's customizable text-based audio visualization interactive application"
arch=('x86_64')
url='https://octobanana.com/software/octavia'
license=('MIT')
depends=('boost-libs' 'sfml')
makedepends=('boost' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/octobanana/octavia/archive/refs/tags/${pkgver}.tar.gz"
        '0001-ArchLinux-Add-missing-include.patch')
sha256sums=('abc0717312178e24780081418ee7d7578ac3b721bce7fd307853688eb4cd1674'
            'c53aa1d86eed2c68731e03a2b8f418cf93858e51cbe7d6cab705207a77b7a933')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 \
          --input="${srcdir}/0001-ArchLinux-Add-missing-include.patch"
}

build() {
    CFLAGS="${CFLAGS} -DNDEBUG" CXXFLAGS="${CXXFLAGS} -DNDEBUG" \
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_RPATH='TRUE'
    cmake --build build
}

package() {
    install -Dvm755 "build/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dvm644 "${pkgname}-${pkgver}/"{'README.md','doc/help.txt'} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
