# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: beatgammit

pkgname=servo-git
pkgver=testing.0.0.0.0.2.r2070.g41c9e68
pkgrel=1
pkgdesc='Parallel Browser Project: web browser written in Rust'
arch=(x86_64 i686)
url=https://github.com/servo/servo
license=(MPL-2.0)
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
makedepends=(clang
             cmake
             curl
             git
             glibc
             gperf
             llvm
             python
             python-distlib
             python-virtualenv
             rust
             uv)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
options=('!lto') # lto breaks linking
backup=("etc/profile.d/${pkgname%-git}".{csh,sh})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	echo 'export PATH=$PATH:/opt/servo' > "${pkgname%-git}.sh"
	echo 'setenv PATH ${PATH}:/opt/servo' > "${pkgname%-git}.csh"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	./mach build --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/opt/servo/" "target/release/servoshell"
	install -d "$pkgdir/opt/servo/resources/"
	cp -r resources/* "$pkgdir/opt/servo/resources"
	install -Dm0755 -t "$pkgdir/etc/profile.d/" "${pkgname%-git}".{csh,sh}
}
