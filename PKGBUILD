# Maintainer: Wimpy <vvinn.py[AT]@gmail.com>
pkgname=tunacode-cli
_pkgname=tunacode-cli
pkgver=0.1.60
pkgrel=1
pkgdesc="A terminal-based AI coding agent with a NeXTSTEP-inspired interface."
provides=('tunacode')
conflicts=('tunacode')
arch=('any')
url="https://tunacode.xyz"
license=('MIT')
depends=('uv' 'python>=3.13')
options=('!strip')


build() {
    # 在构建目录创建虚拟环境，避免污染系统
    uv venv "${srcdir}/venv" --python 3.13
    # 联网下载最新版
    VIRTUAL_ENV="${srcdir}/venv" uv pip install "${_pkgname}==${pkgver}"
}

package() {
    local _target="/opt/${_pkgname}"
    mkdir -p "${pkgdir}${_target}"

    # 将 build 好的环境拷贝到安装目录
    cp -a "${srcdir}/venv/." "${pkgdir}${_target}/"

    # 创建系统软链接
    mkdir -p "${pkgdir}/usr/bin"
    ln -rs "${pkgdir}${_target}/bin/tunacode" "${pkgdir}/usr/bin/tunacode"

    # 关键：修复虚拟环境脚本中的硬编码路径
    # 将构建路径 ${srcdir}/venv 替换为实际安装路径 /opt/tunacode-cli
    find "${pkgdir}${_target}/bin" -type f -executable -exec \
        sed -i "s|${srcdir}/venv|${_target}|g" {} +
}
