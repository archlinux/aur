pkgname=7-zip-full
pkgver=21.07
pkgrel=4
pkgdesc="File archiver with a high compression ratio. (Full package to replace p7zip.)"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=('uasm')
provides=('7-zip' 'p7zip')
conflicts=("${provides[@]}")

_archive='7z2107-src.tar.xz'

source=(
    "${_archive}::${url}/a/${_archive}"
    'prepare.patch'
)

sha256sums=(
    '213d594407cb8efcba36610b152ca4921eda14163310b43903d13e68313e1e39'
    '002a663deebc09ada0d7c7372b441c2ed1f017e4866c1602a4409f06c8aab071'
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
