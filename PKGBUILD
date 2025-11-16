# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=servo
pkgver=0.0.2
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
options=('!lto') # lto breaks linking
backup=("etc/profile.d/$pkgname".{csh,sh})
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('286fc3555d6bd8e0bc7463f917a0ddd797e0a54a70c72216bc6133c448bf40da')

prepare() {
	cd "$pkgname"
	echo 'export PATH=$PATH:/opt/servo' > "$pkgname.sh"
	echo 'setenv PATH ${PATH}:/opt/servo' > "$pkgname.csh"
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
	install -Dm0755 -t "$pkgdir/etc/profile.d/" "$pkgname".{csh,sh}
}
