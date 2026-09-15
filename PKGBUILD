# Maintainer: Myqfeng <viagrahuang@outlook.com>
#
# 二进制包：直接下载仓库 Release 中预编译好的 .deb（amd64）并解包，
# 不做本地编译，安装速度快。
#
# 版本号占位符 3.3.0 与校验和占位符 a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f 会在
# scripts/update_aur.sh 推送时被替换为真实值：
#   - 3.3.0    -> 真实版本号
#   - a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f -> 该 .deb 的 sha256
# 前置条件：仓库 Release 中已存在 <版本号>/qteasytier_v<版本号>_linux_amd64.deb。

pkgname=qteasytier-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="基于 EasyTier 的 Qt 图形化异地组网客户端（预编译二进制，取自官方 Release）"
arch=('x86_64')
url="https://github.com/qteasytier/qt-easy-tier"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-tools'
  'openssl'
  'sqlite'
  'hicolor-icon-theme'
)
provides=('qteasytier')
conflicts=('qteasytier' 'qteasytier-dde')
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/qteasytier/qt-easy-tier/releases/download/${pkgver}/qteasytier_v${pkgver}_linux_amd64.deb")
sha256sums=('a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f')

package() {
  # 直接解包 deb（其内容即 /opt/qteasytier + desktop 文件 + systemd 服务）
  mkdir -p "${srcdir}/extract"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}/extract"

  install -d "${pkgdir}/opt/qteasytier"
  cp -a "${srcdir}/extract/opt/qteasytier/." "${pkgdir}/opt/qteasytier/"

  install -d "${pkgdir}/usr/share/applications"
  cp -a "${srcdir}/extract/usr/share/applications/." "${pkgdir}/usr/share/applications/"

  # deb 把服务装在 /etc/systemd/system，Arch 包规范放在 /usr/lib/systemd/system
  install -d "${pkgdir}/usr/lib/systemd/system"
  cp -a "${srcdir}/extract/etc/systemd/system/qtet-daemon.service" \
    "${pkgdir}/usr/lib/systemd/system/qtet-daemon.service"
}
