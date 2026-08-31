# Maintainer: chuanshanjia <1845776552@qq.com>
#
# 本包与 AUR 上的 genoffice-bin 是同一上游的两种不同打包方式，不是重复提交：
#   genoffice-bin      —— 将 deb 的 data.tar 原样解到 /opt/GenOffice，附带上游自带的
#                         Electron 运行时，/usr/bin/genoffice 是指向 /opt 的软链。
#   genoffice-electron —— 本包：改用系统的 electron43 运行，不安装上游 Electron。
#                         做法是解包 app.asar、把其中的 process.resourcesPath 改写为
#                         /usr/lib/genoffice 后重新打包，并用启动脚本调用 electron43。
# 因此本包体积小、Electron 安全更新随系统走；代价是依赖 electron43 且需要 asar 补丁。
# 两者都提供 /usr/bin/genoffice，文件互斥，故下面用 provides/conflicts 声明不能同装。

pkgname=genoffice-electron
_pkgname=genoffice
_dist_name="GenOffice"
_electronversion=43
pkgver=0.8.667
pkgrel=1
pkgdesc="Free, open-source AI office suite by Genspark — docs, sheets, slides, PDF and Markdown (system Electron)"
arch=('x86_64')
url="https://github.com/genspark-ai/genoffice"
license=('Apache-2.0')
depends=("electron${_electronversion}" 'hicolor-icon-theme' 'shared-mime-info')
makedepends=('asar')
provides=('genoffice')
conflicts=('genoffice' 'genoffice-bin')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/genspark-ai/genoffice/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=("${_pkgname}.sh")

sha256sums_x86_64=('76cc57d64526d3ff85752042be32df06ccdcb0b0739945df42d0a5f67f2a1258')
sha256sums=('67b5d78fb2ecdc193068957df2cf90cd96352f854b7dbf1bd882e69fbe8907b6')

prepare() {
    # 解压 deb 数据归档
    if [ -f "${srcdir}/data.tar.xz" ]; then
        bsdtar -xf "${srcdir}/data.tar.xz"
    elif [ -f "${srcdir}/data.tar.zst" ]; then
        bsdtar -xf "${srcdir}/data.tar.zst"
    fi

    local _res_path="/usr/lib/${_pkgname}"

    # 解包 app.asar，将所有 JS 文件中的 process.resourcesPath 替换为实际安装路径
    asar e "${srcdir}/opt/${_dist_name}/resources/app.asar" "${srcdir}/app-patched"
    find "${srcdir}/app-patched" -type f -name "*.js" \
        -exec sed -i "s|process\.resourcesPath|\"${_res_path}\"|g" {} +
    asar p "${srcdir}/app-patched" "${srcdir}/app.asar"

    # modules 目录中的 JS 同样引用了 process.resourcesPath，需要一并替换
    find "${srcdir}/opt/${_dist_name}/resources/modules" -type f -name "*.js" \
        -exec sed -i "s|process\.resourcesPath|\"${_res_path}\"|g" {} +

    # 填充启动脚本占位符
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${_pkgname}.sh"

    # 修正 .desktop 文件中的 Exec 行，指向系统启动器
    sed -i "s|Exec=.*|Exec=${_pkgname} %U|" \
        "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    local _lib_dir="${pkgdir}/usr/lib/${_pkgname}"

    # 安装启动脚本
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # 安装应用资源目录
    install -d "${_lib_dir}"

    # 使用修补后的 app.asar，同时拷贝其余资源（native、wasm、modules、gsk 等）
    install -Dm644 "${srcdir}/app.asar" "${_lib_dir}/app.asar"
    find "${srcdir}/opt/${_dist_name}/resources" -mindepth 1 -maxdepth 1 ! -name "app.asar" \
        -exec cp -a {} "${_lib_dir}/" \;

    # 确保原生辅助程序有执行权限
    chmod +x "${_lib_dir}/native/xlsx-sidecar"

    # 安装桌面文件
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # 安装图标
    install -d "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor/"

    # 安装 MIME 类型定义
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"

    # 安装许可证
    install -Dm644 "${srcdir}/opt/${_dist_name}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
