# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-bun
_npmname=@ff-labs/fff-bun
pkgver=0.1.0_nightly.044314f
_npmver=${pkgver//_/-}
pkgrel=2
pkgdesc="High-performance fuzzy file finder for Bun, powered by a Rust native library"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/fff.nvim"
license=('MIT')
depends=('bun' 'glibc')
options=('!debug')
source=("${pkgname}-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}/-/fff-bun-${_npmver}.tgz"
        "LICENSE::https://raw.githubusercontent.com/dmtrKovalenko/fff.nvim/main/LICENSE")
source_x86_64=("${pkgname}-linux-x64-gnu-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}-linux-x64-gnu/-/fff-bun-linux-x64-gnu-${_npmver}.tgz")
source_aarch64=("${pkgname}-linux-arm64-gnu-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}-linux-arm64-gnu/-/fff-bun-linux-arm64-gnu-${_npmver}.tgz")
noextract=("${pkgname}-linux-x64-gnu-${_npmver}.tgz"
           "${pkgname}-linux-arm64-gnu-${_npmver}.tgz")
sha256sums=('e6030b405cffb55825f224abba4e4c3025d572d4e3383d5c95d516cadb67a459'
            'f8264de82db188834a5711d7e348dc08c33db14f79bb587ccb42616fd694ee81')
sha256sums_x86_64=('4abeccbbfbf82f753cc445dcf472418471589b34db7bf008f6f448550328732b')
sha256sums_aarch64=('bed88ad910fe34166551fde98379d827f31f85c4bc281b90b4df7a3ee53e63f9')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" |
        jq -r 'select(.optionalDependencies["@ff-labs/fff-bun-linux-x64-gnu"] == .version and .optionalDependencies["@ff-labs/fff-bun-linux-arm64-gnu"] == .version) | .optionalDependencies["@ff-labs/fff-bun-linux-x64-gnu"]' |
        tr '-' '_'
}

prepare() {
    case "${CARCH}" in
        x86_64)  _platform_tgz="${pkgname}-linux-x64-gnu-${_npmver}.tgz" ;;
        aarch64) _platform_tgz="${pkgname}-linux-arm64-gnu-${_npmver}.tgz" ;;
    esac
    mkdir -p "${srcdir}/platform"
    bsdtar -xf "${srcdir}/${_platform_tgz}" -C "${srcdir}/platform" --strip-components=1
}

package() {
    cd "${srcdir}/package"

    # Install main package files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r src scripts examples package.json README.md "${pkgdir}/usr/lib/${pkgname}/"

    # Install native binary where findBinary() expects it
    install -Dm755 "${srcdir}/platform/libfff_c.so" "${pkgdir}/usr/lib/${pkgname}/bin/libfff_c.so"

    # Wrapper script (named fff-bun to avoid conflict with AUR fff file manager)
    printf '#!/bin/sh\nexec bun /usr/lib/%s/scripts/cli.ts "$@"\n' "${pkgname}" |
        install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}"

    # License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
