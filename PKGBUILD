# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=mworks-syslab
pkgver=26.2.0
pkgrel=1
pkgdesc="MWORKS.Syslab 是新一代科学计算环境，旨在为算法开发、数值计算、数据分析和可视化、信息域计算分析等提供通用编程开发环境"
arch=('x86_64')
url="https://www.tongyuan.cc/"
license=('custom:proprietary')

# 软件自带 Qt / Julia / Python，但仍依赖系统的 X11 / GLX / 音频 / 无障碍等库
depends=(
    'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxtst'
    'mesa' 'nss' 'nspr' 'at-spi2-core' 'alsa-lib' 'gtk3' 'glib2'
)
optdepends=('qt5-tools: 在 KDE 下注册文件类型关联')
makedepends=('patchelf')

options=('!debug' '!strip' '!emptydirs')
install="${pkgname}.install"

_release="2026a"
_build="7202"
_runfile="MWORKS.Syslab-${_release}-${pkgver}.${_build}-linux-x64.run"

source=("https://releases.tongyuan.cc/installer/syslab/${_release}/${_runfile}"
        "fix_checksum.py"
        "mworks-syslab-help.desktop")
noextract=("${_runfile}")
sha256sums=('b7a1408ca0a9577a7c359c05d2b8224781d95bc9a8ad5d2d30aea726d84c6338'
            'c67aa1f73ccacaced6f916698d82e3d13c7e5f03386469bb2bd914e11f823931'
            '4c275314d8c61945c6596d8bc809992f49b243ec64fe72dd71ffeeb52a166b56')

_instdir="/opt/mworks-syslab"

prepare() {
    msg2 "从 .run 安装包中提取内嵌归档..."
    sed -n '1,/^exit 0$/!p' "${srcdir}/${_runfile}" > "${srcdir}/syslab.tar.gz"
}

package() {
    install -dm755 "${pkgdir}${_instdir}"
    msg2 "正在解压归档，请稍候..."
    tar --blocking-factor=255209 -xf "${srcdir}/syslab.tar.gz" -C "${pkgdir}${_instdir}" --touch 2>/dev/null

    # 清除所有共享库的可执行栈标记（GNU_STACK RWE），Arch 内核默认拒绝该权限
    msg2 "清除共享库可执行栈标记..."
    find "${pkgdir}${_instdir}" -name '*.so*' -type f -exec patchelf --clear-execstack {} \; 2>/dev/null

    # 替换脚本中 conda 的安装路径
    sed -i "s|/usr/local/share/TongYuan|${_instdir}|g" "${pkgdir}${_instdir}/.julia/miniforge3/bin/conda"

    # 删除仅供 CentOS 使用的 libxkbcommon-x11 库，Arch 自带该库
    local _pyqt_lib="${pkgdir}${_instdir}/.julia/miniforge3/lib/python3.11/site-packages/PyQt5/Qt/lib"
    rm -f "${_pyqt_lib}/libxkbcommon-x11.so.0"
    rm -f "${_pyqt_lib}/libxkbcommon-x11.so.0.0.0"

    # Julia 本地包注册（Pkg.develop）
    msg2 "注册内置 Julia 本地包..."
    local _julia_bin="${pkgdir}${_instdir}/Tools/julia-1.10.10/bin/julia"
    JULIA_DEPOT_PATH="${pkgdir}${_instdir}/.julia" \
    JULIA_CONDAPKG_BACKEND=Null \
    PYTHON_JULIAPKG_OFFLINE=yes \
        "${_julia_bin}" "${pkgdir}${_instdir}/Install/config/dev_libraries.jl" \
        "${pkgdir}${_instdir}"
    # Pkg.develop 在 Manifest.toml 中写入含 pkgdir 前缀的绝对路径，需替换为安装路径
    sed -i "s|${pkgdir}||g" "${pkgdir}${_instdir}/.julia/environments/v1.10/Manifest.toml"

    # 删除 Julia 包管理器运行时日志
    rm -rf "${pkgdir}${_instdir}/.julia/logs"

    # desktop.sh 硬编码了 gnome-terminal，非 GNOME 环境下不可用
    sed -i 's/^gnome-terminal -- //' "${pkgdir}${_instdir}/Bin/desktop.sh"

    # 修复"关于"对话框无法关闭的问题：
    # Arch Linux 的 /etc/os-release 没有 VERSION_ID 字段，
    # lines.find(...'VERSION_ID').replace() 返回 undefined 直接调 .replace() 抛异常，
    # 导致后续所有 addEventListener 包括关闭按钮都未执行
    sed -i \
        "s/lines\.find(line => line\.startsWith('VERSION_ID'))\.replace(/( lines.find(line => line.startsWith('VERSION_ID')) || 'VERSION_ID=').replace(/g" \
        "${pkgdir}${_instdir}/Bin/resources/app/out/vs/workbench/workbench.desktop.main.js"

    # 修复因上面 patch 导致的完整性校验失败（每次启动时右下角弹出「安装似乎损坏」提示）：
    # VS Code 在 product.json 存储核心文件的 md5-base64 校验值，patch 后需要更新
    local _product="${pkgdir}${_instdir}/Bin/resources/app/product.json"
    local _mainjs="${pkgdir}${_instdir}/Bin/resources/app/out/vs/workbench/workbench.desktop.main.js"
    python3 "${srcdir}/fix_checksum.py" "$_product" "$_mainjs"

    # 注入 QT_QPA_PLATFORM=xcb，避免每次全新启动 Julia 终端后，调用绘图函数时输出 Wayland 插件缺失警告
    # Syslab 设置 JULIA_DEPOT_PATH=$HOME/TongYuan/.julia:...(system)，Julia 只从首条目加载 用户级 startup.jl，故需写入随 Julia 二进制分发的系统级 startup.jl
    echo 'ENV["QT_QPA_PLATFORM"] = "xcb"' >> "${pkgdir}${_instdir}/Tools/julia-1.10.10/etc/julia/startup.jl"

    # 帮助文档快捷方式（Syslab 帮助中心在 Linux 上存在 bug 无法工作，提供独立 .desktop 入口，直接用系统浏览器打开静态文档页面）
    install -Dm644 "${srcdir}/mworks-syslab-help.desktop" "${pkgdir}/usr/share/applications/${pkgname}-help.desktop"

    # 许可证占位
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MWORKS.Syslab 是同元软控（TongYuan Co., Ltd.）的专有软件。" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
