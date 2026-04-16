# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cesarferreira
_gitname=pirata
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Search and download torrents via the CLI"

pkgver=0.1.0
pkgrel=1
_gitversion=main
_gitcommit=6db55d878c9c5b2a0cfdc6748c10596a7025c488

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
sha256sums=('054fcbb913915ff7cca1765adb023da9b760f78062b9ed6ec0f520a27e0366e4'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc')


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
