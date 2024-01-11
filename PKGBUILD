# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: beatgammit

pkgname=servo-git
pkgver=r47479.92196d985dc
pkgrel=1
pkgdesc='Parallel Browser Project: web browser written in Rust'
arch=(x86_64 i686)
url=https://github.com/servo/servo
license=(MPL)
depends=(bzip2
         fontconfig
         freetype2
         glu
         gst-plugins-bad
         libgl
         libxcursor
         libxi
         libxmu
         libxrandr
         mesa
         python-dbus
         ttf-font
         xcb-util)
install="$pkgname.install"
makedepends=(autoconf2.13
             cargo
             clang
             cmake
             curl
             depot-tools-git
             git
             gperf
             llvm
             python
             python-distlib
             python-virtualenv)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/profile.d/${pkgname%-git}".{csh,sh})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	echo 'export PATH=$PATH:/opt/servo' > "${pkgname%-git}.sh"
	echo 'setenv PATH ${PATH}:/opt/servo' > "${pkgname%-git}.csh"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	./mach build --release
}

package() {
	servopath=$pkgname/target/release
	install -Dm0755 -t "$pkgdir/opt/servo/" "$servopath/servo"
	install -d "$pkgdir/opt/servo/resources/"
	cp -r $pkgname/resources/* "$pkgdir/opt/servo/resources"
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/etc/profile.d/" "${pkgname%-git}".{csh,sh}
}
