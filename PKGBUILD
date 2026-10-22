# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mailcraft-git
_pkgname=${pkgname%-git}
pkgver=0.6.0.r24.g761f54b
pkgrel=1
url="https://github.com/UCS-Care-Group/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Microsoft Outlook (Git HEAD)'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "$_pkgname"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

_icons=(512 256 128 64 48 32 16)

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"{,-cli}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/io.github.billsecond.$_pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "packaging/linux/io.github.billsecond.$_pkgname.mime.xml"
	# install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" assets/app-icon/hicolor/scalable/apps/io.github.billsecond.$_pkgname.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/app-icon/hicolor/$dim/apps/io.github.billsecond.$_pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
