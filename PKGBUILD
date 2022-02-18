# Maintainer: lsaa <lsaadev dot personal at gmail dot com>

_pkgname=ddstats-rust
pkgname=${_pkgname}-git
pkgver=0.6.10.1
pkgrel=1
source=("${_pkgname}::git+https://github.com/lsaa/ddstats-rust")
makedepends=('rust-nightly-bin' 'libcap' 'mold' 'clang')
arch=('x86_64')
sha256sums=('SKIP')
b2sums=('SKIP')
provides=("ddstats-rust-bin")
conflicts=("ddstats-rust-bin")

pkgver() {
	cd "$srcdir/$_pkgname"
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
    cd "${_pkgname}"
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/ddstats-rust "${pkgdir}/usr/bin/ddstats-rust"
	setcap cap_sys_ptrace=eip "${pkgdir}/usr/bin/ddstats-rust"
	install -Dm644 default_cfg.ron "${pkgdir}/usr/share/doc/${_pkgname}/default_cfg.ron"
}
