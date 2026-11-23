# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
pkgname=tbls-bin
pkgver=1.97.0
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database.Written in Go."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/k1LoW/tbls"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/k1LoW/tbls/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.rpm")
sha256sums=('6eefa0bec6e7c3654bdc29cb8f8c4adbc1327d2e912b532aacc68f6e2fa9d63c')
sha256sums_aarch64=('65c5610515ec867397eb67d8f3e71ed89c52a7b2e9b66d481e28c5989e3d71d9')
sha256sums_x86_64=('0a7e4271571157f0bde0e23496f035abf558e453c754fd2dd42c2395e524e1c2')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    local shell_configs=(
        "/usr/bin/bash:bash:usr/share/bash-completion/completions:${pkgname%-bin}"
        "/usr/bin/fish:fish:usr/share/fish/vendor_completions.d:${pkgname%-bin}.fish"
        "/usr/bin/zsh:zsh:usr/share/zsh/site-functions:_${pkgname%-bin}"
    )
    printf "%s\n" "${shell_configs[@]}" | while IFS=':' read -r shell_path comp_arg out_dir out_file; do
        if [ -f "${shell_path}" ]; then
            install -Dm755 -d "${pkgdir}/${out_dir}"
            "${srcdir}/usr/bin/${pkgname%-bin}" completion "${comp_arg}" > "${pkgdir}/${out_dir}/${out_file}"
        fi
    done
}