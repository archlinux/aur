# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: David Phillips <dbphillipsnz@gmail.com>

_sourcedir="AnnePro2-Tools"
_pkgname="annepro2-tools"
pkgname="$_pkgname-git"
pkgver=r57.a13b82c
pkgrel=1
pkgdesc="Alternative firmware update tool for the Anne Pro 2 keyboard"
arch=('x86_64')
url="https://github.com/OpenAnnePro/AnnePro2-Tools"
license=('GPL-2.0-or-later')
depends=('libusb')
makedepends=('cargo' 'git')
options=(!lto)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/OpenAnnePro/AnnePro2-Tools.git")
md5sums=('SKIP')

pkgver() {
	cd "$_sourcedir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_sourcedir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target $(rustc --print host-tuple)
}

build() {
	cd "$_sourcedir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_sourcedir"
	install -Dm 755 target/release/annepro2_tools -t "${pkgdir}/usr/bin"
}
