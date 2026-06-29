# Maintainer: Jean Simeoni <opensource@users.noreply.github.com>
pkgname=ply-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Local-first package manager for coding-agent assets.'
arch=('x86_64' 'aarch64')
url='https://plycli.dev'
license=('GPL-3.0-only')
depends=('git')
provides=('ply')
conflicts=('ply')
source_x86_64=("ply-${pkgver}-x86_64.tar.xz::https://github.com/jeansimeoni/ply/releases/download/v0.1.2/ply-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("ply-${pkgver}-aarch64.tar.xz::https://github.com/jeansimeoni/ply/releases/download/v0.1.2/ply-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('d2c7812e95936046d41bac6cade47b0d3196e82e3473dfb44d4b633d049babff')
sha256sums_aarch64=('b1af88db716c106e52c27ee4f5172c3b90bfff2eb75a5af5fb98b9982d0bc9d1')

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
