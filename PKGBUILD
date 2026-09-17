# Maintainer: Your Name <your.email@example.com>
pkgname=fcitx5-qingjian-git
_pkgname=fcitx5-qingjian
pkgver=0.1.0.r62.g577fbbf
pkgrel=1
pkgdesc="青简输入法 Linux/Fcitx5 移植版（Rust Server + Fcitx5 插件 + 离线数据模型）"
arch=('x86_64')
url="https://github.com/qingjian-team/qingjian"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'openssl' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'extra-cmake-modules' 'pkgconf' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"

# 源码与移植说明：
# 青简官方 (qingjian-team/qingjian) 目前暂未正式支持 Linux；
# 本包使用 Aozora-Wings 的 Linux/Fcitx5 移植仓库作为源码基准：
# https://github.com/Aozora-Wings/qingjian-nixos
source=(
  "qingjian::git+https://github.com/Aozora-Wings/qingjian-nixos.git"
  "qingjian-data.tar.gz::https://github.com/qingjian-team/qingjian/releases/download/data/qingjian-data.tar.gz"
  "model.qjm::https://github.com/qingjian-team/qingjian/releases/download/data/model.qjm"
  "qingjian-server.service"
)
noextract=("qingjian-data.tar.gz")
sha256sums=('SKIP'
            'f8db877f70a2cdadab78a0575fb88d03fb51d9b042d28b5a2d3b4dad12c2e7ef'
            'eed5bd0bda0c7bd8b43d1acb2dc4678d4bbe295bd47b2b0d4eeace0af9daff4d'
            '19646e428a55d8f9070b0ea319ceeee71c03c3f6171ce930fc22465b6bab6285')

pkgver() {
  cd "${srcdir}/qingjian"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/qingjian"

  # 清理移植仓库内残留的 CMake 临时构建缓存
  rm -rf apps/linux/fcitx5/build

  # 预拉取依赖
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/qingjian"

  # 1. 编译 Linux 后端 Server（排除 macOS 依赖）
  cargo build --frozen --release -p qingjian-linux-server

  # 2. 编译 Fcitx5 C++ 插件 (qingjian.so)
  cmake -B build-fcitx5 -S apps/linux/fcitx5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-fcitx5
}

package() {
  cd "${srcdir}/qingjian"

  # 1. 安装 Rust Server 进程
  install -Dm755 "target/release/qingjian-server" "${pkgdir}/usr/bin/qingjian-server"

  # 2. 安装 Fcitx5 插件 (qingjian.so 与 qingjian.conf)
  DESTDIR="${pkgdir}" cmake --install build-fcitx5

  # 3. 安装 数据包 (generated 词库 + model 整句模型)
  local datadir="${pkgdir}/usr/share/qingjian"
  install -d "${datadir}/data/generated"
  install -d "${datadir}/data/model"

  # 解包词库并清理 macOS 隐藏元数据
  bsdtar -xzf "${srcdir}/qingjian-data.tar.gz" -C "${datadir}/data/generated"
  find "${datadir}/data/generated" -name '._*' -delete

  # 安装整句模型文件
  install -Dm644 "${srcdir}/model.qjm" "${datadir}/data/model/model.qjm"

  # 复制辅助资源（表情、等级词典等）
  if [ -d "assets" ]; then
    install -d "${datadir}/assets"
    cp -r assets/* "${datadir}/assets/"
  fi

  # 4. 安装 Systemd User 守护服务
  install -Dm644 "${srcdir}/qingjian-server.service" \
    "${pkgdir}/usr/lib/systemd/user/qingjian-server.service"

  # 5. 安装 License 许可协议
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
