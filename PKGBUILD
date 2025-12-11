pkgname=slive
pkgver=1.8.3
pkgrel=1
pkgdesc="Slive is a lightweight and user-friendly application for watching live streams across multiple platforms, offering a seamless watching experience with support for popular streaming services."
arch=('x86_64')
url="https://github.com/SlotSun/dart_simple_live"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('efe3cb239668d95d22211474ef7b8c0f52be4373a615f028091b796f4b9fa036')

prepare() {
    cd "$srcdir/dart_simple_live/simple_live_app"
    fvm install
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build() {
    cd "$srcdir/dart_simple_live/simple_live_app"
    fvm flutter build linux --release --no-pub \
    --dart-define build.version="${pkgver}"
}

package() {
    cd "$srcdir/dart_simple_live/simple_live_app"
    # 复制构建产物
 	pushd build/linux/x64/release
	install -Dm755 "bundle/Slive" -t "${pkgdir}/usr/lib/${pkgname}/"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${pkgname}" .
	cmake -P cmake_install.cmake
	popd
    # 创建启动器
    install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/Slive" "${pkgdir}/usr/bin/Slive"

	install -Dm644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "linux/packaging/aur/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
