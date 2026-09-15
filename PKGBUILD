# Maintainer: Myqfeng <viagrahuang@outlook.com>
#
# 源码包：从 Git 标签（tag = 版本号）拉取 QtEasyTier 源码并本地编译。
# 版本号占位符 3.3.0 会在 scripts/update_aur.sh 推送时被替换为真实版本号。
# 前置条件：仓库需已存在与版本号同名的 git tag（发布流程会自动打标签）。
# AUR 更新为手动触发，请确认 tag 已就绪后再点「更新 AUR 版本」按钮。

pkgname=qteasytier
pkgver=3.3.0
pkgrel=1
pkgdesc="基于 EasyTier 的 Qt 图形化异地组网客户端"
arch=('x86_64' 'aarch64')
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
makedepends=('cmake' 'ninja' 'git')
provides=('qteasytier')
conflicts=('qteasytier-bin' 'qteasytier-dde')
options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qteasytier/qt-easy-tier/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
  cd "${srcdir}/qt-easy-tier-${pkgver}"
  # 后端 qtet-daemon 默认从 GitHub 克隆，显式指定以免受上游默认值变更影响
  sed -i "s/-DCLONE_DAEMON_FROM=[A-Z]*/-DCLONE_DAEMON_FROM=GITHUB/" CMakeLists.txt || true
}

build() {
  cmake -S "${srcdir}/qt-easy-tier-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_DAEMON=ON \
    -DBUILD_WITH_DDE=OFF \
    -DBUILD_WITH_DDE_TRAY_PLUGIN=OFF
  cmake --build build --parallel "$(nproc)"
}

package() {
  # 与 deb 包保持一致的目录布局：程序统一安装在 /opt/qteasytier
  install -d "${pkgdir}/opt/qteasytier"
  install -m755 "${srcdir}/qt-easy-tier-${pkgver}"/build/Output/appQtEasyTier "${pkgdir}/opt/qteasytier/"
  if [[ -f "${srcdir}/qt-easy-tier-${pkgver}/build/Output/qtet-daemon" ]]; then
    install -m755 "${srcdir}/qt-easy-tier-${pkgver}/build/Output/qtet-daemon" "${pkgdir}/opt/qteasytier/"
  fi
  install -m644 "${srcdir}/qt-easy-tier-${pkgver}/assets/favicon/qtet.png" "${pkgdir}/opt/qteasytier/"

  install -Dm644 "${srcdir}/qt-easy-tier-${pkgver}/package/linux/qteasytier.desktop" \
    "${pkgdir}/usr/share/applications/qteasytier.desktop"
  install -Dm644 "${srcdir}/qt-easy-tier-${pkgver}/package/linux/qtet-daemon.service" \
    "${pkgdir}/usr/lib/systemd/system/qtet-daemon.service"
  install -Dm644 "${srcdir}/qt-easy-tier-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
