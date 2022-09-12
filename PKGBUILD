pkgname=7-zip-full
pkgver=22.01
pkgrel=1
pkgdesc="File archiver with a high compression ratio. (Full package to replace p7zip.)"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=('uasm')
provides=("${pkgname%-full}" 'p7zip')
conflicts=("${provides[@]}")

_archive="7z${pkgver//./}-src.tar.xz"

source=(
    "${_archive}::${url}/a/${_archive}"
    'prepare.patch'
)

sha256sums=(
    '393098730c70042392af808917e765945dc2437dee7aae3cfcc4966eb920fbc5'
    '9682e6493d372424be837f2385820935a104b7ce60c3dc8946fdaaefd00ac21f'
)

prepare() {
    cd "${srcdir}"
    chmod -R a=r,a+X,u+w .
    patch -p0 --binary -i "${source[1]}"
}

build() {
    local bundles="${srcdir}/CPP/7zip/Bundles"
    local mak="${srcdir}/CPP/7zip/cmpl_gcc_x64.mak"
    local targets=("Alone" "Alone2" "Alone7z" "Format7zF")
    (
        export BUILD_DIR="${srcdir}/build"
        mkdir -p "${BUILD_DIR}"
        for target in "${targets[@]}"; do
            make -C "${bundles}/${target}" -f "${mak}"
        done
    )
}

package() {
    local bin="${pkgdir}/usr/bin"

    cd "${srcdir}/build"
    install -Dm755 -t "${bin}" "7za" "7zz" "7zr"
    ln -s "7zz" "${bin}/7z"
    install -Dm644 -t "${pkgdir}/usr/lib" "7z.so"

    cd "${srcdir}/DOC"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        "copying.txt" "License.txt" "unRarLicense.txt"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        "7zC.txt" "7zFormat.txt" "lzma.txt" "Methods.txt" "readme.txt" "src-history.txt"
}
