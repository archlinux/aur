# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 1Panel v2 官方二进制包,下载逻辑同官方安装脚本 quick_start.sh(v2 分支):
#   https://github.com/1Panel-dev/installer/blob/v2/quick_start.sh
# 下载源用官方 CDN 快镜像 resource.fit2cloud.com(v2 安装脚本默认的
# resource.1panel.pro 对部分网络极慢);版本端点:
#   https://resource.fit2cloud.com/1panel/package/v2/stable/latest
# 凭据:安装时按官方 install.sh 的 NON_INTERACTIVE 逻辑随机生成端口、安全入口、
#   用户名、密码(写入 /usr/bin/1pctl 与 /opt/1panel/.install-credentials)
#
pkgname=1panel-v2-bin
_upver=v2.3.2
pkgver=${_upver#v}
pkgrel=3
pkgdesc="1Panel v2, a modern open source linux panel (official binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/1Panel-dev/1Panel"
license=('GPL-3.0-or-later')
depends=('docker' 'docker-compose')
optdepends=(
  'ufw: firewall integration'
  'firewalld: firewall integration'
)
conflicts=('1panel-bin' '1panel' '1panel-git' '1panel-dev-bin')
install=1panel-v2-bin.install
source_x86_64=(
  "1panel-${_upver}-linux-amd64.tar.gz::https://resource.fit2cloud.com/1panel/package/v2/stable/${_upver}/release/1panel-${_upver}-linux-amd64.tar.gz"
)
source_aarch64=(
  "1panel-${_upver}-linux-arm64.tar.gz::https://resource.fit2cloud.com/1panel/package/v2/stable/${_upver}/release/1panel-${_upver}-linux-arm64.tar.gz"
)
sha256sums_x86_64=('f1265a4fadeaab3d7066dd71e3c6904ac54bb687baab1b205a23c369abb61cac')
sha256sums_aarch64=('e147b2ad27053eaef25db41779368a28d31ca2aa79221b37ce5ed62b9e5fa054')

# 上游包目录/文件名的架构标识:amd64 / arm64
case "$CARCH" in
  x86_64) _arch=amd64 ;;
  aarch64) _arch=arm64 ;;
esac

package() {
  cd "$srcdir/1panel-${_upver}-linux-${_arch}"

  # 主服务与代理二进制。官方在线安装复制到 /usr/local/bin 后再链接到
  # /usr/bin；AUR 包直接安装到 Arch 原生路径，systemd 入口保持不变。
  install -Dm755 1panel-core "$pkgdir/usr/bin/1panel-core"
  install -Dm755 1panel-agent "$pkgdir/usr/bin/1panel-agent"
  ln -s 1panel-core "$pkgdir/usr/bin/1panel"

  # 1pctl 的运行凭据在 .install 中写入，避免在构建阶段生成。
  sed -i \
    -e 's|^BASE_DIR=.*|BASE_DIR=/opt|' \
    -e 's|^ORIGINAL_VERSION=.*|ORIGINAL_VERSION='"${_upver}"'|' \
    -e 's|^LANGUAGE=.*|LANGUAGE=zh|' \
    -e 's|^PANEL_EDITION=.*|PANEL_EDITION=intl|' \
    -e 's|/usr/local/bin/lang|/usr/share/1panel/lang|g' \
    -e 's|/usr/local/bin/{1pctl,1panel-core,1panel-agent,lang}|/usr/share/1panel/lang /usr/local/bin/{1pctl,1panel-core,1panel-agent,lang}|g' \
    1pctl
  install -Dm755 1pctl "$pkgdir/usr/bin/1pctl"

  install -dm755 "$pkgdir/usr/share/1panel"
  cp -a lang "$pkgdir/usr/share/1panel/"

  # GeoIP 数据:官方安装到 $BASE_DIR/1panel/geo/(=/opt/1panel/geo/)
  install -Dm644 GeoIP.mmdb "$pkgdir/opt/1panel/geo/GeoIP.mmdb"

  # systemd 服务(官方装 /etc/systemd/system;Arch 惯例 /usr/lib/systemd/system)
  install -Dm644 1panel-core.service "$pkgdir/usr/lib/systemd/system/1panel-core.service"
  install -Dm644 1panel-agent.service "$pkgdir/usr/lib/systemd/system/1panel-agent.service"

}
