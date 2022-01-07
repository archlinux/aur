pkgname=7-zip-full
pkgver=21.07
pkgrel=1
pkgdesc="File archiver with a high compression ratio. Full package, attempt to replace p7zip."
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=(uasm)
provides=('7-zip' 'p7zip')
conflicts=('7-zip' 'p7zip')

_archive='7z2107-src.tar.xz'

source=(
    "${_archive}::${url}/a/${_archive}"
    'prepare.patch'
)

sha256sums=(
    '213d594407cb8efcba36610b152ca4921eda14163310b43903d13e68313e1e39'
    'aa93c9919fe87a51c94453888581f3ba936c3a85fb297d053270b5f6edd578d3'
)

prepare() {
    cd "${srcdir}"
    chmod -R a=r,u+w,a+X .
    patch -p0 -N --binary -i "${source[1]}"
}

_targets=("Alone" "Alone2" "Alone7z" "Format7zF")

build() {
    export BUILD_DIR="${srcdir}/build"
    local mak="${srcdir}/CPP/7zip/cmpl_gcc_x64.mak"
    for target in "${_targets[@]}"; do
        cd "${srcdir}/CPP/7zip/Bundles/${target}"
        make -f "${mak}"
    done
}

package() {
    cd "${BUILD_DIR}"

    local lib="/usr/lib/${pkgname}"
    local plib="${pkgdir}${lib}"
    local pbin=$(install -dm755 "${pkgdir}/usr/bin" && echo "$_")

    install -Dm755 -t "${plib}" "7za" "7zz" "7zr"
    install -Dm644 -t "${plib}" "7z.so"

    ln -s "${lib}/7za" "${pbin}/7za"
    ln -s "${lib}/7zz" "${pbin}/7z"
    ln -s "${lib}/7zz" "${pbin}/7zz"
    ln -s "${lib}/7zr" "${pbin}/7zr"

    cd "${srcdir}/DOC"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "copying.txt" "License.txt" "unRarLicense.txt"

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "7zC.txt" "7zFormat.txt" "lzma.txt" "Methods.txt" "readme.txt" "src-history.txt"
}
