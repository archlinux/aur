pkgname=triginta-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A local-first TUI Pomodoro timer and task manager.'
arch=('x86_64' 'aarch64')
url='https://triginta.app'
license=('GPL-3.0-only')
depends=()
provides=('triginta')
conflicts=('triginta')
source_x86_64=("triginta-${pkgver}-x86_64.tar.xz::https://github.com/jeansimeoni/triginta/releases/download/v0.1.0/triginta-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("triginta-${pkgver}-aarch64.tar.xz::https://github.com/jeansimeoni/triginta/releases/download/v0.1.0/triginta-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('9c89c22498beb744b1db9e1f2b7f8ca371fdd34f0d694663902850bfe7547743')
sha256sums_aarch64=('1c24a1f82229f8f3e0de3d24bcd2ce38228d458533e98f3b670035d8acc1b760')

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
