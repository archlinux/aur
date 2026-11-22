# Maintainer: Chuanshanjia <1845776552@qq.com>

pkgname=qualcomm-software-center
pkgver=1.32.1
pkgrel=3
pkgdesc="Qualcomm Software Center - Discover and download software distributions, service tasks, tools and change requests"
arch=('x86_64')
url="https://www.qualcomm.com/developer/software/qualcomm-software-center"
license=('custom')
depends=('electron41' 'hicolor-icon-theme')
install=qualcomm-software-center.install
options=('!strip' '!emptydirs')
source=("https://softwarecenter.qualcomm.com/api/download/software/tools/Qualcomm_Software_Center/Linux/Debian/${pkgver}/QualcommSoftwareCenter${pkgver}.Linux-x86.deb"
        "qualcomm-software-center.sh"
        "qualcomm-software-center.install")
sha256sums=('eb74ccc4bf1978d8c888db3b94bc48dafd3d20050bb3b5748aff673f94422d3a'
            '0fc617df91468164544287aefecc2ed2d46be6883ae391df23d56c1c00b02d44'
            '98afada75658fbd6b03a53f0e09120b18b236b09965a8acecbf14aceead081f5')

prepare() {
    # makepkg 已经用 bsdtar 解开 deb（ar 归档），data.tar.* 就在 $srcdir 里；
    # 这里只解数据归档，不再重复 ar x，并兼容 xz/zst 两种压缩。
    mkdir -p temp_extract
    if [[ -f data.tar.xz ]]; then
        bsdtar -xf data.tar.xz -C temp_extract
    elif [[ -f data.tar.zst ]]; then
        bsdtar -xf data.tar.zst -C temp_extract
    else
        error "未找到 deb 的 data.tar.xz/data.tar.zst"
        return 1
    fi

    # 修改应用代码中的资源路径（保持原deb包路径不变）
    if [[ -d "temp_extract/opt/qcom/softwarecenter/bin/resources/app" ]]; then
        find "temp_extract/opt/qcom/softwarecenter/bin/resources/app" -type f -name "*.js" -exec sed -i "s|process.resourcesPath|\"/opt/qcom/softwarecenter/bin/resources\"|g" {} +

        # Arch 的 /etc/os-release 没有 VERSION_ID，读取失败会导致 QLHandler 初始化崩溃
        sed -i 's@osReleaseInfoMap.get("VERSION_ID").replace@(osReleaseInfoMap.get("VERSION_ID") || "rolling").replace@g' \
            "temp_extract/opt/qcom/softwarecenter/bin/resources/app/dist/start-server.js"

        # 上游写死的 /local/mnt/workspace 在普通系统上不可写，改成用户可写的默认下载目录
        sed -i 's|\[enums_1.Path.PRODUCT_DOWNLOAD, "/local/mnt/workspace/"\]|[enums_1.Path.PRODUCT_DOWNLOAD, "/var/tmp/qcom/softwarecenter/downloads"]|g' \
            "temp_extract/opt/qcom/softwarecenter/bin/resources/app/dist/main.js" \
            "temp_extract/opt/qcom/softwarecenter/bin/resources/app/dist/start-server.js"
    fi
}

package() {
    # 安装启动脚本
    install -Dm755 "${srcdir}/qualcomm-software-center.sh" "${pkgdir}/usr/bin/${pkgname}"

    # 安装应用资源目录
    local _lib_dir="${pkgdir}/opt/qcom/softwarecenter/bin"
    install -d "${_lib_dir}"

    # 安装应用文件：只装 QSC 自己的运行时（qik/qsc-cli/resources），
    # 上游 deb 里附带的 Electron 运行时（二进制、*.pak、locales、swiftshader 等）
    # 一律不要——本包用系统 electron41，装了也只会白占约 100MB。
    local _item
    for _item in temp_extract/opt/qcom/softwarecenter/bin/*; do
        case "${_item##*/}" in
            softwarecenter | locales | \
            chrome-sandbox | chrome_crashpad_handler | chrome_*.pak | resources.pak | \
            icudtl.dat | snapshot_blob.bin | v8_context_snapshot.bin | version | \
            vk_swiftshader_icd.json | *.so | *.so.*)
                continue
                ;;
        esac
        cp -a "${_item}" "${_lib_dir}/"
    done

    # 记录应用版本，安装脚本用它更新 QIK 组件数据库
    echo "${pkgver}" > "${pkgdir}/opt/qcom/softwarecenter/bin/qsc-version"

    # 创建必要的目录并复制桌面文件
    install -d "${pkgdir}/usr/share/applications"
    cp temp_extract/usr/share/applications/qualcommsoftwarecenter.desktop "${pkgdir}/usr/share/applications/"
    sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname} %u|" "${pkgdir}/usr/share/applications/qualcommsoftwarecenter.desktop"
    if ! grep -q "^Exec=/usr/bin/${pkgname} %u$" "${pkgdir}/usr/share/applications/qualcommsoftwarecenter.desktop"; then
        error "desktop 文件的 Exec 补丁失败，上游 desktop 结构可能已变化"
        return 1
    fi

    # 复制图标
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    cp temp_extract/opt/qcom/softwarecenter/bin/resources/app/dist/assets/icons/software-center.png \
       "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qualcommsoftwarecenter.png"

    
    # 复制许可证
    install -Dm644 "temp_extract/opt/qcom/softwarecenter/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
