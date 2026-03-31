# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
pkgname=tbls-bin
pkgver=1.94.1
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database.Written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/k1LoW/tbls"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/k1LoW/tbls/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.rpm")
sha256sums=('6eefa0bec6e7c3654bdc29cb8f8c4adbc1327d2e912b532aacc68f6e2fa9d63c')
sha256sums_aarch64=('fa79061910fefecdcbb38f69b39202d2229c78ea76bb9236c0b639bfca0c9897')
sha256sums_x86_64=('30333e8804b2146e821a923df5ca272aae8adf7ba98a48d133441e7c1bfb3a62')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # 定义shell配置数组：[shell可执行路径, 补全命令参数, 输出目录, 输出文件名规则]
    local shell_configs=(
        "/usr/bin/bash:bash:usr/share/bash-completion/completions:${pkgname%-bin}"
        "/usr/bin/fish:fish:usr/share/fish/vendor_completions.d:${pkgname%-bin}.fish"
        "/usr/bin/zsh:zsh:usr/share/zsh/site-functions:_${pkgname%-bin}"
    )
    # 遍历配置，统一处理补全逻辑
    printf "%s\n" "${shell_configs[@]}" | while IFS=':' read -r shell_path comp_arg out_dir out_file; do
        # 判断shell是否存在
        if [ -f "${shell_path}" ]; then
            # 创建输出目录（-p 自动创建父目录，无需额外判断，兼容install标准用法）
            install -Dm755 -d "${pkgdir}/${out_dir}"
            # 生成补全文件
            "${srcdir}/usr/bin/${pkgname%-bin}" completion "${comp_arg}" > "${pkgdir}/${out_dir}/${out_file}"
        fi
    done
}