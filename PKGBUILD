pkgname=7-zip-full
pkgver=22.01
pkgrel=3
pkgdesc="File archiver with a high compression ratio. (Full package to replace p7zip.)"
url="https://www.7-zip.org"
license=(LGPL)
arch=('x86_64' 'i686' 'aarch64')
makedepends=('uasm')
[ "${CC}" == 'clang' ] && makedepends+=('clang' 'lld')
provides=("${pkgname%-full}" 'p7zip')
conflicts=("${provides[@]}")

_archive="7z${pkgver//./}-src.tar.xz"

source=(
    "${_archive}::${url}/a/${_archive}"
    'prepare.patch'
)

sha256sums=(
    '393098730c70042392af808917e765945dc2437dee7aae3cfcc4966eb920fbc5'
    '4e010de2dce2eebbe72d0e9f72fbf953eb2f8cba7bffbae53bda1544e3879101'
)

prepare() {
    cd "${srcdir}"
    chmod -R a=r,a+X,u+w .
    patch -p0 --binary -i "${source[1]}"
}

build() {
    local bundles="${srcdir}/CPP/7zip/Bundles"
    local targets=("Alone" "Alone2" "Alone7z" "Format7zF")
    local -A platforms=(['x86_64']='x64' ['i686']='x86' ['aarch64']='arm64')
    local build_dir="${srcdir}/build"
    mkdir -p "${build_dir}"

    (
        set -a
        PLATFORM="${platforms["${CARCH}"]}"
        O="${build_dir}"
        IS_X64=$([ "${PLATFORM}" == 'x64' ] && echo '1' || echo '')
        IS_X86=$([ "${PLATFORM}" == 'x86' ] && echo '1' || echo '')
        IS_ARM64=$([ "${PLATFORM}" == 'arm64' ] && echo '1' || echo '')
        MY_ARCH=
        USE_ASM=1
        CC="${CC:-gcc}"
        CXX="${CXX:-g++}"
        CFLAGS_WARN='-Wno-error'
        set +a

        for target in "${targets[@]}"; do
            make -C "${bundles}/${target}" -f 'makefile.gcc'
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
