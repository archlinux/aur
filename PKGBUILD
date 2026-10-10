# Maintainer: moecly <moecly@users.noreply.github.com>
pkgname=omp-ctl
pkgver=0.8.0
pkgrel=1
pkgdesc='Desktop GUI for managing omp configuration in ~/.omp-ctl'
arch=('x86_64' 'aarch64')
url='https://github.com/moecly/omp-ctl'
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'glibc' 'gcc-libs')
makedepends=('bun' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e6a73f3aab0db15624f00eb23784fd7590020adbeb7f37a1d58733de3293dcc')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"

    # makepkg 的 -flto=auto 会把 C 依赖编成 GIMPLE-only 目标文件（只有 .gnu.lto 段），
    # 而 rustc 现在默认用自带的 ld.lld 链接，liblto_plugin 物化不了它们，
    # 表现为 ring 等 C 符号 undefined。Rust 侧 LTO 由 profile.release 的 lto=true 负责。
    export CFLAGS="${CFLAGS//-flto=auto/}" CXXFLAGS="${CXXFLAGS//-flto=auto/}" LDFLAGS="${LDFLAGS//-flto=auto/}"

    # 前端产物必须先生成：tauri::generate_context! 在编译期读取 ../dist。
    # extra/bun 落后于仓库 web/bun.lock 的 lockfileVersion 2，读不了就退回自动解析。
    (cd web && (bun install --frozen-lockfile || bun install) && bun run build)

    # custom-protocol 不能省：tauri::is_dev() = !cfg!(feature = "custom-protocol")，
    # 少了它编出来的是 dev 模式二进制，运行时去连 devUrl（127.0.0.1:1420）而不是内嵌前端，
    # 装完打开就是「无法连接 127.0.0.1」。tauri CLI 的 tauri build 同样会加这一项。
    cargo build --release --locked --features tauri/custom-protocol \
        --manifest-path src-tauri/Cargo.toml
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/omp-ctl "$pkgdir/usr/bin/omp-ctl"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/omp-ctl.desktop" <<-'EOF'
	[Desktop Entry]
	Type=Application
	Name=omp-ctl
	Comment=Manage omp configuration in ~/.omp-ctl
	Exec=omp-ctl
	Icon=omp-ctl
	Terminal=false
	Categories=Utility;
	StartupWMClass=omp-ctl
	EOF

    # 目录名必须是 hicolor/index.theme 里真实存在的尺寸，
    # 否则 hicolor 主题不会索引这些图标（hicolor/32/apps 这类名字是无效的）。
    local pair
    for pair in 32x32:32x32 64x64:64x64 128x128:128x128 256x256:128x128@2x 512x512:icon; do
        install -Dm644 "src-tauri/icons/${pair#*:}.png" \
            "$pkgdir/usr/share/icons/hicolor/${pair%%:*}/apps/omp-ctl.png"
    done
}
