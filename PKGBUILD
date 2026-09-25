# Maintainer: Houge Langley <hougelangley1987@gmail.com>
# AUR 版打包定义（source 从 GitHub tag release 拉取 ✓ AUR 规范要求公开可下载 ✓）
#
# ⚠️ 发布流程（在仓库根目录跑 scripts/publish-aur.sh ✓ 它会自动填 sha256sums ✓）：
#   1) 前置：GitHub 上已有 v$pkgver tag（推送由项目维护者决定 ✓）
#   2) scripts/publish-aur.sh --push   → 自动算 sha256 + 生成 .SRCINFO + 推送 AUR ✓
#   sha256sums 里的 PLACEHOLDER 必须在发布前替换，否则 makepkg 会校验失败 ✗（这是故意的 ✗ 防误发）
pkgname=hov-qt
pkgver=1.2.2
pkgrel=1
pkgdesc="Aggregated YouTube/Bilibili/NetEase/QQ Music client (Qt6 desktop)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/HougeLangley/HyperOnlineVideo"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-webengine' 'mpv' 'ffmpeg' 'yt-dlp')
# KWindowSystem（玻璃质感）是可选依赖：CMake 找不到就降级 ✓ 故不进 depends ✓
makedepends=('cmake' 'ninja' 'pkgconf')
# clang/lld 仅在 HOV_OPTIMIZED=1（LTO+PGO 优化构建）时需要 → 作为可选说明 ✓ 不进 makedepends ✓
source=("$pkgname-$pkgver.tar.gz::https://github.com/HougeLangley/HyperOnlineVideo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('244e9d4b2ec32aae4fd083774036a4e7f5bb39df84ee81e1fa9fd9fa9e5aaa87')

build() {
  cd "$srcdir/HyperOnlineVideo-$pkgver/desktop"
  local optflags=()
  if [ "${HOV_OPTIMIZED:-0}" = "1" ]; then
    optflags+=(-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DHOV_LTO=ON)
    prof="${HOV_PROFDATA:-/tmp/hovpgo/hov.profdata}"
    if [ -f "$prof" ]; then
      optflags+=(-DHOV_PGO=use -DHOV_PROFDATA="$prof")
      echo "==> 优化构建：clang + full-LTO + PGO（$prof）"
    else
      echo "==> 优化构建：clang + full-LTO（未找到 profdata，跳过 PGO）"
    fi
  fi
  # ⚠️ makepkg 会净化环境（清掉大量变量）→ CMake 的 FindOpenGL 取不到 glvnd 的两条库
  #（实测报 "Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY OPENGL_glx_LIBRARY)" ✗）
  #  这里显式兜底（存在才加 ✓ 幂等 ✓）
  if [ -e /usr/lib/libOpenGL.so ]; then
    optflags+=(-DOPENGL_opengl_LIBRARY=/usr/lib/libOpenGL.so -DOPENGL_glx_LIBRARY=/usr/lib/libGLX.so)
  fi
  # 净化环境里 Qt6 组件目录也可能搜不到 → 逐个显式喂给 CMake（幂等 ✓ 存在才加 ✓）
  for c in /usr/lib/cmake/Qt6*; do
    [ -d "$c" ] && optflags+=("-D$(basename "$c")_DIR=$c")
  done
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "${optflags[@]}"
  cmake --build build
}

package() {
  cd "$srcdir/HyperOnlineVideo-$pkgver/desktop"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# 说明：
# 1) 安装布局由 desktop/CMakeLists.txt 负责：/usr/bin/hov-qt（启动器 ✓ LC_NUMERIC=C 等）+ hov-qt-bin ✓
# 2) AUR 提交必须在同目录附 .SRCINFO（scripts/publish-aur.sh 会自动生成 ✓）
