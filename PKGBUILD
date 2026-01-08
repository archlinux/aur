
# Maintainer: SlotSun <slot_sun@outlook.com>
pkgname=slive
pkgver=1.8.5
pkgrel=2
pkgdesc="基于Flutter的聚合直播软件，支持多平台直播源聚合与观看。"
arch=('x86_64')
url="https://github.com/SlotSun/dart_simple_live"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libvdpau' 'libpulse' 'libxss' 'libarchive' 'alsa-lib' 'libva' 'libxv' 'patchelf')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm' 'rustup')
source=("v1.8.5.tar.gz::https://github.com/SlotSun/dart_simple_live/archive/refs/tags/v1.8.5.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/dart_simple_live-${pkgver}/simple_live_app"
    fvm install
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build() {
    cd "$srcdir/dart_simple_live-${pkgver}/simple_live_app"
    fvm flutter build linux --release --no-pub \
    --dart-define build.version="${pkgver}" --verbose
}

package() {
    cd "$srcdir/dart_simple_live-${pkgver}/simple_live_app"
    # 复制构建产物
 	pushd build/linux/x64/release
	install -Dm755 "bundle/io.github.SlotSun.Slive" -t "${pkgdir}/usr/lib/${pkgname}/"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${pkgname}" .
	cmake -P cmake_install.cmake
	popd

    local app_id="io.github.SlotSun.Slive"
    # 创建启动器
    install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/${app_id}" "${pkgdir}/usr/bin/${app_id}"

    # 安装图标和桌面文件
    install -Dm644 assets/logo_400.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${app_id}.png"

	install -Dm644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${app_id}.png"
    install -Dm644 "assets/${app_id}.desktop" -t "${pkgdir}/usr/share/applications/"
}