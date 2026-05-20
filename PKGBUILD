pkgname=triginta-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='A local-first TUI Pomodoro timer and task manager.'
arch=('x86_64' 'aarch64')
url='https://triginta.app'
license=('GPL-3.0-only')
depends=()
provides=('triginta')
conflicts=('triginta')
source_x86_64=("triginta-${pkgver}-x86_64.tar.xz::https://github.com/jeansimeoni/triginta/releases/download/v0.1.9/triginta-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("triginta-${pkgver}-aarch64.tar.xz::https://github.com/jeansimeoni/triginta/releases/download/v0.1.9/triginta-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('058fd93baf628e1f1b9c4e79c6f714510b0f703aa358b4adf251947febed800d')
sha256sums_aarch64=('47856528e758e917acfe534511641f33fdf338a476e0b815640c304a8d4721b0')

package() {
    local archive=''
    local extract_dir="${srcdir}/triginta-${pkgver}-pkg"

    case "${CARCH}" in
        x86_64)
            archive="${srcdir}/triginta-${pkgver}-x86_64.tar.xz"
            ;;
        aarch64)
            archive="${srcdir}/triginta-${pkgver}-aarch64.tar.xz"
            ;;
        *)
            printf 'unsupported architecture: %s\n' "${CARCH}" >&2
            return 1
            ;;
    esac

    rm -rf "${extract_dir}"
    mkdir -p "${extract_dir}"
    bsdtar -xf "${archive}" -C "${extract_dir}"

    install -Dm755 "$(find "${extract_dir}" -type f -name triginta -print -quit)" "${pkgdir}/usr/bin/triginta"
    install -Dm644 "$(find "${extract_dir}" -type f -name LICENSE -print -quit)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$(find "${extract_dir}" -type f -name README.md -print -quit)" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "$(find "${extract_dir}" -type f -name CHANGELOG.md -print -quit)" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
