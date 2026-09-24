# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

# 上游只在 GitHub Releases 分发 Ubuntu/Debian 的 .deb，没有 Arch 包。
# 本包重打包官方 .deb，保证与 Debian 用户拿到同一份二进制。
#
# 需要改动的只有一处路径：deb 按 Debian multiarch 装到
# usr/lib/x86_64-linux-gnu/obs-plugins/，而 libobs 在 Arch 上只从
# /usr/lib/obs-plugins 加载。数据目录 /usr/share/obs/obs-plugins/<module>
# 两边一致，原样保留。

_pkgname=bilibili-live-obs
pkgname=${_pkgname}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="B站直播工具 OBS 插件 - 扫码登录/开播/停播/分区管理（官方 .deb 预编译版）"
arch=('x86_64')
url="https://github.com/devcxl/bilibili-live-obs-plugin"
license=('MIT')
# 依赖由 deb 的 Depends 对照 ldd/readelf NEEDED 换算而来：
#   libqt6{network,widgets,websockets,multimedia}6 -> qt6-base / qt6-websockets / qt6-multimedia
#   libcurl4 -> curl，libqrencode4 -> qrencode，libssl3 -> openssl，libbrotli1 -> brotli
#   libz.so.1 来自 qt6-base 等间接依赖，zlib 不属于 base 组，显式声明更稳
depends=(
    'obs-studio>=30.0'
    'qt6-base'
    'qt6-websockets'
    'qt6-multimedia'
    'curl'
    'qrencode'
    'openssl'
    'brotli'
    'zlib'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# 上游已构建好的二进制，不要重新 strip / 生成 debug 包
options=('!strip' '!debug')

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('7a9ea0ed6018a85d744e513d7023ec8c947c612be63aa973aa19f518e634ae9d')

package() {
    # .deb 是 ar 归档，makepkg 只拆到 data.tar.*，内层需要再拆一次。
    # 先解到中间目录，再按需安装：只装 .so 与数据目录，Debian 的 multiarch
    # 路径、上游的 .gitkeep 都不进包，不需要额外清理。
    # --no-same-owner：deb 里条目属主为 0:0，非 root 环境下 fakeroot 无法 chown，
    # 不加会以 "Can't set user=0/group=0" 中断构建。
    local _deb="${srcdir}/deb"
    rm -rf "${_deb}"
    mkdir -p "${_deb}"
    bsdtar --no-same-owner -xf "${srcdir}"/data.tar.* -C "${_deb}"

    # multiarch 目录 -> /usr/lib/obs-plugins（libobs 的插件搜索路径），
    # install 同时负责建目录与设 0755，对齐 Arch 其他 OBS 插件
    install -Dm755 "${_deb}/usr/lib/x86_64-linux-gnu/obs-plugins/lib${_pkgname}.so" \
        "${pkgdir}/usr/lib/obs-plugins/lib${_pkgname}.so"

    # 数据目录（locale 等）两边路径一致，整目录搬运以兼容上游后续新增文件。
    # 注意用 cp -r：cp -a 会尝试保留 0:0 属主，在 fakeroot 下报错。
    install -dm755 "${pkgdir}/usr/share/obs/obs-plugins"
    cp -r "${_deb}/usr/share/obs/obs-plugins/${_pkgname}" \
        "${pkgdir}/usr/share/obs/obs-plugins/"
    rm -f "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale/.gitkeep"
}
