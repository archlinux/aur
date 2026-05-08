# Maintainer: Pqolk <tiangloo@outlook.com>

pkgname=azurlaneautoscript
pkgver=2026.03.28
pkgrel=1
pkgdesc="Azur Lane bot (CN/EN/JP/TW) 碧蓝航线脚本 | 无缝委托科研，全自动大世界"
arch=('x86_64')
url="https://github.com/LmeSzinc/AzurLaneAutoScript"
license=('GPL3')
depends=(
  'android-tools'
  'git'
)
makedepends=(
  'expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib' 'libnsl'
  'sqlite' 'mpdecimal' 'xz' 'tk'
)
options=(!debug !strip)
source=(
  "https://www.python.org/ftp/python/3.7.17/Python-3.7.17.tar.xz"
)
sha512sums=(
            '86ba1c953e7b4bce70445d1616cc0d428b50937f6a874811584df8bf23c3e2ba3e5d48dec00e629a47f4216f3ca50dc5389cd485fbc315f51000d8750403b5f0')

build() {
    cd "${srcdir}"

    # 1. 编译 Python 3.7（静态链接，快速）
    tar -xf Python-3.7.17.tar.xz
    cd Python-3.7.17
    ./configure --prefix="${srcdir}/python37" --without-ensurepip
    make -j$(nproc)
    make install

    cd "${srcdir}"
    git clone "https://github.com/LmeSzinc/AzurLaneAutoScript.git" "${pkgname}"

    # 2. 创建虚拟环境（--copies 保证可移植，但标准库仍需 pyvenv.cfg 指向 home）
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/venv"
    "${srcdir}/python37/bin/python3.7" -m venv --copies "${srcdir}/venv"
    source "${srcdir}/venv/bin/activate"

    # 3. 安装 pip 和项目依赖
    python -m ensurepip --upgrade
    pip install --upgrade --no-cache-dir pip
    sed -i '/^\s*av\s*==/d' deploy/docker/requirements.txt
    pip install --no-cache-dir -r deploy/docker/requirements.txt
    pip install --no-cache-dir mxnet-alas

    # 验证
    python -c "import rich" || { echo "ERROR: rich not installed"; exit 1; }
    deactivate

    # 清理字节码
    find "${srcdir}/venv" -type d -name "__pycache__" -exec rm -rf {} +
    find "${srcdir}/venv" -type f -name "*.pyc" -delete
}

package() {
    cd "${srcdir}"

    # 1. 安装整个 python37 基础解释器（提供标准库）
    install -dm755 "${pkgdir}/opt/${pkgname}/python37"
    cp -a python37/* "${pkgdir}/opt/${pkgname}/python37"

    # 2. 安装应用代码
    install -dm755 "${pkgdir}/opt/${pkgname}/app"
    cp -a "${pkgname}/." "${pkgdir}/opt/${pkgname}/app"

    # 3. 安装虚拟环境
    cp -a venv "${pkgdir}/opt/${pkgname}/venv"

    # 4. 修正虚拟环境的路标文件 pyvenv.cfg，让解释器找到标准库
    sed -i "s|home = .*|home = /opt/${pkgname}/python37|" \
        "${pkgdir}/opt/${pkgname}/venv/pyvenv.cfg"

    # 5. 修正 activate 脚本中的 VIRTUAL_ENV
    sed -i "s|VIRTUAL_ENV=.*|VIRTUAL_ENV=\"/opt/${pkgname}/venv\"|" \
        "${pkgdir}/opt/${pkgname}/venv/bin/activate"

    # 6. 确保权限
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${pkgname}"

    # 7. 配置文件
    cp "${pkgdir}/opt/${pkgname}/app/config/deploy.template-linux.yaml" \
       "${pkgdir}/opt/${pkgname}/app/config/deploy.yaml"
    install -dm755 "${pkgdir}/etc/${pkgname}"
    ln -sf "/opt/${pkgname}/app/config/alas.json" "${pkgdir}/etc/${pkgname}/alas.json"
    ln -sf "/opt/${pkgname}/app/config/deploy.yaml" "${pkgdir}/etc/${pkgname}/deploy.yaml"

    # 8. 启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash
source /opt/azurlaneautoscript/venv/bin/activate
exec python /opt/azurlaneautoscript/app/gui.py "$@"
EOF
}
