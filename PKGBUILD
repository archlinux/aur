# Maintainer: Your Name <your.email@example.com>
# 青简输入法 Linux/Fcitx5 移植版（Rust Server + Fcitx5 插件 + 离线数据模型）
#
# 构建方式说明（重要）：
# 1. 源码基准为 Aozora-Wings/qingjian-nixos（瘦身集成仓库），本身不含官方 crates。
#    官方源码 rev 不写死，而是从 fork 的 flake.lock 自动解析（qingjian input 的 rev），
#    保证「官方 crates + fork apps/linux + linux-workspace.lock」三者永远配套。
#    fork 更新官方 rev（nix flake lock --update-input qingjian）后无需改本 PKGBUILD。
# 2. 组装：官方全树（partial clone + checkout 指定 rev）+ fork apps/linux
#    + sed 挂 workspace member + linux-workspace.lock 覆盖（--frozen 可复现）。
# 3. 数据包使用版本化 tag（data-v1），hash 取自官方 tools/release/data.lock，可溯源。
# 4. 境内网络：clone 官方仓库与 crates.io 建议配代理（HTTPS 直连可能超时）；
#    ghfast.top 等加速会把 GitHub 地址重写为短链，git 协议不认，勿用。

pkgname=fcitx5-qingjian-git
_pkgname=fcitx5-qingjian
pkgver=0.1.0.r75.gf4f13f0
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

source=(
  "qingjian::git+https://github.com/Aozora-Wings/qingjian-nixos.git"
  "qingjian-data-v1.tar.gz::https://github.com/qingjian-team/qingjian/releases/download/data-v1/qingjian-data.tar.gz"
  "model-v1.qjm::https://github.com/qingjian-team/qingjian/releases/download/data-v1/model.qjm"
  "qingjian-server.service"
)
noextract=("qingjian-data-v1.tar.gz")
# git 源填 SKIP；官方源码在 prepare 里按 fork flake.lock 锁定 rev 拉取；
# 数据包 hash 来自官方 tools/release/data.lock（data-v1）
sha256sums=('SKIP'
            '4b9eaa7c37f188eab5a52ad400267564eaae2e6bd049165e1389e0317d51d432'
            'eed5bd0bda0c7bd8b43d1acb2dc4678d4bbe295bd47b2b0d4eeace0af9daff4d'
            '19646e428a55d8f9070b0ea319ceeee71c03c3f6171ce930fc22465b6bab6285')

pkgver() {
  cd "${srcdir}/qingjian"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # 1. 从 fork 的 flake.lock 解析官方锁定的 rev（唯一权威来源）
  cd "${srcdir}/qingjian"
  UP_REV=$(sed -n '/"qingjian"/,/"rev"/p' flake.lock | grep '"rev"' | head -1 | sed 's/.*: "\([0-9a-f]*\)".*/\1/')
  [ -n "$UP_REV" ] || { echo "FATAL: 无法从 flake.lock 解析 qingjian input 的 rev"; exit 1; }
  echo "== 官方源码 rev: $UP_REV =="

  # 2. partial clone 官方并 checkout 指定 rev（--filter=blob:none 只拉元数据，blob 按需）
  if [ ! -d "${srcdir}/qingjian-upstream/.git" ]; then
    git init -q "${srcdir}/qingjian-upstream"
    git -C "${srcdir}/qingjian-upstream" remote add origin https://github.com/qingjian-team/qingjian.git
  fi
  git -C "${srcdir}/qingjian-upstream" fetch -q --filter=blob:none --depth 1 origin "$UP_REV" \
    || { echo "FATAL: 官方仓库拉取失败（境内网络请配代理）"; exit 1; }
  git -C "${srcdir}/qingjian-upstream" checkout -q FETCH_HEAD \
    || { echo "FATAL: 官方源码 checkout 失败"; exit 1; }

  # 3. 组装完整 workspace：官方全树 + 本地 apps/linux
  cp -a "${srcdir}/qingjian-upstream" "${srcdir}/build-src"
  chmod -R u+w "${srcdir}/build-src"
  rm -rf "${srcdir}/build-src/apps/linux"
  cp -a "${srcdir}/qingjian/apps/linux" "${srcdir}/build-src/apps/linux"
  chmod -R u+w "${srcdir}/build-src"

  # 清理移植仓库内残留的 CMake 临时构建缓存
  rm -rf "${srcdir}/qingjian/apps/linux/fcitx5/build"

  cd "${srcdir}/build-src"
  # 把 linux server 注册进官方 workspace（members + 官方已移除的 libc）
  sed -i 's|"apps/windows/settings",|"apps/windows/settings", "apps/linux/server",|' Cargo.toml
  grep -q 'apps/linux/server' Cargo.toml || { echo "FATAL: workspace member 插入失败"; exit 1; }
  grep -q '^libc = ' Cargo.toml || sed -i '/^\[workspace.dependencies\]$/a libc = "0.2"' Cargo.toml
  # 官方 lock 不含 apps/linux/server 依赖：用预生成的完整 lock 覆盖
  cp "${srcdir}/qingjian/packages/linux-workspace.lock" Cargo.lock
  grep -q 'qingjian-linux-server' Cargo.lock || { echo "FATAL: linux-workspace.lock 覆盖未生效"; exit 1; }

  # 4. 预拉取依赖（crates.io 直连不稳，建议先在 ~/.cargo/config.toml 配 rsproxy 镜像：
  #   [source.crates-io]
  #   replace-with = "rsproxy-sparse"
  #   [source.rsproxy-sparse]
  #   registry = "sparse+https://rsproxy.cn/index/"
  # 否则 crates.io 直连可能超时）
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  # 1. 编译 Linux 后端 Server（排除 macOS 依赖）
  cd "${srcdir}/build-src"
  cargo build --frozen --release -p qingjian-linux-server

  # 2. 编译 Fcitx5 C++ 插件 (qingjian.so)
  cmake -B "${srcdir}/build-fcitx5" -S "${srcdir}/qingjian/apps/linux/fcitx5" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "${srcdir}/build-fcitx5"
}

package() {
  cd "${srcdir}"

  # 1. 安装 Rust Server 进程
  install -Dm755 "build-src/target/release/qingjian-server" "${pkgdir}/usr/bin/qingjian-server"

  # 2. 安装 Fcitx5 插件 (qingjian.so 与 qingjian.conf)
  DESTDIR="${pkgdir}" cmake --install build-fcitx5

  # 3. 安装 数据包 (generated 词库 + model 整句模型)
  local datadir="${pkgdir}/usr/share/qingjian"
  install -d "${datadir}/data/generated"
  install -d "${datadir}/data/model"

  # 解包词库并清理 macOS 隐藏元数据
  bsdtar -xzf "${srcdir}/qingjian-data-v1.tar.gz" -C "${datadir}/data/generated"
  find "${datadir}/data/generated" -name '._*' -delete

  # 安装整句模型文件
  install -Dm644 "${srcdir}/model-v1.qjm" "${datadir}/data/model/model.qjm"

  # 复制辅助资源（表情、等级词典等，优先取官方仓库）
  if [ -d "${srcdir}/build-src/assets" ]; then
    install -d "${datadir}/assets"
    cp -r "${srcdir}/build-src/assets/"* "${datadir}/assets/"
  elif [ -d "${srcdir}/qingjian/assets" ]; then
    install -d "${datadir}/assets"
    cp -r "${srcdir}/qingjian/assets/"* "${datadir}/assets/"
  fi

  # 4. 安装 Systemd User 守护服务（server 通过 QINGJIAN_DATA_DIR 定位数据）
  install -Dm644 "${srcdir}/qingjian-server.service" \
    "${pkgdir}/usr/lib/systemd/user/qingjian-server.service"

  # 5. 安装 License 许可协议
  install -Dm644 "${srcdir}/qingjian/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

