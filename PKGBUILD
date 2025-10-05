# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=lute-git
pkgver=0.1.0.nightly.20251005
pkgrel=1
pkgdesc='A standalone runtime for general-purpose Luau'
arch=('x86_64')
url='https://github.com/luau-lang/lute'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libldap' 'zstd')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip)
source=("git+$url.git"
		"build.sh"
		"fetch-dependencies.sh")
sha256sums=('SKIP'
			'9288f4bde241e8b0cb84e630a2ec1ec9086e68dbf47060fdd0ea8cb6b53a349b'
			'ac4fa6b6e347eef13943b650888fd0074d1f758823b95090600c650331e73f5f')

pkgver() {
	cd "lute"
	git describe --tags | sed 's/-/./g'
}

prepare() {
	cd "lute"
	rm "tools/bootstrap.sh"
	mv "../build.sh" "tools/build.sh"
	mv "../fetch-dependencies.sh" "tools/fetch-dependencies.sh"
	./tools/fetch-dependencies.sh
}

build() {
	cd "lute"
	if command -v lute &> /dev/null; then
		lute tools/luthier.luau build --clean lute
	else
		./tools/build.sh
	fi
}

package() {
	install -Dm755 "lute/build/debug/lute/cli/lute" "$pkgdir/usr/bin/lute"
	install -Dm644 "lute/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
