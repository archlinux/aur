# Maintainer: Chuanshanjia <1845776552@qq.com>
# Based on Qualcomm Software Center 1.28.2

pkgname=qualcomm-software-center
pkgver=1.28.2
pkgrel=1
pkgdesc="Qualcomm Software Center - Discover and download software distributions, service tasks, tools and change requests"
arch=('x86_64')
url="https://www.qualcomm.com/developer/software/qualcomm-software-center"
license=('custom')
depends=('electron41' 'hicolor-icon-theme')
makedepends=()
install=qualcomm-software-center.install
provides=('qualcomm-software-center')
conflicts=()
backup=()
options=('!strip' '!emptydirs')
source=("https://softwarecenter.qualcomm.com/api/download/software/tools/Qualcomm_Software_Center/Linux/Debian/${pkgver}/QualcommSoftwareCenter${pkgver}.Linux-x86.deb"
        "qualcomm-software-center.sh"
        "qualcomm-software-center.install")
sha256sums=('dbce860cd11ac3e190a5cacb3612a714e91198e97a737a2d146803cbb59a727d'
            'e283d6b9e441b9ccefe986582201b1608180be379af7b519f8aca02fbf330076'
            '9b58edaa2f2afd61a52b8145facd4cb793481edaf5e4d9f9dd8093a099b5822b')

prepare() {
    # 解压deb包
    ar x "QualcommSoftwareCenter${pkgver}.Linux-x86.deb"

    # 解压data.tar.xz
    mkdir -p temp_extract
    tar -xf data.tar.xz -C temp_extract

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

    # 安装应用文件（排除原始electron二进制）
    find temp_extract/opt/qcom/softwarecenter/bin -mindepth 1 -maxdepth 1 ! -name "softwarecenter" -exec cp -r {} "${_lib_dir}/" \;

    # 创建必要的目录并复制桌面文件
    install -d "${pkgdir}/usr/share/applications"
    cp temp_extract/usr/share/applications/qualcommsoftwarecenter.desktop "${pkgdir}/usr/share/applications/"
    sed -i "s|Exec=/opt/qcom/softwarecenter/bin/softwarecenter %u|Exec=/usr/bin/${pkgname} %u|g" "${pkgdir}/usr/share/applications/qualcommsoftwarecenter.desktop"

    # 复制图标
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    cp temp_extract/opt/qcom/softwarecenter/bin/resources/app/dist/assets/icons/software-center.png \
       "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qualcommsoftwarecenter.png"

    
    # 复制许可证
    install -Dm644 "temp_extract/opt/qcom/softwarecenter/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # 清理临时文件
    rm -rf temp_extract
    rm -f control.tar.xz data.tar.xz debian-binary
}
