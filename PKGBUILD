# Maintainer: Jean Simeoni <opensource@users.noreply.github.com>
pkgname=ply-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Local-first package manager for coding-agent assets.'
arch=('x86_64' 'aarch64')
url='https://plycli.dev'
license=('GPL-3.0-only')
depends=('git')
provides=('ply')
conflicts=('ply')
source_x86_64=("ply-${pkgver}-x86_64.tar.xz::https://github.com/jeansimeoni/ply/releases/download/v0.2.1/ply-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("ply-${pkgver}-aarch64.tar.xz::https://github.com/jeansimeoni/ply/releases/download/v0.2.1/ply-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('534e1fe93f374e544fba539a27ccf29f88ef7bd4b0400a4cc0195f08ecf961ca')
sha256sums_aarch64=('c98dfa212986fc364a8187429d39d079a7786046b0d89be2bb177c4cab4a5390')

package() {
    local archive=''
    local extract_dir="${srcdir}/ply-${pkgver}-pkg"

    case "${CARCH}" in
        x86_64)
            archive="${srcdir}/ply-${pkgver}-x86_64.tar.xz"
            ;;
        aarch64)
            archive="${srcdir}/ply-${pkgver}-aarch64.tar.xz"
            ;;
        *)
            printf 'unsupported architecture: %s\n' "${CARCH}" >&2
            return 1
            ;;
    esac

    rm -rf "${extract_dir}"
    mkdir -p "${extract_dir}"
    bsdtar -xf "${archive}" -C "${extract_dir}"

    install -Dm755 "$(find "${extract_dir}" -type f -name ply -print -quit)" "${pkgdir}/usr/bin/ply"
    install -Dm644 "$(find "${extract_dir}" -type f -name LICENSE -print -quit)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$(find "${extract_dir}" -type f -name README.md -print -quit)" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "$(find "${extract_dir}" -type f -name CHANGELOG.md -print -quit)" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
