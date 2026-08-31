# Maintainer: Wensheng Tang <sp3478 at gmail dot com>
pkgname=ohos-sdk
pkgver=26.0.0.38
_api=26
pkgrel=1
pkgdesc="OpenHarmony SDK (Linux x86_64)：native 交叉工具链(OHOS clang 15/LLVM+musl sysroot)、toolchains、ets/js/previewer 整包"
arch=('x86_64')
url="https://gitcode.com/openharmony/manifest"
license=('Apache-2.0' 'custom')
depends=('gcc-libs' 'zlib')
optdepends=(
    'libusb: hdc 设备连接'
    'nodejs: ohpm / hvigor 及 js/ets 工具链'
    'qt5-base: previewer 预览器'
    'fontconfig: previewer 字体'
)
options=('!strip' 'staticlibs' '!debug' '!emptydirs')
# 上游只提供预编译 SDK（华为云 OpenHarmony 发布镜像），无从源码构建流程。
# 合包内含 windows/ohos 侧组件，本包只取 linux 侧。
source=("ohos-sdk-${pkgver}.tar.gz::https://mirrors.huaweicloud.com/openharmony/os/7.0-Release/ohos-sdk-windows_linux-public.tar.gz")
sha256sums=('130a438cbcddd46a2a5b09ee9925339cddf4cca99223329b860f96a5c72f338f')
noextract=("ohos-sdk-${pkgver}.tar.gz")

_prefix="/opt/ohos-sdk"

package() {
    cd "${srcdir}"
    # 只从合包里取 linux 侧组件 zip（丢弃 windows/ 与 ohos/）
    bsdtar -xf "ohos-sdk-${pkgver}.tar.gz" ohos-sdk/linux manifest_tag.xml

    install -dm755 "${pkgdir}${_prefix}/${_api}"
    local _z
    for _z in ohos-sdk/linux/*.zip; do
        msg2 "解压 $(basename "${_z}") ..."
        bsdtar -xf "${_z}" -C "${pkgdir}${_prefix}/${_api}"
    done

    # 归一化权限：真实二进制多为 0755，个别 0644/0700，补齐 group/other 读+条件执行
    chmod -R u+rwX,go+rX "${pkgdir}${_prefix}"

    install -Dm644 "${srcdir}/manifest_tag.xml" "${pkgdir}${_prefix}/${_api}/manifest_tag.xml"

    # 环境脚本（clang 含 RPATH \$ORIGIN/../lib，仅需 PATH）
    install -Dm644 /dev/stdin "${pkgdir}${_prefix}/env.sh" <<EOF
# source 本文件以使用 OpenHarmony SDK ${pkgver}（API ${_api}）
export OHOS_SDK_HOME="${_prefix}"
export OHOS_NDK_HOME="${_prefix}/${_api}/native"
export PATH="${_prefix}/${_api}/native/llvm/bin:${_prefix}/${_api}/toolchains:\${PATH}"
# 交叉编译示例：
#   clang --target=aarch64-linux-ohos --sysroot=\${OHOS_NDK_HOME}/sysroot hello.c -o hello
EOF

    # 许可证
    local _lic
    _lic=$(find "${pkgdir}${_prefix}/${_api}" -maxdepth 3 -iname 'NOTICE*' -o -iname 'License*' 2>/dev/null | head -1)
    if [ -n "${_lic}" ]; then
        install -Dm644 "${_lic}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_lic}")"
    fi
}
