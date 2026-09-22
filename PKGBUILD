# Maintainer: ZCode-CE <https://github.com/Zcode-CE/Zcode-CE/issues>
#
# 为什么直接安装官方构建的 pacman 包，而不是用系统 Electron 重新组装：
# 上游的 zcode-bin 走「下载 .deb + asar 解包 + 系统 Electron 启动」的路线，体积小，
# 但把 Electron 版本耦合给了发行版 —— Electron 大版本升级时应用可能起不来。
# 本包直接安装我们 CI 产出的 .pkg.tar.zst：它自带 Electron，与 Release 里的产物完全一致，
# 用户装到的就是我们构建并测试过的那一份。
#
# 该包由 electron-builder 用 fpm 生成，依赖、桌面文件、图标、chrome-sandbox 处理都已就绪，
# 因此这里不需要额外加工，只做下载与校验。

pkgname=zcode-ce-bin
_pkgname=ZCode-CE
pkgver=3.14.3.ce.1
# 上游版本号形如 3.14.1-ce.1；pacman 的 pkgver 不允许连字符，改用点号。
# 与包内 .PKGINFO 的 3.14.1_ce.1 对应，语义相同。
pkgrel=1
pkgdesc="ZCode 的开源社区版：移除遥测、保留官方服务权益、开源文档与桌面自动化能力"
arch=('x86_64')
url="https://github.com/Zcode-CE/Zcode-CE"
license=('Apache-2.0')
# 依赖与包内 .PKGINFO 的 depend 列表一致（由 electron-builder 依据 Electron 运行时算出）。
# 本包自带 Electron，因此不依赖 electronNN。
depends=(
    'gtk3'
    'nss'
    'libxss'
    'libxtst'
    'libnotify'
    'alsa-lib'
    'mesa'
    'xdg-utils'
)
# chrome-sandbox 的 setuid 位只能在安装后设置，见 zcode-ce-bin.install。
install=zcode-ce-bin.install
# 产物已由上游构建与体积审计，不需要本地 strip。
options=('!strip')

# 上游的版本号与 tag 形如 3.14.1-ce.1（含连字符），而 pacman 的 pkgver 不允许连字符，
# 所以 pkgver 用点号形式 3.14.1.ce.1，下载地址仍按上游原样拼接。
_upstream_ver=3.14.3-ce.1
_upstream_tag=v3.14.3-ce.1

source=(
    "${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/Zcode-CE/Zcode-CE/releases/download/${_upstream_tag}/${_pkgname}-${_upstream_ver}-linux-x64.pkg.tar.zst"
)
sha256sums=('e545e50eedaa1bee7e8eea3e02b337ee64feabcaff40e0608c89cd434bd8ca6a')

package() {
    # 源就是我们自己的 pacman 包：直接解到 ${pkgdir} 即可，不需要再打包一次。
    # 解包会把 opt/ 与 usr/share/ 下的文件（含 .desktop 与 hicolor 图标）原样落地。
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude=.PKGINFO --exclude=.INSTALL --exclude=.MTREE --exclude=.BUILDINFO

    # 上游包的 .INSTALL 会创建 /usr/bin/zcode-ce 软链并处理 chrome-sandbox 权限，
    # 但那个 .INSTALL 不随包内容复制（它是源包的元数据，不是文件）。这里补上可执行入口：
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/zcode-ce" "${pkgdir}/usr/bin/zcode-ce"

    # chrome-sandbox 的 setuid 位**不能**在这里设：makepkg 打包时会规范化权限并剥离
    # setuid，chmod 4755 不会进入最终包（实测新包仍是 755）。它改由 .install 的
    # post_install 处理，与上游 .deb 包的做法一致。
}
