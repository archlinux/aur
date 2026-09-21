# Maintainer: Wensheng Tang <sp3478 at gmail dot com>
pkgname=welink-wine
pkgver=7.60.2
_build=202607081412_36816_release_2026.06.0_cloud_7.60.2_615
pkgrel=1
pkgdesc="华为云 WeLink 数字化办公平台（官方 Windows 客户端 + wine，已修复输入框无法打字）"
arch=('x86_64')
url="https://www.huaweicloud.com/product/welink.html"
license=('LicenseRef-proprietary')
depends=(
    'wine'
    '7zip'
    'python-fonttools'
    'noto-fonts-cjk'
    'hicolor-icon-theme'
)
makedepends=('icoutils')
optdepends=('fcitx5: 中文输入法')
conflicts=('deepin-wine-welink')
replaces=('deepin-wine-welink')
install="${pkgname}.install"
_installer="WeLink_Win_cloud_${_build}.exe"
# 官方安装器是自研格式：应用文件以 5 个 7z 存放在 PE 资源段 .rsrc/ZIPRES/ 里，
# 7z 可直接取出，无需运行安装器。本包只随包分发这些 7z，首次启动时解到用户容器。
source=(
    "${_installer}::https://welink.huaweicloud.com/appstore/file/web/free/down/7a8e659ca19b40e5bfa81411b4f92bcb/${_installer}"
    "${pkgname}.sh"
    "welink-mkfont.py"
)
sha256sums=('6042c4409431dd7827d7f351531e6957387b198f2fef7e007fbb83f84fc42301'
            'SKIP'
            'SKIP')
noextract=("${_installer}")

prepare() {
    cd "${srcdir}"
    rm -rf rsrc ico
    7z x -o"${srcdir}/rsrc" "${_installer}" '.rsrc/ZIPRES/*' >/dev/null
    mkdir -p ico
    wrestool -x -t14 -o ico "${_installer}" >/dev/null 2>&1 || true
}

package() {
    cd "${srcdir}"
    local _p="${pkgdir}/opt/${pkgname}"

    # 应用负载：安装器内嵌的 7z，按资源编号顺序解压即得完整安装树
    install -dm755 "${_p}/payload"
    local _z
    for _z in "${srcdir}"/rsrc/.rsrc/ZIPRES/*; do
        install -Dm644 "${_z}" "${_p}/payload/$(basename "${_z}").7z"
    done
    printf '%s' "${pkgver}" > "${srcdir}/version"
    install -Dm644 "${srcdir}/version" "${_p}/payload/version"

    install -Dm755 "${srcdir}/welink-mkfont.py" "${_p}/welink-mkfont.py"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=WeLink
Name[zh_CN]=华为云 WeLink
Comment=Huawei Cloud digital workplace
Comment[zh_CN]=华为云数字化办公平台
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=Network;InstantMessaging;
StartupNotify=false
StartupWMClass=welink.exe
EOF

    # 图标：从 exe 资源里取最大的一个 ico，拆成各尺寸 png
    local _ico
    _ico=$(ls -S "${srcdir}"/ico/*.ico 2>/dev/null | head -1)
    if [ -n "${_ico}" ]; then
        mkdir -p "${srcdir}/png"
        icotool -x -o "${srcdir}/png" "${_ico}" >/dev/null 2>&1 || true
        local _png _s
        for _png in "${srcdir}"/png/*.png; do
            _s=$(basename "${_png}" | grep -oE '[0-9]+x[0-9]+' | head -1)
            [ -n "${_s}" ] || continue
            install -Dm644 "${_png}" "${pkgdir}/usr/share/icons/hicolor/${_s}/apps/${pkgname}.png"
        done
    fi
}
