# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: beatgammit

pkgname=servo-git
pkgver=0.0.1.r16.g76bb1c8
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
makedepends=(rustup # doesn't work with system rust
             clang
             cmake
             curl
             depot-tools-git
             git
             gperf
             llvm
             python
             python-distlib
             python-virtualenv
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
}

build() {
	cd "$pkgname"
	export CARGO_TARGET_DIR=target
	# was failing with some error and said to install these componenets
	# "magically" works after this
	rustup component add rust-src rustc-dev llvm-tools-preview
	# Fix: error: could not execute process `crown -vV` (never executed)
	./mach bootstrap
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
