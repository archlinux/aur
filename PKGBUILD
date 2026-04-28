# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cesarferreira
_gitname=pirata
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Search and download torrents via the CLI"

pkgver=0.1.0
pkgrel=2
_gitversion=main
_gitcommit=35f9e954891aa567380e28f8badaa35978e3bbe2

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

replaces=("pirate-ctl")
provides=("${_appname}")
conflicts=("${_appname}" "pirate-ctl")

makedepends=('rust' 'openssl')
depends=('glibc' 'libgcc')

options=(!strip)

source=("git+${_ghurl}#commit=${_gitcommit}"
		"LICENSE")
sha256sums=('4350754f66f81b100ba3ef60e86901db8d35abff0d9a4c86f276e24285f84547'
            '79b001a83730c4e2c57553f5609a458ccdf818a819de1c7f8ff0fbb8c16b9aa2')


build() {
	cd ${srcdir}/${_gitname} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_gitname} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
