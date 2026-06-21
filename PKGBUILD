# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-bun
_npmname=@ff-labs/fff-bun
pkgver=0.9.6
pkgrel=1
pkgdesc="High-performance fuzzy file finder for Bun, powered by a Rust native library"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/fff.nvim"
license=('MIT')
depends=('bash' 'bun' 'glibc')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/fff-bun-${pkgver}.tgz"
        "LICENSE::https://raw.githubusercontent.com/dmtrKovalenko/fff.nvim/main/LICENSE")
source_x86_64=("${pkgname}-linux-x64-gnu-${pkgver}.tgz::https://registry.npmjs.org/@ff-labs/fff-bin-linux-x64-gnu/-/fff-bin-linux-x64-gnu-${pkgver}.tgz")
source_aarch64=("${pkgname}-linux-arm64-gnu-${pkgver}.tgz::https://registry.npmjs.org/@ff-labs/fff-bin-linux-arm64-gnu/-/fff-bin-linux-arm64-gnu-${pkgver}.tgz")
noextract=("${pkgname}-linux-x64-gnu-${pkgver}.tgz"
           "${pkgname}-linux-arm64-gnu-${pkgver}.tgz")
sha256sums=('e05f17fee0eb7d2f0666f7ee7bb3d73f558d1d99462c20231d0a861082c3df07'
            'f8264de82db188834a5711d7e348dc08c33db14f79bb587ccb42616fd694ee81')
sha256sums_x86_64=('7582a6fe1e4423fb4ef4cae1118cbfff19c8e8dbd051e99ccf8f0d1f5149e2a9')
sha256sums_aarch64=('f28ceb6122be47fca00db0f4e05d26b3061ef16b701335a3ca0d230e04ca01fc')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" |
        jq -r 'select(.optionalDependencies["@ff-labs/fff-bin-linux-x64-gnu"] == .version and .optionalDependencies["@ff-labs/fff-bin-linux-arm64-gnu"] == .version) | .version'
}

prepare() {
    case "${CARCH}" in
        x86_64)  _platform_tgz="${pkgname}-linux-x64-gnu-${pkgver}.tgz" ;;
        aarch64) _platform_tgz="${pkgname}-linux-arm64-gnu-${pkgver}.tgz" ;;
    esac
    mkdir -p "${srcdir}/platform"
    bsdtar -xf "${srcdir}/${_platform_tgz}" -C "${srcdir}/platform" --strip-components=1
}

package() {
    cd "${srcdir}/package"

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r src examples package.json README.md "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm755 "${srcdir}/platform/libfff_c.so" "${pkgdir}/usr/lib/${pkgname}/bin/libfff_c.so"

    install -dm755 "${pkgdir}/usr/bin"
    for _cmd in fff-demo:examples/search.ts fff-grep:examples/grep.ts; do
        _name=${_cmd%%:*}
        _target=${_cmd#*:}
        cat > "${pkgdir}/usr/bin/${_name}" <<EOF
#!/bin/sh
exec bun /usr/lib/${pkgname}/${_target} "\$@"
EOF
        chmod 755 "${pkgdir}/usr/bin/${_name}"
    done

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
