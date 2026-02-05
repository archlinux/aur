# Maintainer: Wimpy <vvinn.py[AT]@gmail.com>
pkgname=kimi-cli
_pkgname=kimi-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="Kimi Code CLI is your next CLI agent."
provides=('kimi')
conflicts=('kimi')
arch=('any')
url="https://moonshotai.github.io"
license=('Apache-2.0')
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
    ln -rs "${pkgdir}${_target}/bin/kimi" "${pkgdir}/usr/bin/kimi"

    # 关键：修复虚拟环境脚本中的硬编码路径
    # 将构建路径 ${srcdir}/venv 替换为实际安装路径 /opt/kimi-cli
    find "${pkgdir}${_target}/bin" -type f -executable -exec \
        sed -i "s|${srcdir}/venv|${_target}|g" {} +
}
