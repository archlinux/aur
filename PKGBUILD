# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=mworks-syslab
pkgver=26.8.0
pkgrel=1
pkgdesc="MWORKS.Syslab 是新一代科学计算环境，旨在为算法开发、数值计算、数据分析和可视化、信息域计算分析等提供通用编程开发环境"
arch=('x86_64')
url="https://www.tongyuan.cc/"
license=('custom:proprietary')

# 软件自带 Qt / Julia / Python，但仍依赖系统的 X11 / GLX / 音频 / 无障碍等库
depends=(
    'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxtst'
    'mesa' 'nss' 'nspr' 'at-spi2-core' 'alsa-lib' 'gtk3' 'glib2'
    'libxkbcommon-x11' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'unzip'
)
optdepends=('qt5-tools: 在 KDE 下注册文件类型关联')
makedepends=('patchelf')

options=('!debug' '!strip' '!emptydirs')
install="${pkgname}.install"

_release="2026b"
_build="9029"
_runfile="MWORKS.Syslab-${_release}-${pkgver}.${_build}-linux-x64.run"

source=("https://releases.tongyuan.cc/installer/syslab/${_release}/${_runfile}"
        "${pkgname}.desktop")
noextract=("${_runfile}")
sha256sums=('ba19cae7f3ecddca3d0d103754bbba94a7034428e4e67980ccc7a926da80a72c'
            '1459a664b8564f1c2f3b1a8942da47c8427b876aeccd4a32b09b3cad66048217')

_instdir="/opt/mworks-syslab"

package() {
    install -dm755 "${pkgdir}${_instdir}"
    # 从 .run 安装包中流式提取内嵌归档并解压，避免在 srcdir 中额外生成一份约 5GB 的 tar.gz
    msg2 "正在解压归档，请稍候..."
    LC_ALL=C sed -n '1,/^exit 0$/!p' "${srcdir}/${_runfile}" | tar -xzf - -C "${pkgdir}${_instdir}" --touch
    (( PIPESTATUS[0] == 0 && PIPESTATUS[1] == 0 )) || return 1

    # 清除所有共享库的可执行栈标记（GNU_STACK RWE），Arch 内核默认拒绝该权限
    msg2 "清除共享库可执行栈标记..."
    find "${pkgdir}${_instdir}" -name '*.so*' -type f -exec patchelf --clear-execstack {} \; 2>/dev/null

    # 替换脚本中 conda 的安装路径
    sed -i "s|/usr/local/share/TongYuan|${_instdir}|g" "${pkgdir}${_instdir}/.julia/miniforge3/bin/conda"

    # 删除仅供 CentOS 使用的 libxkbcommon-x11 / libxcb-* 库（与官方安装脚本对非 CentOS 系统的处理一致），Arch 自带这些库
    local _pyqt_lib="${pkgdir}${_instdir}/.julia/miniforge3/lib/python3.11/site-packages/PyQt5/Qt5/lib"
    rm -f "${_pyqt_lib}/libxkbcommon-x11.so.0"
    rm -f "${_pyqt_lib}/libxkbcommon-x11.so.0.0.0"
    rm -f "${_pyqt_lib}"/libxcb-{icccm.so.4,image.so.0,keysyms.so.1,randr.so.0,render.so.0,render-util.so.0}
    rm -f "${_pyqt_lib}"/libxcb-{shape.so.0,shm.so.0,sync.so.1,util.so.1,xfixes.so.0,xinerama.so.0,xkb.so.1}

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

    # 屏蔽首次启动（及每次版本变化后重新初始化）时自动执行的 MCP 配置和 skills 安装：
    # 前者会在不询问、不备份的情况下修改 Claude / OpenCode / Codex 的配置，后者会删除并覆盖目标目录中同名的 syslab-* 目录。
    # 改为由用户按需手动执行，见 .install 中的提示
    local _init="${pkgdir}${_instdir}/Install/config/init.sh"
    grep -q '^# syslab-mcp-server-install.sh$' "$_init" || return 1
    grep -q '^# syslab-env.ini$' "$_init" || return 1
    sed -i '/^# syslab-mcp-server-install.sh$/,/^# syslab-env.ini$/ { /^# syslab-env.ini$/!d; }' "$_init"

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
    local _checksum
    grep -q '"vs/workbench/workbench.desktop.main.js":' "$_product" || return 1
    _checksum=$(md5sum "$_mainjs")
    _checksum=$(printf '%s' "${_checksum%% *}" | tr 'a-f' 'A-F' | basenc --base16 -d | base64 -w0)
    _checksum=${_checksum%%=*}
    sed -i -E "s|(\"vs/workbench/workbench\.desktop\.main\.js\":[[:space:]]*\")[^\"]*(\")|\1${_checksum}\2|" "$_product"

    # 注入 QT_QPA_PLATFORM=xcb，避免每次全新启动 Julia 终端后，调用绘图函数时输出 Wayland 插件缺失警告
    # Syslab 设置 JULIA_DEPOT_PATH=$HOME/TongYuan/.julia:...(system)，Julia 只从首条目加载 用户级 startup.jl，故需写入随 Julia 二进制分发的系统级 startup.jl
    echo 'ENV["QT_QPA_PLATFORM"] = "xcb"' >> "${pkgdir}${_instdir}/Tools/julia-1.10.10/etc/julia/startup.jl"

    # 修复帮助中心无法使用的问题：
    # 帮助搜索后端 syslab_docsearch（Go 二进制）由上游在 Docker 中编译，启动时从编译机上的
    # /go/pkg/mod/github.com/go-ego/gse@v0.80.2/data/dict/zh/ 读取 gse 分词词典，该路径在用户机器上不存在，
    # 服务直接退出，导致应用内点击帮助无任何反应。
    # 词典其实已内嵌在该二进制中，这里按该路径把它抽取出来（不修改二进制）
    local _ds="${pkgdir}${_instdir}/Docs/syslab_docsearch"
    local _dict="${pkgdir}/go/pkg/mod/github.com/go-ego/gse@v0.80.2/data/dict/zh"
    install -dm755 "${_dict}"
    local _off
    # 参数：词典文件名、文件首行（用于在二进制中定位）、文件大小、sha256
    _extract_dict() {
        _off=$(LC_ALL=C grep -boaUF -m1 -- "$2" "${_ds}/syslab_docsearch") || return 1
        dd if="${_ds}/syslab_docsearch" of="${_dict}/$1" iflag=skip_bytes,count_bytes skip="${_off%%:*}" count="$3" status=none
        echo "$4  ${_dict}/$1" | sha256sum -c --quiet -
    }
    _extract_dict s_1.txt '1号店 3 n' 5117886 2b3063ec552327520bee3c0c5819d6e131ab3db50a60b94641ec90f611c24bcd || return 1
    _extract_dict t_1.txt '1號店 3 n' 3525862 2c84cef353d2daac62cc62bbeabab6b6a8866cfee8f9f88901e00ed66ed208c6 || return 1

    # 帮助搜索后端只会在自带的浏览器列表里查找浏览器（Edge 等不在其中），改为默认交给 xdg-open，由系统默认浏览器打开；
    # 若在 Syslab 设置中手动选择了浏览器（会传入 -browser），则保持不变。
    # 另外 Syslab 会向环境注入 Julia 的 LD_LIBRARY_PATH 等变量，清除后避免影响被拉起的浏览器
    cat > "${_ds}/syslab_docsearch.sh" <<'EOF'
#!/bin/bash
export ZINC_DATA_PATH=$HOME/TongYuan/syslab-server/syslab_docsearch_data
export ZINC_TY_CONFIG_PATH=$HOME/TongYuan/.syslab-oss/argv.json
unset LD_LIBRARY_PATH PYTHONHOME PYTHONPATH
case " $* " in
    *" -browser "*|*" -browser="*) ;;
    *) set -- "$@" -browser /usr/bin/xdg-open ;;
esac
exec ./syslab_docsearch "$@"
EOF

    # 桌面快捷方式（官方只在首次启动后才在用户目录生成，安装后搜索不到，故由包提供）
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 许可证占位
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MWORKS.Syslab 是同元软控（TongYuan Co., Ltd.）的专有软件。" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
