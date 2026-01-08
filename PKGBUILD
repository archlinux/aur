
# Maintainer: SlotSun <slot_sun@outlook.com>
pkgname=slive
pkgver=1.8.5
pkgrel=1
pkgdesc="基于Flutter的聚合直播软件，支持多平台直播源聚合与观看。"
arch=('x86_64')
url="https://github.com/SlotSun/dart_simple_live"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libvdpau' 'libpulse' 'libxss' 'libarchive' 'alsa-lib' 'libva' 'libxv' 'patchelf')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm' 'rustup')
source=("Slive.tar.gz::https://github.com/SlotSun/dart_simple_live/releases/download/v1.8.5/Slive.tar.gz")
sha256sums=('6ae1cc82dd8dbcb375a8e7bc8db371a66a200df7a51fc84ba1adecb6452da03e')

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
    # 创建启动器
    install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/io.github.SlotSun.Slive" "${pkgdir}/usr/bin/Slive"

	install -Dm644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.SlotSun.Slive.png"
    install -Dm644 "linux/packaging/aur/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}