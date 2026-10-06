# Maintainer: moecly <moecly@users.noreply.github.com>
pkgname=omp-ctl
pkgver=0.6.0
pkgrel=1
pkgdesc='Desktop GUI for managing omp configuration in ~/.omp-ctl'
arch=('x86_64' 'aarch64')
url='https://github.com/moecly/omp-ctl'
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'glibc' 'gcc-libs')
makedepends=('bun' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba9e6cb2dded7e56ac339c823614b5aca89ffe109687fdab9e53d7f098105512')
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
    cargo build --release --locked --manifest-path src-tauri/Cargo.toml
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

    local size
    for size in 32:32x32 64:64x64 128:128x128 256:128x128@2x 512:icon; do
        install -Dm644 "src-tauri/icons/${size#*:}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size%%:*}/apps/omp-ctl.png"
    done
}
