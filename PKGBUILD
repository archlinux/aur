# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=outfieldr-git
_pkgname="${pkgname%-git}"
pkgver=r85.76c3e58
pkgrel=2
pkgdesc='TLDR client in zig'
arch=('x86_64')
url='https://gitlab.com/ve-nt/outfieldr'
license=('MIT')
makedepends=('git' 'zig')
provides=("$_pkgname" 'tldr')
conflicts=("$_pkgname" 'tldr')
source=(
	"git+$url.git"
	'git+https://github.com/truemedian/zfetch.git'
	'git+https://github.com/Hejsil/zig-clap.git#branch=zig-master'
	'zig-tar::git+https://github.com/mattnite/tar.git'
	'git+https://github.com/MasterQ32/zig-network.git'
	'git+https://github.com/MasterQ32/zig-uri.git'
	'git+https://github.com/alexnask/iguanaTLS.git'
	'git+https://github.com/truemedian/hzzp.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	git submodule init
	git config submodule.deps/zfetch.url "${srcdir}/zfetch"
	git config submodule.deps/zig-clap.url "${srcdir}/zig-clap"
	git config submodule.deps/zig-clap.branch 'zig-master'
	git config submodule.deps/tar.url "${srcdir}/zig-tar"
	git config submodule.deps/zig-network.url "${srcdir}/zig-network"
	git config submodule.deps/zig-uri.url "${srcdir}/zig-uri"
	git config submodule.deps/iguanaTLS.url "${srcdir}/iguanaTLS"
	git config submodule.deps/hzzp.url "${srcdir}/hzzp"
	git submodule update

}

build() {
	cd "$_pkgname"

	zig build -Drelease-safe
}

package() {
	cd "$_pkgname"

	DESTDIR="${pkgdir}" zig build \
		-Drelease-safe \
		install

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
