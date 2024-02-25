# Maintainer: éclairevoyant
# Contributor: Aakash Sharma <aakashsensharma at gmail dot com>
# Contributor: Sergey A dot  <murlakatamenka at disroot dot org>
# Contributor: rv178 <idliyout at gmail dot com>

_pkgname="swhkd"
pkgname="$_pkgname-git"
pkgver=1.2.1.r70.g3db287e
pkgrel=1
arch=(x86_64)
url="https://github.com/waycrate/$_pkgname"
pkgdesc="Display server-independent hotkey daemon inspired by sxhkd"
license=(BSD)
depends=(polkit)
makedepends=(cargo git scdoc)
provides=(swhkd)
conflicts=(swhkd)
source=("git+$url.git"
        "git+$url-vim.git")
b2sums=("SKIP"
        "SKIP")

prepare() {
	cd $_pkgname

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	sed -i '/^BUILDFLAGS/ s|:=|?=|' Makefile
}

pkgver() {
	git -C $_pkgname describe --long --tags --match'=[0-9]*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export BUILDFLAGS='--frozen --release --all-features'
	make
}

package() {
	make -C $_pkgname DESTDIR="$pkgdir" install

	cd $_pkgname-vim
	for i in ftdetect ftplugin indent syntax; do
		install -Dm644 "$i/${_pkgname}.vim" \
			"$pkgdir/usr/share/vim/vimfiles/$i/$_pkgname.vim"
	done
}
