# Maintainer: Pqolk <tiangloo@outlook.com>

pkgname=azurlaneautoscript
pkgver=2025.01.19
pkgrel=2
pkgdesc="Azur Lane bot (CN/EN/JP/TW) 碧蓝航线脚本 | 无缝委托科研，全自动大世界"
arch=('x86_64')
url="https://github.com/LmeSzinc/AzurLaneAutoScript"
license=('GPL3')
depends=(
  'python'
  'python-pipenv'
  'python-virtualenv'
  'python37'
  'android-tools'
  'git'
)
options=(!debug !strip)
# install=${pkgname}.install
source=(
  # "${pkgname}.sh"
  # "${pkgname}.service"
  # "git+https://github.com/LmeSzinc/AzurLaneAutoScript.git"
)
sha256sums=(
  # 'fd253d364680a740812ea00835c76b6dfc14d60c410c536329ea7d6d1873a31e'
  # 'b26428959edf525e8e59dc99680edef06f4946621d89c8906050a2cef40bce19'
  # 'SKIP'
)
package() {
    cd ${pkgdir}
    git clone https://github.com/LmeSzinc/AzurLaneAutoScript.git opt/${pkgname}/app
    python3.7 -m venv opt/${pkgname}/venv
    source opt/${pkgname}/venv/bin/activate
    pip install --upgrade --no-cache-dir pip
    sed -i '/^\s*av\s*==/d' opt/${pkgname}/app/deploy/docker/requirements.txt
    pip install --no-cache-dir -r opt/${pkgname}/app/deploy/docker/requirements.txt
    pip install --no-cache-dir mxnet-alas
    cp opt/${pkgname}/app/config/deploy.template-linux.yaml opt/${pkgname}/app/config/deploy.yaml
    deactivate
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/etc/${pkgname}"
    ln -sf "/opt/${pkgname}/app/config/alas.json" "${pkgdir}/etc/${pkgname}/alsa.json"
    ln -sf "/opt/${pkgname}/app/config/deploy.yaml" "${pkgdir}/etc/${pkgname}/deploy.yaml"
    # install -Dm755 azurlaneautoscript.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash

source /opt/azurlaneautoscript/venv/bin/activate
python /opt/azurlaneautoscript/app/gui.py "$@"

EOF
    # install -Dm644 azurlaneautoscript.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" <<EOF
[Unit]
Description=AzurLaneAutoScript Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/azurlaneautoscript
Restart=on-failure

# 限制写入权限
#ProtectSystem=strict
#ReadWritePaths=/opt/azurlaneautoscript /tmp /var/tmp /usr/bin/azurlaneautoscript

# 限制服务运行的文件系统访问
#ProtectHome=true
#NoNewPrivileges=true

[Install]
WantedBy=multi-user.target

EOF

    # cp -r "$srcdir/venv" "${pkgdir}/opt/${pkgname}/venv"
    sed -i "s|VIRTUAL_ENV=.*|VIRTUAL_ENV=/opt/${pkgname}/venv|" "${pkgdir}/opt/${pkgname}/venv/bin/activate"
}
