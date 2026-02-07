# Maintainer: Alex Murkoff <413x1nkp@gmail.com>
pkgname=spu
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple playlist management utility"
arch=("x86_64")
url="https://codeberg.org/413x1nkp/spu"
license=("AGPL-3.0-only")
depends=(
	"glibc"
	"bash"
)

optdepends=("bash-completion: bash completion")
source=(
	"git+https://codeberg.org/413x1nkp/spu#tag=v${pkgver}"
	"argparse::git+https://github.com/cofyc/argparse"
	"spu.install"
)

sha256sums=(
	'd797c4a94d68b0a7a536f02b12c4583abbeb802816b26518d5bf4e0fa3b0aa28'
	'SKIP'
	'5bc84ad475235b7ff42dd917916e42fc92a0651022715d5ef8965cde02e9ad18'
)

install="spu.install"

prepare() {
	git -C "${srcdir}"/spu -c protocol.file.allow=always config submodule.thirdparty/argparse.url "${srcdir}"/argparse
	git -C "${srcdir}"/spu -c protocol.file.allow=always submodule update --init
	cd ${pkgname}/
	cc -o nob nob.c
}

build() {
	cd spu/
	./nob lin
}

package() {
	cd "${srcdir}"/spu

	install -Dm 755 -t "${pkgdir}"/usr/bin/ "out/spu"
	install -Dm 755 -t "${pkgdir}"/usr/bin/ "scripts/spu-play"
	install -Dm 755 -t "${pkgdir}"/usr/bin/ "scripts/spu-current-song"

	install -Dm 755 -T "scripts/spu-comp.sh" "${pkgdir}"/usr/share/bash-completion/completions/spu
	install -Dm 755 -T "scripts/spu-play-comp.sh" "${pkgdir}"/usr/share/bash-completion/completions/spu-play
}
