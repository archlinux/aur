# Maintainer: asduhkv <asduhkv@users.noreply.github.com>

pkgname=hermes-webui-git
_pkgname=hermes-webui
pkgver=0.52.106.r327.g5f3117f81
pkgrel=1
pkgdesc="Hermes WebUI: The best way to use Hermes Agent from the web or from your phone!"
arch=('any')
url="https://github.com/nesquena/hermes-webui"
license=('MIT')
depends=('python' 'python-yaml' 'python-cryptography')
optdepends=('hermes-agent: Hermes agent runtime — 官方安装脚本或 AUR 安装皆可'
            'python-markdown-it-py: session HTML 导出的 Markdown 渲染')
makedepends=('git')
source=("git+https://github.com/nesquena/hermes-webui.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # --match 'v*' 排除上游的 exp-* 实验性 tag，避免版本号带 exp 前缀
  git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  local webuidir="/usr/share/hermes-webui"

  install -d "${pkgdir}${webuidir}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r api static "${pkgdir}${webuidir}/"
  install -m644 bootstrap.py server.py mcp_server.py requirements.txt "${pkgdir}${webuidir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # 启动器：禁用本地 venv（依赖走系统 pacman 包），--skip-agent-install 让
  # bootstrap 自动发现用户已有的 hermes 安装（PATH launcher / ~/.hermes / /usr/local/lib）
  cat > "${pkgdir}/usr/bin/hermes-webui" <<'EOF'
#!/usr/bin/env bash
export HERMES_WEBUI_DISABLE_LOCAL_VENV=1
exec /usr/bin/python3 /usr/share/hermes-webui/bootstrap.py --foreground --no-browser --skip-agent-install "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/hermes-webui"

  # systemd 用户服务
  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/hermes-webui.service" <<'EOF'
[Unit]
Description=Hermes WebUI
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/hermes-webui
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
EOF
}
