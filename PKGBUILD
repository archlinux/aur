# Maintainer: Supernovatux <thulashitharan.d at gmail dot com>
_pkgname="enteauth-rs"
pkgname="${_pkgname}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=r5.e23eb5a
pkgrel=1
pkgdesc="Get 2FA codes via CLI (works with the official app)"
arch=('x86_64')
url="https://github.com/Supernovatux/${_pkgname}"
license=('GPL')
groups=()
depends=('ente-auth' 'sqlite')
optdepends=('wl-clipboard: Wayland copy support'
            'xclip: X11 copy support'
	    'xsel: X11 copy support')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('enteauth-rs')
conflicts=("enteauth-rs")
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

package() {
	cd "$srcdir/${_pkgname}"
        install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
