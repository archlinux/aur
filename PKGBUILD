# Maintainer: NekoLOvO <nekolyin@qq.com>
pkgname=com.qq.weixin.work.deepin
pkgver=4.1.32.6005deepin2
pkgrel=1
arch=('x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin"
licnese=('Proprietary')
depends=(
    'wqy-microhei'
    'deepin-wine8-stable'
    'spark-dwine-helper'
    'binutils'
)
source=(
    "${url}/${pkgname}_${pkgver}-${pkgrel}_all.deb"
    "${url}/${pkgname}_${pkgver}-${pkgrel}_all.deb.metalink"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}"
    # 从 metalink 文件中提取 md5 和 sha1 校验和
    local md5=$(grep -oP '(?<=<hash type="md5">)[a-f0-9]+' "${pkgname}_${pkgver}-${pkgrel}_all.deb.metalink")
    local sha1=$(grep -oP '(?<=<hash type="sha1">)[a-f0-9]+' "${pkgname}_${pkgver}-${pkgrel}_all.deb.metalink")
    # 验证 deb 文件的 md5 校验和
    echo "检查 MD5 和 SHA1 校验和..."
    if [[ -n "$md5" ]]; then
        echo "$md5  ${pkgname}_${pkgver}-${pkgrel}_all.deb" | md5sum -c -
    fi
    # 验证 deb 文件的 sha1 校验和
    if [[ -n "$sha1" ]]; then
        echo "$sha1  ${pkgname}_${pkgver}-${pkgrel}_all.deb" | sha1sum -c -
    fi
}

package() {
    cd "${srcdir}"
    # 解压 deb 文件
    ar -x "com.qq.weixin.work.deepin_${pkgver}-${pkgrel}_all.deb"
    # 解压 tar.gz 文件
    if [ -f "${srcdir}/data.tar.gz" ]; then
        bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    fi
    # 处理字体
    install -Dm644 /usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc \
        "${pkgdir}/opt/deepin-wine8-stable/share/wine/fonts/wqy-microhei.ttc"
    # 处理 desktop 和 icon 文件
    mkdir -p "${pkgdir}/usr/share"
    cp -rf "${pkgdir}/opt/apps/${pkgname}/entries/"* "${pkgdir}/usr/share"
}
