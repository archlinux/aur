# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

# WaveSonic 的 AUR VCS 包名使用 “-git” 后缀，明确表示每次构建都跟随上游最新提交。
pkgname=wavesonic-git
pkgver=0.1.0.r0.gbb3adde
pkgrel=1
pkgdesc='Immersive local and Subsonic/OpenSubsonic music player'
arch=('x86_64' 'aarch64')
url='https://github.com/Orion-zhen/WaveSonic'
license=('AGPL-3.0-only')

# 这里只声明程序直接使用的 Linux 动态库；WebKitGTK 与 GTK 会继续拉取其图形栈依赖。
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libpulse'
  'libsoup3'
  'pango'
  'sqlite'
  'webkit2gtk-4.1'
)

# Rust、Node.js 与 pnpm 只参与源码构建，不会进入最终运行环境。
makedepends=(
  'cargo'
  'git'
  'nodejs'
  'pnpm'
)

# 与不带 VCS 后缀的正式包声明替代和冲突关系，防止两个包安装相同文件。
provides=('wavesonic')
conflicts=('wavesonic')

# 使用 HTTPS 拉取公开仓库，避免要求构建者预先配置 GitHub SSH 密钥。
source=("${pkgname}::git+https://github.com/Orion-zhen/WaveSonic.git")
sha256sums=('SKIP')

# makepkg 的 GCC LTO 会破坏 ring 与 bundled SQLite 封装在 Rust rlib 中的原生对象归档。
options=('!lto')

pkgver() {
  cd "${srcdir}/${pkgname}"

  # 优先从 vX.Y.Z 标签生成版本；没有可用标签时再退回应用版本、提交数和短哈希。
  local description upstream_version revision commit
  if description="$(git describe --long --tags --match 'v[0-9]*' --abbrev=7 2>/dev/null)"; then
    sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-/./g' <<<"${description}"
    return
  fi

  upstream_version="$(sed -n 's/^[[:space:]]*"version":[[:space:]]*"\([^"]*\)".*/\1/p' src-tauri/tauri.conf.json | head -n 1)"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s' "${upstream_version}" "${revision}" "${commit}"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # 将包管理器缓存限制在构建目录，避免污染构建用户的全局缓存。
  export CARGO_HOME="${srcdir}/cargo-home"

  # Arch 提供持续维护的系统 SQLite；取消上游 bundled 特性以避免重复内嵌同一成熟组件。
  sed -i 's/rusqlite = { version = "\*", features = \["bundled"\] }/rusqlite = "*"/' \
    src-tauri/Cargo.toml
  grep -qx 'rusqlite = "\*"' src-tauri/Cargo.toml

  # 上游目前不跟踪锁文件且依赖声明使用 latest/通配版本，只能在本次构建时解析依赖。
  pnpm install --no-frozen-lockfile --store-dir "${srcdir}/pnpm-store"
  cargo fetch --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}"

  # 先生成 Tauri 要嵌入的前端资源，再直接编译 Linux 原生程序。
  export CARGO_HOME="${srcdir}/cargo-home"
  # 某些自定义 makepkg.conf 会继续注入 LTO；只移除该标志并保留其余 Arch 加固参数。
  export CFLAGS="$(sed -E 's/(^|[[:space:]])-flto(=[^[:space:]]+)?//g' <<<"${CFLAGS}")"
  export CXXFLAGS="$(sed -E 's/(^|[[:space:]])-flto(=[^[:space:]]+)?//g' <<<"${CXXFLAGS}")"
  # 当前 stable Rust 的 rust-lld 无法可靠抽取 ring 原生归档，因此显式使用 base-devel 的 GNU ld。
  export RUSTFLAGS="${RUSTFLAGS} -C linker-features=-lld"
  pnpm build
  # custom-protocol 是 Tauri 的生产模式开关；缺少它会错误加载仅供开发使用的 localhost 地址。
  # prepare() 已下载完整依赖；离线模式允许 Cargo 为当前 Linux 目标补全上游未提交的锁文件。
  cargo build --release --offline --manifest-path src-tauri/Cargo.toml \
    --features tauri/custom-protocol
}

package() {
  cd "${srcdir}/${pkgname}"

  # 安装原生可执行文件，并保留上游的小写命令名。
  install -Dm755 src-tauri/target/release/wavesonic "${pkgdir}/usr/bin/wavesonic"

  # 按 freedesktop.org 的 hicolor 主题目录规范安装上游提供的多尺寸图标。
  local size icon
  for size in 32 64 128 256 512; do
    case "${size}" in
      256) icon='src-tauri/icons/128x128@2x.png' ;;
      512) icon='src-tauri/icons/icon.png' ;;
      *) icon="src-tauri/icons/${size}x${size}.png" ;;
    esac
    install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/wavesonic.png"
  done

  # 创建桌面环境菜单项，分类与 Tauri 上游配置保持一致。
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/io.wavesonic.player.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=WaveSonic
Comment=沉浸式本地与 Subsonic 音乐播放器
Exec=wavesonic
Icon=wavesonic
Terminal=false
Categories=AudioVideo;Audio;Music;
StartupWMClass=wavesonic
EOF

  # AGPL-3.0-only 要求随二进制发行物提供完整许可证文本。
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
